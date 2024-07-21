use std::sync::{Arc};
use sea_orm::{DatabaseConnection, EntityTrait};
use tokio::sync::RwLock;
use tonic::{Request, Response, Status};
use crate::proto::wavenet::authentication_server::Authentication;
use crate::proto::wavenet::{GetArtistsResponse, LoginRequest, LoginResponse};
use crate::proto::wavenet::Artist as ArtistTonic;
use entity::artist::{Entity as ArtistDatabase,};

pub struct AuthenticationServiceRPC {
    database_connection: Arc<RwLock<DatabaseConnection>>
}

impl AuthenticationServiceRPC {
    //database connection
    pub fn new(database_connection: Arc<RwLock<DatabaseConnection>>) -> Self {
        Self {
            database_connection
        }
    }

}

#[tonic::async_trait]
impl Authentication for AuthenticationServiceRPC {
    async fn login(&self, _request: Request<LoginRequest>) -> Result<Response<LoginResponse>, Status> {
        let x = LoginResponse {
            status: 1,
            token: 1,
        };
        Ok(Response::new(x))
    }

    async fn logins(&self, _request: Request<LoginRequest>) -> Result<Response<GetArtistsResponse>, Status> {
        let database = {
            let lock = self.database_connection.read().await;
            (*lock).clone()
        };
        let artists = ArtistDatabase::find().all(&database as &DatabaseConnection).await.unwrap();
        let mut artists_mapped:Vec<ArtistTonic> = vec![];
        for artist in artists {
            artists_mapped.push(ArtistTonic {
                id: artist.id,
                name: artist.name.clone(),
            });
        }
        let x = GetArtistsResponse {
            artists: artists_mapped,
        };
        Ok(Response::new(x))
    }
}
