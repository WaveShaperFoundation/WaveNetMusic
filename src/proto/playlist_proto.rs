use std::sync::Arc;
use tokio::sync::RwLock;
use tonic::{Request, Response, Status};
use crate::proto::wavenet::{Empty, GetPlaylistRequest, GetPlaylistsResponse, PlaylistDetails, CreatePlaylistRequest, CreatePlaylistResponse, DeletePlaylistRequest, DeletePlaylistResponse, ChangePlaylistRequest, ChangePlaylistResponse, AddTrackToPlaylistRequest, AddTrackToPlaylistResponse, MoveTrackInPlaylistRequest, MoveTrackInPlaylistResponse, RemoveTrackFromPlaylistRequest, RemoveTrackFromPlaylistResponse, PlaylistTrack, Track, PlaylistResponse};
use crate::proto::wavenet::playlist_server::Playlist;
use crate::services::liked_service::LikesService;
use crate::services::playlist_service::PlaylistManagementService;
use crate::proto::wavenet::ActionResponse;
use crate::services::auth_service::AuthenticationService;

pub struct PlaylistServiceRPC {
    playlist_service:Arc<RwLock<PlaylistManagementService>>,
    authentication_service: Arc<RwLock<AuthenticationService>>,
}

impl PlaylistServiceRPC {
    //database connection
    pub fn new(playlist_service:Arc<RwLock<PlaylistManagementService>>,authentication_service: Arc<RwLock<AuthenticationService>>) -> Self {
        Self {
            playlist_service,
            authentication_service,
        }
    }
}

#[tonic::async_trait]
impl Playlist for PlaylistServiceRPC {
    async fn get_my_playlists(&self, request: Request<Empty>) -> Result<Response<GetPlaylistsResponse>, Status> {
        let wave_user = self.authentication_service.read().await.check_jwt_token(&request).await?;
        println!("{:?}", wave_user.clone());
        let user_id = wave_user.id;

        let playlist_service = self.playlist_service.read().await;
        let playlists = playlist_service.get_user_playlist(user_id).await?;

        Ok(Response::new( GetPlaylistsResponse {
            playlists: playlists.iter().map(|playlist| {
                PlaylistResponse {
                    id: playlist.id.clone(),
                    title: playlist.title.clone(),
                    description: playlist.description.clone(),
                    cover_source: playlist.cover_source.clone(),
                    created_at: 0,
                }
            }).collect::<Vec<PlaylistResponse>>(),
        }))
    }

    async fn get_playlist(&self, request: Request<GetPlaylistRequest>) -> Result<Response<PlaylistDetails>, Status> {
        let request_inner = request.into_inner();
        let playlist_id = request_inner.id;
        let playlist_service = self.playlist_service.write().await;
        let playlist = playlist_service.get_playlist_details(playlist_id).await;
        match playlist {
            Ok(playlist_details) => {
                let response = PlaylistDetails {
                    id: playlist_details.playlist.id.clone(),
                    title:  playlist_details.playlist.title.clone(),
                    description: playlist_details.playlist.clone().description.unwrap_or_else(|| "".to_string()),
                    cover_source:  playlist_details.playlist.clone().cover_source.unwrap_or_else(|| "".to_string()),
                    created_at: 0,
                    tracks: playlist_details.tracks.iter().map(|positioned_playlist_item| {
                        PlaylistTrack {
                            id: positioned_playlist_item.id,
                            track: Some(
                                Track {
                                    id: positioned_playlist_item.track.id,
                                    name: positioned_playlist_item.track.title.clone(),
                                    album: None,
                                    artists: positioned_playlist_item.track.artist.iter().map(|artist| {
                                        crate::proto::wavenet::Artist {
                                            id: artist.id,
                                            name: artist.name.clone(),
                                        }
                                    }).collect::<Vec<crate::proto::wavenet::Artist>>(),
                                    year: 0,
                                    length: positioned_playlist_item.track.length,
                                }
                            ),
                            added_by: positioned_playlist_item.added_by,
                            added_at: 0,
                            position: positioned_playlist_item.position,
                        }
                    }).collect::<Vec<PlaylistTrack>>(),
                };
                Ok(Response::new(response))
            }
            Err(_) => {
                Err(Status::not_found("Playlist not found"))
            }
        }
    }

    async fn create_playlist(&self, request: Request<CreatePlaylistRequest>) -> Result<Response<CreatePlaylistResponse>, Status> {
        let wave_user = self.authentication_service.read().await.check_jwt_token(&request).await?;

        let request_inner = request.into_inner();
        let title = request_inner.title.clone();
        let description = request_inner.description.clone();
        let creator_id = wave_user.id;
        let playlist_service = self.playlist_service.write().await;
        let playlist_id = playlist_service.create_playlist(title, description, creator_id).await.unwrap();
        let x = CreatePlaylistResponse {
            id: playlist_id,
            status: None
        };
        Ok(Response::new(x))
    }

    async fn delete_playlist(&self, _request: Request<DeletePlaylistRequest>) -> Result<Response<DeletePlaylistResponse>, Status> {
        todo!()
    }

    async fn change_playlist(&self, _request: Request<ChangePlaylistRequest>) -> Result<Response<ChangePlaylistResponse>, Status> {
        todo!()
    }

    async fn add_track_to_playlist(&self, request: Request<AddTrackToPlaylistRequest>) -> Result<Response<AddTrackToPlaylistResponse>, Status> {
        let wave_user = self.authentication_service.read().await.check_jwt_token(&request).await?;

        let request_inner = request.into_inner();
        let playlist_id = request_inner.playlist_id;
        let track_id = request_inner.track_id;
        let playlist_service = self.playlist_service.write().await;
        let added_by = wave_user.id;
        let id = playlist_service.add_track_to_playlist(playlist_id, track_id,added_by).await;
        match id {
            Ok(id) => {
                let x = AddTrackToPlaylistResponse {
                    added_track_id: id,
                    status: None
                };
                Ok(Response::new(x))
            },
            Err(error) => {
                Err(Status::from(error))
            }
        }
    }

    async fn move_track_in_playlist(&self, _request: Request<MoveTrackInPlaylistRequest>) -> Result<Response<MoveTrackInPlaylistResponse>, Status> {
        todo!()
    }

    async fn remove_track_from_playlist(&self, _request: Request<RemoveTrackFromPlaylistRequest>) -> Result<Response<RemoveTrackFromPlaylistResponse>, Status> {
        todo!()
    }
}
