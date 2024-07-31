use crate::models::album::{AlbumModel};
use crate::models::artist::{ArtistModel};
use crate::proto::wavenet::Track;
use crate::wavenet::Album;


#[derive(Clone)]
pub struct TrackModel<'a> {
    pub id: i32,
    pub artist: Vec<ArtistModel>,
    pub album: AlbumModel<'a>,
    pub title: String,
    pub length: i32,
    pub file_location: String,
}


impl std::fmt::Debug for TrackModel<'_> {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.debug_struct("TrackModel")
            .field("id", &self.id)
            .field("album", &self.album.name)
            .field("title", &self.title)
            .field("length", &self.length)
            .field("file_location", &self.file_location)
            .finish()
    }
}
