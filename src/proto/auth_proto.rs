use std::sync::{Arc};
use sea_orm::{DatabaseConnection};
use tokio::sync::RwLock;
use tonic::{Request, Response, Status};
use crate::proto::wavenet::authentication_server::Authentication;
use crate::proto::wavenet::{LoginRequest, LoginResponse};
use crate::services::auth_service::AuthenticationService;

use super::wavenet::{RegisterRequest, RegisterResponse};

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
        let user = authentication_service.authenticate_credentials(username, password).await;

        match user {
            Ok(user) => {
                let token = authentication_service.create_token(user).await.unwrap();
                let x = LoginResponse {
                    token: Some(token),
                };
                Ok(Response::new(x))
            },
            Err(error) => {
                Err(Status::unauthenticated(error.message.clone()))
            }
        }
    }

    async fn register(&self, _request: Request<RegisterRequest>) -> Result<Response<RegisterResponse>, Status> {
        let request_inner = _request.into_inner();
        let username = request_inner.username.clone();
        let password = request_inner.password.clone();
        let email = request_inner.email.clone();
        let public_name = request_inner.public_name.clone();

        let authentication_service = self.authentication_service.read().await;
        let user_created = authentication_service.create_user(username, password, email, public_name).await;
        match user_created {
            Ok(user) => {
                let token = authentication_service.create_token(user).await;
                match token {
                    Ok(token) => {
                        let x = RegisterResponse {
                            status: 1,
                            token: Some(token),
                        };
                        Ok(Response::new(x))
                    },
                    Err(_) => {
                        let x = RegisterResponse {
                            status: 0,
                            token: None,
                        };
                        Ok(Response::new(x))
                    }
                }
            },
            Err(_) => {
                let x = RegisterResponse {
                    status: 0,
                    token: None,
                };
                Ok(Response::new(x))
            }
        }
    }

}
