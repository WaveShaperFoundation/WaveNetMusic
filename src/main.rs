extern crate dotenv;

mod proto;
mod services;
mod models;
mod routes;

mod wavenet {
    include!("proto/wavenet.rs");
    pub(crate) const FILE_DESCRIPTOR_SET: &[u8] = tonic::include_file_descriptor_set!("store_descriptor");
}

use std::net::{Ipv4Addr, SocketAddr};
use std::sync::Arc;
use axum::response::{IntoResponse};
use axum::{Router};
use axum::routing::get;
use tonic::transport::Server;
use sea_orm::{DatabaseConnection};
use sea_orm::Database;
use tokio::sync::RwLock;
use migration::{Migrator, MigratorTrait};
use serde::Deserialize;
use tokio::io::AsyncReadExt;
use tonic::codegen::Service;
use tonic_web::GrpcWebLayer;
use crate::proto::wavenet::authentication_server::{AuthenticationServer};
use crate::proto::authentication_proto::AuthenticationServiceRPC;
use crate::services::library_service::LibraryService;
use crate::proto::library_proto::LibraryServiceRPC;
use crate::proto::wavenet::library_server::LibraryServer;
use crate::routes::axum_routes::{retrieve_album_cover, stream_audio_file};
use dotenv::dotenv;
use std::env;
use crate::models::error::WaveError;
use crate::services::search_service::SearchService;
use paris::Logger;

#[derive(Clone)]
struct AppState {
    db: Arc<RwLock<DatabaseConnection>>,
    library_service: Arc<RwLock<LibraryService>>,
}

#[tokio::main(flavor = "multi_thread",worker_threads = 8)]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    dotenv().ok();
    let mut log = Logger::new();
    log.info("Running WaveNet 1.0");
    let grpc_port = env::var("GRPC_PORT").unwrap_or_else(|_| "50051".to_string());
    let web_port = env::var("WEB_PORT").unwrap_or_else(|_| "3000".to_string());
    let postgres_url = env::var("POSTGRES_URL").unwrap_or_else(|_| "postgres://dogukan:sixfour@localhost:5432/wavenet".to_string());
    let meilsearch_url = env::var("MEILISEARCH_API_URL").unwrap_or_else(|_| "http://localhost:7700".to_string());
    let library_path = env::var("LIBRARY_PATH").unwrap_or_else(|_| "http://localhost:7700".to_string());

    let search_service = SearchService::new(meilsearch_url.clone(), None).await;
    //search_service.drop_all().await.unwrap();
    let search_service_arc = Arc::new(RwLock::new(search_service));

    let addr = SocketAddr::new(Ipv4Addr::new(0, 0, 0, 0).into(), grpc_port.parse().unwrap());

    log.info(format!("Connecting to database at port {}",postgres_url.clone()));
    let connection: DatabaseConnection = Database::connect(postgres_url).await?;
    Migrator::up(&connection, None).await?;

    let connection_arc = Arc::new(RwLock::new(connection));

    let library_service = LibraryService::new(connection_arc.clone(), search_service_arc.clone(), library_path.clone());
    let library_arc = Arc::new(RwLock::new(library_service));

    let library_service = library_arc.clone();
    let lib_clone = library_arc.clone();
    let library_services_clone = lib_clone.write().await.index_library().await;
    match library_services_clone {
        Ok(_) => {  }
        Err(error) => {
            println!("Error: {}",error);
        }
    }

    let reflection_service = tonic_reflection::server::Builder::configure()
        .register_encoded_file_descriptor_set(wavenet::FILE_DESCRIPTOR_SET)
        .build()
        .unwrap();

    let inventory = AuthenticationServiceRPC::new(connection_arc.clone());

    let auth_server = AuthenticationServer::new(inventory);

    let library_server = LibraryServer::new(LibraryServiceRPC::new(connection_arc.clone(), library_arc.clone(), search_service_arc.clone()));

    let state = AppState { db: connection_arc, library_service };

    let app = Router::new()
        .route("/song", get(stream_audio_file))
        .route("/cover", get(retrieve_album_cover))
        .with_state(state);

    tokio::spawn(async move {
        let listener = tokio::net::TcpListener::bind(format!("0.0.0.0:{}", web_port.clone())).await.unwrap();
        let mut log = Logger::new();
        log.info(format!("Axum is running at port {}",web_port.clone()));
        axum::serve(listener, app).await?;
        Ok::<_, Box<dyn std::error::Error + Send + Sync>>(())
    });

    log.info(format!("Tonic grPC is running at port {}",grpc_port.clone()));
    Server::builder()
        .accept_http1(true)
        .layer(GrpcWebLayer::new())
        .add_service(auth_server)
        .add_service(tonic_web::enable(library_server))
        .add_service(reflection_service)
        .serve(addr)
        .await?;
    println!("Tonic was running");

    Ok(())
}
