use std::sync::{Arc};
use sea_orm::{DatabaseConnection, EntityTrait};
use tokio::sync::RwLock;
use tonic::{Request, Response, Status};
use crate::proto::wavenet::authentication_server::Authentication;
use crate::proto::wavenet::{GetArtistsResponse, LoginRequest, LoginResponse};
use crate::proto::wavenet::Artist as ArtistTonic;
use crate::services::auth_proto::AuthenticationService;
use entity::artist::{Entity as ArtistDatabase};

pub struct AuthenticationServiceRPC {
    database_connection: Arc<RwLock<DatabaseConnection>>,
    authentication_service:Arc<RwLock<AuthenticationService>>
}

impl AuthenticationServiceRPC {
    //database connection
    pub fn new(database_connection: Arc<RwLock<DatabaseConnection>>, authentication_service:Arc<RwLock<AuthenticationService>>) -> Self {
        Self {
            database_connection,
            authentication_service
        }
    }

}

#[tonic::async_trait]
impl Authentication for AuthenticationServiceRPC {
    async fn login(&self, _request: Request<LoginRequest>) -> Result<Response<LoginResponse>, Status> {
        let request_inner = _request.into_inner();
        let username = request_inner.username.clone();
        let password = request_inner.password.clone();
        let authentication_service = self.authentication_service.read().await;
        let user = authentication_service.authenticate_credentials(username, password).await.unwrap();
        match user {
            Some(user) => {
                let token = authentication_service.create_token(user).await.unwrap();
                let x = LoginResponse {
                    status: 1,
                    token: Some(token),
                };
                Ok(Response::new(x))
            },
            None => {
                let x = LoginResponse {
                    status: 0,
                    token: None,
                };
                Ok(Response::new(x))
            }
        }
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
