use meilisearch_sdk::client::{Client};
use serde::Deserialize;
use meilisearch_sdk::documents::DocumentsResults;
use meilisearch_sdk::errors::Error;
use meilisearch_sdk::indexes::Index;
use meilisearch_sdk::search::{SearchQuery, SearchResults};
use meilisearch_sdk::settings::Settings;
use meilisearch_sdk::task_info::TaskInfo;
use crate::models::meili_models::{MeiliAlbum, MeiliArtist, MeiliTrack};


pub struct SearchService {
    api_url: String,
    api_key: Option<String>,
    client: Client,
    tracks_index: Index,
    artist_index: Index,
    album_index: Index,
}

impl SearchService {
    pub async fn new(api_url: String, api_key: Option<String>) -> Self {
        let client = Client::new(&api_url, api_key.clone());
        match client {
            Ok(client) => {
                let tracks_index = client.index("tracks");/*
                    .set_distinct_attribute("id")
                    .await?
                    .set_filterable_attributes(vec!["id","album.id"]);*/
                let artist_index = client.index("artists");/*
                    .set_distinct_attribute("id")
                    .await?
                    .set_filterable_attributes(vec!["id"]);*/
                let album_index = client.index("albums");/*
                    .set_distinct_attribute("id")
                    .await?
                    .
                    .set_filterable_attributes(vec!["id"]);*/
                Self {
                    api_url,
                    api_key,
                    client,
                    tracks_index,
                    artist_index,
                    album_index
                }
            }
            Err(e) => {
                panic!("Error creating MeiliSearch client: {}", e);
            }
        }
    }

    pub async fn drop_all(&self) -> Result<TaskInfo, Error> {
        self.tracks_index.delete_all_documents().await
    }

    pub async fn search(&self, query: &str) -> Result<SearchQueryResults, Error> {
        let tracks = self.tracks_index.search()
            .with_query(query)
            .execute::<MeiliTrack>()
            .await?;

        let artists = self.artist_index.search()
            .with_query(query)
            .execute::<MeiliArtist>()
            .await?;

        let albums = self.album_index.search()
            .with_query(query)
            .execute::<MeiliAlbum>()
            .await?;

        Ok(SearchQueryResults {
            tracks,
            artists,
            albums
        })
    }

    pub async fn search_tracks(&self, query: &str) -> Result<SearchResults<MeiliTrack>, Error> {
        self.tracks_index.search()
            .with_query(query)
            .execute::<MeiliTrack>()
            .await
    }

    pub async fn search_artists(&self, query: &str) -> Result<SearchResults<MeiliArtist>, Error> {
        self.artist_index.search()
            .with_query(query)
            .execute::<MeiliArtist>()
            .await
    }

    pub async fn add_album(&self, album: MeiliAlbum) -> Result<TaskInfo, Error> {
        self.album_index.add_documents(&[album],Some("id")).await
    }

    pub async fn add_artist(&self, artist: MeiliArtist) -> Result<TaskInfo, Error> {
        self.artist_index.add_documents(&[artist],Some("id")).await
    }

    pub async fn add_track(&self, track: MeiliTrack) -> Result<TaskInfo, Error> {
        self.tracks_index.add_documents(&[track],Some("id")).await
    }
}

pub struct SearchQueryResults{
    pub tracks: SearchResults<MeiliTrack>,
    pub artists: SearchResults<MeiliArtist>,
    pub albums: SearchResults<MeiliAlbum>,
}