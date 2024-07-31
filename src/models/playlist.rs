use chrono::NaiveDateTime;
use crate::models::artist::ArtistModel;
use crate::models::track::{TrackModel};
use crate::proto::wavenet::Track;

#[derive(Clone)]

pub struct PlaylistModel {
    pub id: i32,
    pub title: String,
    pub description: Option<String>,
    pub created_at: NaiveDateTime,
    pub cover_source: Option<String>,
}
#[derive(Clone)]

pub struct PlaylistUserModel {
    pub playlist_id: i32,
    pub user_id: i32,
    pub role_level: i32,
}
#[derive(Clone)]

pub struct PlaylistTrackItemModel {
    pub entry_id: i32,
    pub playlist_id: i32,
    pub track_id: i32,
    pub added_by: i32,
    pub added_at: NaiveDateTime,
    pub head_id: Option<i32>,
    pub tail_id: Option<i32>,
}
#[derive(Clone)]

pub struct PositionedPlaylistTrackItemModel{
    pub id: i32,
    pub playlist_id: i32,
    pub track: PositionedPlaylistTrackItemDetails,
    pub added_by: i32,
    pub added_at: NaiveDateTime,
    pub position: i32,
}

#[derive(Clone)]
pub struct PositionedPlaylistTrackItemDetails {
    pub id: i32,
    pub artist: Vec<ArtistModel>,
    pub title: String,
    pub length: i32,
}

#[derive(Clone)]
pub struct PlaylistDetails {
    pub playlist: PlaylistModel,
    pub tracks: Vec<PositionedPlaylistTrackItemModel>,
}

pub struct LikedTrackModel<'a> {
    pub added_at: NaiveDateTime,
    pub track: TrackModel<'a>,
}