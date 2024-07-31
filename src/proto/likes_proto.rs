use std::sync::Arc;
use tokio::sync::RwLock;
use tonic::{Request, Response, Status};
use crate::services::auth_service::AuthenticationService;
use crate::proto::wavenet::{AddTrackToLikedRequest, AddTrackToLikedResponse, Empty, GetTracksResponse, RemoveTrackFromLikedRequest, RemoveTrackFromLikedResponse};
use crate::services::liked_service::LikesService;
use crate::proto::wavenet::liked_tracks_server::LikedTracks;

pub struct LikesServiceRPC {
    likes_service:Arc<RwLock<LikesService>>,
    authentication_service: Arc<RwLock<AuthenticationService>>,
}

#[tonic::async_trait]
impl LikedTracks for LikesServiceRPC{
    async fn get_liked_songs(&self, request: Request<Empty>) -> Result<Response<GetTracksResponse>, Status> {
        let wave_user = self.authentication_service.read().await.check_jwt_token(&request).await?;
        let user_id = wave_user.id;

        let likes_service = self.likes_service.read().await;
        let liked_tracks = likes_service.get_liked_tracks(user_id).await;

        match liked_tracks {
            Ok(liked_tracks) => {
                Ok(Response::new(GetTracksResponse {
                    tracks: vec![]
                }))
            }
            Err(error) => {
                Err(Status::internal(error.to_string()))
            }
        }

     }

    async fn like_track(&self, request: Request<AddTrackToLikedRequest>) -> Result<Response<AddTrackToLikedResponse>, Status> {
        todo!()
    }

    async fn unlike_track(&self, request: Request<RemoveTrackFromLikedRequest>) -> Result<Response<RemoveTrackFromLikedResponse>, Status> {
        todo!()
    }
}