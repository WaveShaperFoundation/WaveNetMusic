use std::sync::{Arc};
use DbErr::RecordNotFound;
use meilisearch_sdk::reqwest::qualified_version;
use sea_orm::{ActiveModelTrait, ColumnTrait, DatabaseConnection, DbErr, EntityTrait, JoinType, NotSet, QueryFilter, QuerySelect};
use sea_orm::ActiveValue::Set;
use tokio::sync::RwLock;
use entity::user::Relation::UserLikes;
use entity::user_likes::Model;
use entity::user_likes::Relation::{Track, User};
use crate::models::error::WaveError;
use crate::models::playlist::LikedTrackModel;
use crate::models::track::TrackModel;

pub struct LikesService {
    pub database_connection: Arc<RwLock<DatabaseConnection>>
}

impl LikesService {
    pub fn new(database_connection: Arc<RwLock<DatabaseConnection>>) -> Self {
        Self {
            database_connection
        }
    }


    pub async fn get_liked_tracks(&self, user_id: i32) -> Result<Vec<LikedTrackModel>, WaveError> {
        todo!("Implement this function")
    }

    pub async fn like_track(&self, track_id: i32, user_id: i32) -> Result<(), WaveError> {
        let database_connection = self.database_connection.read().await;

        let like_active_model = entity::user_likes::ActiveModel {
            user_id: Set(user_id),
            track_id: Set(track_id),
            added_at: NotSet
        };

        match like_active_model.insert(&database_connection as &DatabaseConnection).await {
            Ok(database_entry) => {
                Ok(())
            }
            Err(error) => {
                Err(WaveError::from(error))
            }
        }

    }

    pub async fn is_liked_track(&self, track_id: i32, user_id: i32) -> Result<bool, WaveError> {
        let database_connection = self.database_connection.read().await;

        let liked_entry = entity::user_likes::Entity::find_by_id((user_id, track_id))
            .one(&database_connection as &DatabaseConnection)
            .await;

        match liked_entry {
            Ok(_) => {
                Ok(true)
            }
            Err(error) => {
                match error {
                    RecordNotFound(..) => {
                        Ok(false)
                    }
                    _ => {
                        Err(WaveError::from(error))
                    }
                }
            }
        }

    }

    pub async fn unlike_track(&self, track_id: i32, user_id: i32) -> Result<(), WaveError> {
        let database_connection = self.database_connection.read().await;

        let removed_like = entity::user_likes::Entity::delete_by_id((user_id, track_id))
            .exec(&database_connection as &DatabaseConnection)
            .await;

        match removed_like {
            Ok(_) => {
                Ok(())
            }
            Err(error) => {
                Err(WaveError::from(error))
            }
        }

    }


}