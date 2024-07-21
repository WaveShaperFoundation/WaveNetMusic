use std::fmt::{Debug, Formatter};
use audiotags::Picture;
use image::DynamicImage;
use crate::models::artist::ArtistModel;

#[derive(Clone)]
pub struct AlbumModel<'a> {
    pub id: i32,
    pub name: String,
    pub artists: Vec<ArtistModel>,
    pub blur_hash: Option<String>,
    pub dynamic_image: Option<Picture<'a>>,
    pub year: i32,
}

impl Debug for AlbumModel<'_>{
    fn fmt(&self, f: &mut Formatter<'_>) -> std::fmt::Result {
        f.debug_struct("AlbumModel")
            .field("id", &self.id)
            .field("name", &self.name)
            .field("artists", &self.artists[0].name)
            .field("year", &self.year)
            .finish()
    }
}