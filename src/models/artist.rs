use crate::proto::wavenet::Artist;

//Make it clonable
#[derive(Clone)]
pub struct ArtistModel {
    pub id: i32,
    pub name: String,
}

impl From<Artist> for ArtistModel {
    fn from(artist: Artist) -> Self {
        Self {
            id: artist.id,
            name: artist.name,
        }
    }
}