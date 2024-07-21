use std::any::Any;
use std::error::Error;
use image::ImageError;

#[derive(Debug)]
pub struct WaveError {
    pub message: String,
}

impl WaveError {
    pub fn string(message: String) -> WaveError {
        WaveError {
            message,
        }
    }

    pub fn new(message: &str) -> WaveError {
        WaveError {
            message: message.to_string(),
        }
    }
}

impl From<meilisearch_sdk::errors::Error> for WaveError {
    fn from(error: meilisearch_sdk::errors::Error) -> Self {
        WaveError {
            message: format!("{}", error),
        }
    }
}

impl std::fmt::Display for WaveError {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        write!(f, "{}", self.message)
    }
}

impl std::error::Error for WaveError {}

impl From<ImageError> for WaveError {
    fn from(error: ImageError) -> Self {
        WaveError {
            message: format!("{}", error),
        }
    }
}

impl From<std::io::Error> for WaveError {
    fn from(error: std::io::Error) -> Self {
        WaveError {
            message: format!("{}", error),
        }
    }
}

impl From<sea_orm::DbErr> for WaveError {
    fn from(error: sea_orm::DbErr) -> Self {
        WaveError {
            message: format!("{}", error),
        }
    }
}

impl From<std::string::String> for WaveError{
    fn from(error: std::string::String) -> Self {
        WaveError {
            message: error,
        }
    }
}

impl From<Box<dyn std::error::Error>> for WaveError {
    fn from(error: Box<dyn std::error::Error>) -> Self {
        WaveError {
            message: format!("{}", error),
        }
    }
}