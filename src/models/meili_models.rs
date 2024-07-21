use serde::{Serialize, Deserialize};
use entity::prelude::Track;

#[derive(Serialize, Deserialize, Debug)]
pub struct MeiliTrack{
    pub id: i32,
    pub name: String,
    pub artist: Vec<MeiliArtist>,
    pub album: MeiliAlbum,
    pub genre: String,
    pub year: i32,
}

#[derive(Serialize, Deserialize, Debug)]
pub struct MeiliAlbum{
    pub id: i32,
    pub name: String,
    pub year: i32,
}

#[derive(Serialize, Deserialize, Debug)]
pub struct MeiliArtist{
    pub id: i32,
    pub name: String,
}