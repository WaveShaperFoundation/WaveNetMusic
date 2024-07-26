use serde::{Serialize,Deserialize};

#[derive(Serialize, Deserialize, Debug)]
pub struct WaveUser{
    pub id: i32,
    pub username: String,
    pub public_name: String,
    pub email: String,
    pub password_hash: String,
    pub password_salt: String,
    pub role_level: i32,
}

impl WaveUser {
    pub fn new(id: i32, username: String, public_name: String, email: String, password_hash: String, password_salt: String, role_level: i32) -> Self {
        Self {
            id,
            username,
            public_name,
            email,
            password_hash,
            password_salt,
            role_level
        }
    }
}

pub struct WaveUserToken {
    pub id: i32,
    pub username: String,
    pub email: String,
    pub public_name: String,
    pub role_level: i32,
}

impl WaveUserToken {
    pub fn new(id: i32, username: String, email: String, public_name: String, role_level: i32) -> Self {
        Self {
            id,
            username,
            email,
            public_name,
            role_level
        }
    }
}
