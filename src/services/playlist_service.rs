use std::collections::HashMap;
use std::error::Error;
use std::sync::Arc;
use clap::builder::TypedValueParser;
use sea_orm::ActiveValue::{Set, Unchanged};
use sea_orm::{ActiveModelTrait, Condition, DatabaseBackend, DatabaseConnection, DbBackend, EntityOrSelect, EntityTrait, IntoActiveModel, LoaderTrait, ModelTrait, NotSet, QueryFilter, QuerySelect, QueryTrait, Related, TransactionTrait, TryIntoModel};
use tokio::sync::RwLock;
use crate::models::error::WaveError;
use crate::models::playlist::{PlaylistModel, PlaylistDetails, PositionedPlaylistTrackItemModel, PositionedPlaylistTrackItemDetails};
use sea_orm::ColumnTrait;
use migration::JoinType;
use crate::models::artist::ArtistModel;
use crate::services::auth_service::AuthenticationService;

pub struct PlaylistManagementService {
    database_connection: Arc<RwLock<DatabaseConnection>>,
}

impl PlaylistManagementService {
    pub fn new(database_connection: Arc<RwLock<DatabaseConnection>>) -> Self {
        Self {
            database_connection,
        }
    }

    pub async fn get_playlist_details(&self, playlist_id: i32) -> Result<PlaylistDetails, WaveError> {
        let con = self.database_connection.read().await;

        // Retrieve playlist for general information
        let playlist = entity::playlist::Entity::find()
            .filter(entity::playlist::Column::Id.eq(playlist_id))
            .one(&con as &DatabaseConnection)
            .await;

        // Resolve playlist result of database
        let playlist = match playlist {
            Ok(playlist) => match playlist {
                Some(playlist) => playlist,
                None => {
                    eprintln!("No playlist found");
                    return Err(WaveError::new("No playlist found"));
                }
            },
            Err(e) => {
                eprintln!("Error getting playlist: {:?}", e);
                return Err(WaveError::new("Error getting playlist"));
            }
        };

        // Retrieve tracks of selected playlist
        let playlist_tracks = entity::playlist_track_item::Entity::find()
            .filter(entity::playlist_track_item::Column::PlaylistId.eq(playlist_id))
            .all(&con as &DatabaseConnection)
            .await;

        // Resolve playlist tracks result of database
        let playlist_tracks = match playlist_tracks {
            Ok(playlist_tracks) => playlist_tracks,
            Err(e) => {
                eprintln!("Error getting playlist tracks: {:?}", e);
                return Err(WaveError::new("Error getting playlist tracks"));
            }
        };

        // Initialize vector for playlist track items
        let mut playlist_track_items: Vec<PositionedPlaylistTrackItemModel> = vec![]; // sorted by position
        let mut tracks_playlist_hash_map = HashMap::new(); // tracks in playlist
        let mut tracks_resolved_hash_map = HashMap::new(); // tracks resolved in playlist

        let mut first_track_id = None; // Get first track of playlist
        let mut last_track_id = None; // Get last track of playlist


        // SQL resolver for playlist tracks, with multiple where clauses
        let mut database_filter = Condition::any();

        // Iterate over playlist tracks and insert them into hashmap
        for playlist_track in playlist_tracks {
            let track_model = match playlist_track.try_into_model() {
                Ok(track) => track,
                Err(e) => {
                    eprintln!("Error converting track to model: {:?}", e);
                    return Err(WaveError::new("Error getting playlist tracks"));
                }
            };
            // Checks whether track is first or last track of playlist
            if (track_model.previous_cursor_id.is_none()) {
                first_track_id = Some(track_model.id);
            }
            if (track_model.next_cursor_id.is_none()) {
                last_track_id = Some(track_model.id);
            }
            // Add WHERE clause to select statement to resolve
            println!("Added to clause the track with id {:?}", track_model.track_id);
            database_filter = database_filter.add(entity::track::Column::Id.eq(track_model.track_id));
            // Add to hashmap for ordering the playlist by the next_cursor_id and previous_cursor_id
            tracks_playlist_hash_map.insert(track_model.id, track_model);
        }

        // SQL resolver for playlist tracks, with multiple where clauses
        let mut playlist_sql_resolver = entity::track::Entity::find()
            .filter(database_filter)
            .find_with_related(entity::artist::Entity);

        // Resolve tracks of playlist from database
        let resolved_tracks = match playlist_sql_resolver.all(&con as &DatabaseConnection).await {
            Ok(resolved_tracks) => resolved_tracks,
            Err(e) => {
                eprintln!("Error getting resolved tracks: {:?}", e);
                return Err(WaveError::new("Error getting resolved tracks"));
            }
        };

        // Iterate over resolved tracks and insert them into hashmap
        for track in resolved_tracks {
            let track = match track.0.clone().try_into_model() {
                Ok(track_model) => {
                    println!("Track resolved: {:?}", track_model.clone());
                    track.clone()
                }
                Err(e) => {
                    eprintln!("Error converting track to model: {:?}", e);
                    return Err(WaveError::new("Error getting playlist tracks"));
                }
            };
            tracks_resolved_hash_map.insert(track.0.id, track);
        }

        let mut current_track_next_cursor_id = match first_track_id {
            Some(first_track_id) => Some(first_track_id),
            None => {
                eprintln!("No first track found");
                return Err(WaveError::new("No first track found"));
            }
        };

        while current_track_next_cursor_id.is_some() {
            let mut track_id = current_track_next_cursor_id.clone().unwrap();

            let current_track = match tracks_playlist_hash_map.get(&track_id) {
                Some(current_track) => current_track.clone(),
                None => {
                    eprintln!("No track found in hashmap");
                    return Err(WaveError::new("No track found in hashmap"));
                }
            };

            let current_resolved_track = match tracks_resolved_hash_map.get(&current_track.track_id) {
                Some(current_resolved_track) => current_resolved_track.clone(),
                None => {
                    eprintln!("No resolved track found in hashmap, searching for track with id {:?}", track_id);
                    return Err(WaveError::new("No resolved track found in hashmap"));
                }
            };

            playlist_track_items.push(PositionedPlaylistTrackItemModel {
                id: current_track.id,
                playlist_id: current_track.playlist_id,
                track: PositionedPlaylistTrackItemDetails {
                    id: current_track.track_id,
                    artist: current_resolved_track.1.iter().map(|artist| {
                        ArtistModel {
                            id: artist.id,
                            name: artist.name.clone(),
                        }
                    }).collect(),
                    title: current_resolved_track.0.title,
                    length: current_resolved_track.0.length,
                },
                added_by: current_track.adder_id,
                added_at: current_track.added_at,
                position: playlist_track_items.len() as i32,
            });
            current_track_next_cursor_id = current_track.next_cursor_id;
        }

        Ok(PlaylistDetails {
            playlist: PlaylistModel {
                id: playlist.id.clone(),
                title: playlist.title.clone(),
                description: playlist.description.clone(),
                created_at: playlist.created_at.clone(),
                cover_source: playlist.cover_source.clone(),
            },
            tracks: playlist_track_items,
        })
    }


    pub async fn get_user_playlist(&self, user_id: i32) -> Result<Vec<PlaylistModel>, WaveError> {
        let con = self.database_connection.read().await;

        let playlist_user = entity::playlist_user::Entity::find()
            .filter(entity::playlist_user::Column::UserId.eq(user_id))
            .all(&con as &DatabaseConnection)
            .await;

        let playlist_user = match playlist_user {
            Ok(playlist_user) => {
                println!("Playlist user: {:?}", playlist_user.clone());
                playlist_user
            },
            Err(e) => {
                eprintln!("Error getting playlist_user: {:?}", e);
                return Err(WaveError::new("Error getting playlist_user"));
            }
        };

        let mut select_filter = Condition::any();

        for user_playlist in playlist_user {
            println!("User playlist pushed: {:?}", user_playlist.clone());
            select_filter = select_filter.add(entity::playlist::Column::Id.eq(user_playlist.playlist_id));
        }

        let playlists = entity::playlist::Entity::find()
            .filter(select_filter);

        println!("Playlists: {:?}", playlists.clone().build(DatabaseBackend::Postgres).to_string());

        let playlists = playlists
            .all(&con as &DatabaseConnection)
            .await;

        let playlists = match playlists {
            Ok(playlists) => playlists,
            Err(e) => {
                eprintln!("Error getting playlists: {:?}", e);
                return Err(WaveError::new("Error getting playlists"));
            }
        };

        let mut playlist_models = vec![];

        for playlist in playlists {
            playlist_models.push(PlaylistModel {
                id: playlist.id.clone(),
                title: playlist.title.clone(),
                description: playlist.description.clone(),
                created_at: playlist.created_at.clone(),
                cover_source: playlist.cover_source.clone(),
            });
        }

        Ok(playlist_models)
    }

    pub async fn create_playlist(&self, title: String, description: String, creator_id: i32) -> Result<i32, WaveError> {
        let con = self.database_connection.read().await;

        let txn_result = con.begin().await;

        let txn = match txn_result {
            Ok(txn) => txn,
            Err(e) => {
                eprintln!("Error starting transaction: {:?}", e);
                return Err(WaveError::new("Error starting transaction"));
            }
        };

        let playlist = entity::playlist::ActiveModel {
            id: NotSet,
            title: Set(title),
            description: Set(Some(description)),
            created_at: Set(chrono::Utc::now().naive_utc()),
            cover_source: NotSet,
        }.insert(&txn).await;

        let playlist_id = match playlist {
            Ok(playlist) => playlist.id,
            //Ok(playlist) => playlist.get(entity::playlist::Column::Id),
            Err(e) => {
                eprintln!("Error saving playlist: {:?}", e);
                eprintln!("Error too {:?}", e.source());
                txn.rollback().await.unwrap();
                return Err(WaveError::new("Error saving playlist"));
            }
        };

        println!("Playlist ID: {:?}", playlist_id);

        let playlist_user = entity::playlist_user::ActiveModel {
            playlist_id: Set(playlist_id.clone()),
            user_id: Set(creator_id),
            role_level: Set(1),
        }.insert(&txn).await;

        match playlist_user {
            Ok(_) => {
                let transaction = txn.commit().await;
                match transaction {
                    Ok(_) => {
                        return Ok(playlist_id);
                    }
                    Err(e) => {
                        eprintln!("Error committing transaction: {:?}", e);
                        return Err(WaveError::new("Error saving playlist"));
                    }
                }
            }
            Err(e) => {
                eprintln!("Error saving playlist_user: {:?}", e);
                txn.rollback().await.unwrap();
                return Err(WaveError::new("Error saving playlist_user"));
            }
        }
    }

    pub async fn add_track_to_playlist(&self, playlist_id: i32, track_id: i32, added_by: i32) -> Result<i32, WaveError> {
        let con = self.database_connection.read().await;

        let txn_result = con.begin().await;

        let txn = match txn_result {
            Ok(txn) => txn,
            Err(e) => {
                eprintln!("Error starting transaction: {:?}", e);
                return Err(WaveError::new("Error starting transaction"));
            }
        };

        let is_eligible = entity::playlist_user::Entity::find()
            .filter(entity::playlist_user::Column::PlaylistId.eq(playlist_id))
            .filter(entity::playlist_user::Column::UserId.eq(added_by))
            .one(&txn)
            .await;

        let is_eligible = match is_eligible {
            Ok(user) => {
                println!("User found in playlist");
                user
            }
            Err(e) => {
                eprintln!("Error getting user in playlist: {:?}", e);
                txn.rollback().await.unwrap();
                return Err(WaveError::new("Error getting user in playlist"));
            }
        };

        let last_track_in_database = entity::playlist_track_item::Entity::find()
            .filter(entity::playlist_track_item::Column::PlaylistId.eq(playlist_id))
            .filter(entity::playlist_track_item::Column::NextCursorId.is_null())
            .one(&txn)
            .await;

        let last_track_in_database = match last_track_in_database {
            Ok(track) => {
                println!("Parsing option of last track in database");
                track
            }
            Err(e) => {
                eprintln!("Error getting last track in playlist: {:?}", e);
                txn.rollback().await.unwrap();
                return Err(WaveError::new("Error getting last track in playlist"));
            }
        };


        let mut new_track_in_playlist = entity::playlist_track_item::ActiveModel {
            id: NotSet,
            playlist_id: Set(playlist_id),
            track_id: Set(track_id),
            added_at: Set(chrono::Utc::now().naive_utc()),
            next_cursor_id: Set(None),
            previous_cursor_id: Set(None),
            adder_id: Set(added_by),
        };

        println!("New track without header and tails");

        match last_track_in_database {
            Some(track) => {
                println!("Track in database already found, it is: {:?}", track.clone().id);
                let mut last_track_active_model = track.into_active_model();
                new_track_in_playlist.previous_cursor_id = last_track_active_model.clone().id.into();
                let new_track_in_playlist = match new_track_in_playlist.insert(&txn).await {
                    Ok(new_track_in_playlist) => {
                        println!("New track in playlist inserted successfully");
                        new_track_in_playlist
                    }
                    Err(e) => {
                        eprintln!("Error saving new track in playlist: {:?}", e);
                        txn.rollback().await.unwrap();
                        return Err(WaveError::new("Error saving new track in playlist"));
                    }
                };
                last_track_active_model.next_cursor_id = Set(Some(new_track_in_playlist.id));
                match last_track_active_model.save(&txn).await {
                    Ok(_) => {
                        println!("Last track in playlist saved successfully");
                        match txn.commit().await {
                            Ok(_) => {
                                println!("Transaction committed successfully");
                                Ok(new_track_in_playlist.id)
                            }
                            Err(e) => {
                                eprintln!("Error committing transaction: {:?}", e);
                                Err(WaveError::new("Error saving playlist"))
                            }
                        }
                    }
                    Err(e) => {
                        eprintln!("Error saving last track in playlist: {:?}", e);
                        txn.rollback().await.unwrap();
                        return Err(WaveError::new("Error saving last track in playlist"));
                    }
                }
            }
            None => {
                println!("No track in database found");
                match new_track_in_playlist.insert(&txn).await {
                    Ok(new_track_in_playlist) => {
                        println!("New track in playlist inserted successfully");
                        match txn.commit().await {
                            Ok(_) => {
                                println!("Transaction committed successfully");
                                Ok(new_track_in_playlist.id)
                            }
                            Err(e) => {
                                eprintln!("Error committing transaction: {:?}", e);
                                return Err(WaveError::new("Error saving playlist"));
                            }
                        }
                    }
                    Err(e) => {
                        eprintln!("Error saving new track in playlist: {:?}", e);
                        txn.rollback().await.unwrap();
                        return Err(WaveError::new("Error saving new track in playlist"));
                    }
                }
            }
        }
    }
}