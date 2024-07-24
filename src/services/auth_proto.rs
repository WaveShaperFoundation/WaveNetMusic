use crate::models::error::WaveError;
use std::{collections::BTreeMap, sync::Arc};
use sea_orm::DatabaseConnection;
use tokio::sync::RwLock;
use hmac::{Hmac, Mac};
use sha2::Sha256;



pub struct AuthenticationService {
    database_connection: Arc<RwLock<DatabaseConnection>>,
    authentication_token: String,
}

impl AuthenticationService {

    pub fn new(database_connection: Arc<RwLock<DatabaseConnection>>, authentication_token: String) -> Self {
        Self {
            database_connection,
            authentication_token
        }
    }

    pub async fn authenticate_credentials(&self, username: String, password: String) -> Result<bool,WaveError> {
        let connection = self.database_connection.clone();
        let con = connection.read().await;

        let user = entity::user::Entity::find()
            .filter()
            .user_name()
            .eq(username)
            .one(&con as &DatabaseConnection)
            .await
            .map_err(|e| WaveError::from(e))?;

        Ok(true)
    }

    pub fn create_token() -> String {
        "asdf".to_string()   
    }
}