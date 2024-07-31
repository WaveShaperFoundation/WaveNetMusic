use serde::{Serialize,Deserialize};

#[derive(Serialize, Deserialize, Debug)]
pub struct WaveUser{
    pub id: i32,
    pub username: String,
    pub public_name: String,
    pub email: String,
    pub password_hash: String,
    pub role_level: i32,
}

impl WaveUser {
    pub fn new(id: i32, username: String, public_name: String, email: String, password_hash: String, role_level: i32) -> Self {
        Self {
            id,
            username,
            public_name,
            email,
            password_hash,
            role_level
        }
    }
}

#[derive(Serialize, Deserialize, Debug, Clone)]
pub struct WaveUserToken {
    pub id: i32,
    pub username: String
}

impl WaveUserToken {
    pub fn new(id: i32, username: String) -> Self {
        Self {
            id,
            username,
        }
    }
}
