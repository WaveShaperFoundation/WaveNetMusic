use crate::models::error::WaveError;
use crate::models::user::{WaveUser, WaveUserToken};
use std::{collections::BTreeMap, sync::Arc};
use std::panic::catch_unwind;
use argon2::password_hash::rand_core::OsRng;
use argon2::password_hash::SaltString;
use argon2::{Argon2, PasswordHash, PasswordHasher, PasswordVerifier};
use jwt::SignWithKey;
use sea_orm::{ActiveModelBehavior, ActiveValue, DatabaseConnection, EntityTrait, IntoActiveModel};
use tokio::sync::RwLock;
use hmac::{Hmac, Mac};
use sha2::Sha256;
use entity::user::{self, ActiveModel as UserActiveModel};
use entity::prelude::User as User;
use jwt::VerifyWithKey;
use sea_orm::ActiveModelTrait;
use sea_orm::QueryFilter;
use sea_orm::ColumnTrait;
use tonic::{Request, Status};
use tonic::metadata::{Ascii, MetadataValue};

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
        let password_input_bytes = password.as_bytes();


        let user = User::find()
            .filter(user::Column::UserName.eq(username.clone()))
            .one(&con as &DatabaseConnection)
            .await?;

        let user_instance = match user {
            Some(user) => user,
            None => return Ok(Option::None)
        };

        let argon2 = Argon2::default();
        let password_hash = match PasswordHash::new(user_instance.password_hash.as_str()) {
            Ok(password_hash) => password_hash,
            Err(_) => return Err(WaveError::new("Failed to hash password"))
        };

        let authenticated = argon2.verify_password(password_input_bytes, &password_hash).is_ok();

        if authenticated {
            Ok(Some(WaveUser::new(user_instance.id, user_instance.user_name, user_instance.public_name, user_instance.email, user_instance.password_hash, user_instance.role_level)))
        } else {
            Ok(Option::None)
        }
    }

    pub async fn create_token(&self, user:WaveUser) -> Result<String,WaveError> {
        let key: Hmac<Sha256> = Hmac::new_from_slice(self.authentication_token.as_bytes())
        .map_err(|_| WaveError::new("Failed to create token"))?;

        let mut claims = BTreeMap::new();
        claims.insert("id", user.id.to_string());
        claims.insert("username", user.username.to_string());

        let token_string = claims.sign_with_key(&key);

        match token_string {
            Ok(token_string) => Ok(token_string),
            Err(_) => Err(WaveError::new("Failed to create token"))
        }
    }

    pub async fn verify_token(&self, token:String) -> Result<WaveUserToken,WaveError> {
        let key: Hmac<Sha256> = Hmac::new_from_slice(self.authentication_token.as_bytes())
        .map_err(|_| WaveError::new("Failed to create token"))?;
        let claims: BTreeMap<String,String> = token.verify_with_key(&key)
        .map_err(|_| WaveError::new("Failed to verify token"))?;


        let id = claims.get("id").unwrap().parse::<i32>().unwrap();
        let username = claims.get("username").unwrap().to_string();

        Ok(WaveUserToken::new(id, username))
    }

    pub async fn create_user(&self, username: String, password: String, email: String, public_name: String) -> Result<WaveUser,WaveError> {
        let connection = self.database_connection.clone() ;
        let con = connection.read().await;

        let password_bytes = password.as_bytes();
        let salt = SaltString::generate(&mut OsRng);
        let argon2 = Argon2::default();

        let password_hash = argon2.hash_password(password_bytes, &salt);
        match password_hash {
            Ok(password_hash) => {
                let user = UserActiveModel {
                    id: ActiveValue::NotSet,
                    user_name: ActiveValue::set(username.clone()),
                    public_name: ActiveValue::set(public_name.clone()),
                    email: ActiveValue::set(email.clone()),
                    password_hash: ActiveValue::set(password_hash.to_string()),
                    role_level: ActiveValue::set(1),
                };

                let user_insert = user.insert(&con as &DatabaseConnection).await?;

                Ok(WaveUser::new(user_insert.id, user_insert.user_name, user_insert.public_name, user_insert.email, user_insert.password_hash, user_insert.role_level))
            },
            Err(_) => Err(WaveError::new("Failed to hash password"))
            
        }
    }

    pub async fn check_jwt_token<T>(&self, req: &Request<T>) -> Result<WaveUserToken, WaveError> {

        println!("{:?}",req.metadata());
        let token = req.metadata().get("auth_token");
        let token_string = match token {
            None => {
                return Err(WaveError::new("No valid auth token provided"));
            }
            Some(token) => token.to_str().unwrap()
        };

        match self.verify_token(String::from(token_string)).await {
            Ok(token_verify) => Ok(token_verify),
            Err(_) => Err(WaveError::new("Failed to verify token"))
        }
    }
}