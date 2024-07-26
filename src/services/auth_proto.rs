use crate::models::error::WaveError;
use crate::models::user::WaveUser;
use std::{collections::BTreeMap, sync::Arc};
use jwt::SignWithKey;
use sea_orm::{ActiveModelBehavior, DatabaseConnection, EntityTrait, IntoActiveModel};
use tokio::sync::RwLock;
use hmac::{Hmac, Mac};
use sha2::Sha256;
use entity::user::{self, ActiveModel as UserActiveModel};
use entity::prelude::User as User;
use jwt::VerifyWithKey;
use sea_orm::ActiveModelTrait;
use sea_orm::QueryFilter;
use sea_orm::ColumnTrait;

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

    pub async fn authenticate_credentials(&self, username: String, password: String) -> Result<Option<WaveUser>,WaveError> {
        let connection = self.database_connection.clone();
        let con = connection.read().await;


        let user = User::find()
            .filter(user::Column::UserName.eq(username.clone()))
            .one(&con as &DatabaseConnection)
            .await?;


        match user {
            Some(user) => Ok(Some(WaveUser::new(user.id, user.user_name, user.public_name, user.email, user.password_hash, user.password_salt, user.role_level))),
            None => return Ok(Option::None)
        }
    }

    pub async fn create_token(&self, user:WaveUser) -> Result<String,WaveError> {
        let key: Hmac<Sha256> = Hmac::new_from_slice(self.authentication_token.as_bytes())
        .map_err(|_| WaveError::new("Failed to create token"))?;

        let mut claims = BTreeMap::new();
        claims.insert("id", user.id.to_string());
        claims.insert("username", user.username.to_string());
        claims.insert("email", user.email.to_string());

        let token_string = claims.sign_with_key(&key);

        match token_string {
            Ok(token_string) => Ok(token_string),
            Err(_) => Err(WaveError::new("Failed to create token"))
        }
    }

    pub async fn verify_token(&self, token:String) -> Result<WaveUser,WaveError> {
        let key: Hmac<Sha256> = Hmac::new_from_slice(self.authentication_token.as_bytes())
        .map_err(|_| WaveError::new("Failed to create token"))?;
        let claims: BTreeMap<String,String> = token.verify_with_key(&key)
        .map_err(|_| WaveError::new("Failed to verify token"))?;

        let id = claims.get("id").unwrap().parse::<i32>().unwrap();
        let username = claims.get("username").unwrap().to_string();
        let email = claims.get("email").unwrap().to_string();
        let public_name = claims.get("public_name").unwrap().to_string();
        let role_level = claims.get("role_level").unwrap().parse::<i32>().unwrap();

        Ok(WaveUser::new(id, username, public_name, email, "".to_string(), "".to_string(), role_level))

    }

    pub async fn create_user(&self, username: String, password: String, email: String, public_name: String) -> Result<bool,WaveError> {
        let connection = self.database_connection.clone();
        let con = connection.read().await;

        let user = UserActiveModel {
            id: None,
            user_name: username.clone(),
            public_name: public_name.clone(),
            email: email.clone(),
            password_hash: "".to_string(),
            password_salt: "".to_string(),
            role_level: 0
        };

        let user_insert = user.insert(&con as &DatabaseConnection).await?;

        Ok(true)
    }
}