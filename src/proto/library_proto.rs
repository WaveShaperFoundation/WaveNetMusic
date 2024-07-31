use std::sync::{Arc};
use sea_orm::DatabaseConnection;
use tokio::sync::RwLock;
use tonic::{Request, Response, Status};
use crate::proto::wavenet::library_server::Library;
use crate::services::library_service::LibraryService;
use crate::proto::wavenet::{Album, AlbumDetails, AlbumTrack, ArtistWithAlbums, Empty, GetAlbumRequest, GetAlbumsResponse, GetArtistRequest, GetArtistsResponse, GetTrackRequest, GetTracksResponse, SearchQueryRequest, SearchQueryResponse, Track};
use crate::services::search_service::SearchService;
use crate::wavenet::Artist;

pub struct LibraryServiceRPC {
    database_connection: Arc<RwLock<DatabaseConnection>>,
    library_service: Arc<RwLock<LibraryService>>,
    search_service: Arc<RwLock<SearchService>>,
}

impl LibraryServiceRPC {
    //database connection
    pub fn new(database_connection: Arc<RwLock<DatabaseConnection>>, library_service: Arc<RwLock<LibraryService>>, search_service: Arc<RwLock<SearchService>>) -> Self {
        Self {
            database_connection,
            library_service,
            search_service
        }
    }
}

#[tonic::async_trait]
impl Library for LibraryServiceRPC {
    async fn get_albums(&self, _: Request<Empty>) -> Result<Response<GetAlbumsResponse>, Status> {
        let library_service = self.library_service.read().await;
        let albums = library_service.get_albums().await.expect("Error getting albums");
        let mut albums_mapped: Vec<Album> = vec![];
        for album in albums {
            albums_mapped.push(Album {
                id: album.id,
                name: album.name.clone(),
                artists: vec![],
                year: album.year,
                blurhash: album.blur_hash.unwrap_or_else(|| "".to_string()),
            });
        }
        Ok(Response::new(GetAlbumsResponse {
            albums: albums_mapped,
        }.to_owned()))
    }

    async fn get_album(&self, request: Request<GetAlbumRequest>) -> Result<Response<AlbumDetails>, Status> {
        let library_service = self.library_service.read().await;
        let album = library_service.get_album(request.into_inner().id).await.expect("Error getting album");
        let tracks = library_service.get_tracks_of_album(album.id).await.expect("Error getting album tracks");
        Ok(Response::new(AlbumDetails {
            id: album.id,
            name: album.name.clone(),
            artists: album.artists.iter().map(|artist| crate::proto::wavenet::Artist {
                id: artist.id,
                name: artist.name.clone(),
            }).collect::<Vec<crate::proto::wavenet::Artist>>(),
            year: album.year,
            blurhash: album.blur_hash.unwrap_or_else(|| "".to_string()),
            tracks: tracks.iter().map(|track| AlbumTrack {
                id: track.id,
                name: track.title.clone(),
                year: track.album.year,
                artists: vec![],
                length: track.length
            }).collect::<Vec<AlbumTrack>>()
        }.to_owned()))
    }

    async fn get_tracks(&self, _request: Request<Empty>) -> Result<Response<GetTracksResponse>, Status> {
        let library_service = self.library_service.read().await;
        let tracks = library_service.get_tracks().await.expect("Error getting tracks");
        let mut tracks_mapped: Vec<crate::proto::wavenet::Track> = vec![];
        for track in tracks {
            tracks_mapped.push(crate::proto::wavenet::Track {
                id: track.id,
                name: track.title.clone(),
                album: Option::None,
                year: track.album.year,
                artists: vec![],
                length: track.length
            });
        }
        Ok(Response::new(GetTracksResponse {
            tracks: tracks_mapped,
        }.to_owned()))
    }

    async fn get_album_tracks(
        &self,
        request: Request<GetAlbumRequest>,
    ) -> std::result::Result<
        Response<GetTracksResponse>,
        tonic::Status,
    > {
        let library_service = self.library_service.read().await;
        let tracks = library_service.get_tracks_of_album(request.into_inner().id).await.expect("Error getting album tracks");
        let mut tracks_mapped: Vec<crate::proto::wavenet::Track> = vec![];
        for track in tracks {
            tracks_mapped.push(crate::proto::wavenet::Track {
                id: track.id,
                name: track.title.clone(),
                album: Option::None,
                year: track.album.year,
                artists: vec![],
                length: track.length
            });
        }
        Ok(Response::new(GetTracksResponse {
            tracks: tracks_mapped,
        }.to_owned()))
    }

    async fn get_track(&self, request: Request<GetTrackRequest>) -> Result<Response<Track>, Status> {
        let library_service = self.library_service.read().await;
        let track = library_service.get_track(request.into_inner().id).await.expect("Error getting track");
        let album = track.album;
        Ok(Response::new(Track {
            id: track.id,
            name: track.title.clone(),
            album: Some(Album {
                id: album.id,
                name: album.name.clone(),
                year: album.year,
                artists: album.artists.iter().map(|artist| crate::proto::wavenet::Artist {
                    id: artist.id,
                    name: artist.name.clone(),
                }).collect::<Vec<crate::proto::wavenet::Artist>>(),
                blurhash: album.blur_hash.unwrap_or_else(|| "".to_string()),
            }),
            length: track.length,
            year: album.year,
            artists: track.artist.iter().map(|artist| crate::proto::wavenet::Artist {
                id: artist.id,
                name: artist.name.clone(),
            }).collect::<Vec<crate::proto::wavenet::Artist>>()
        }.to_owned()))
    }

    async fn get_artists(&self, _request: Request<Empty>) -> Result<Response<GetArtistsResponse>, Status> {
        todo!()
    }

    async fn get_artist(&self, _request: Request<GetArtistRequest>) -> Result<Response<ArtistWithAlbums>, Status> {
        todo!()
    }

    async fn index_library(&self, _request: Request<Empty>) -> Result<Response<Empty>, Status> {
        todo!()
    }

    async fn search_query(&self, request: Request<SearchQueryRequest>) -> Result<Response<SearchQueryResponse>, Status> {
        let search_service = self.search_service.read().await;
        let query = request.into_inner().query;
        let search_results = search_service.search(&query).await.expect("Error searching tracks");
        let mut tracks: Vec<Track> = vec![];
        for track in search_results.tracks.hits {
            let track_result = track.result;
            tracks.push(Track {
                id: track_result.id,
                name: track_result.name.clone(),
                album: Some(Album {
                    id: track_result.album.id,
                    name: track_result.album.name.clone(),
                    year: track_result.album.year,
                    artists: vec![],
                    blurhash: "".to_string(),
                }),
                year: track_result.year,
                artists: track_result.artist.iter().map(|artist| crate::proto::wavenet::Artist {
                    id: artist.id,
                    name: artist.name.clone(),
                }).collect::<Vec<crate::proto::wavenet::Artist>>(),
                length: 0
            });
        }

        let mut artists: Vec<Artist> = vec![];
        for artist_result in search_results.artists.hits {
            artists.push(Artist {
                id: artist_result.result.id,
                name: artist_result.result.name.clone(),
            });
        }

        Ok(Response::new(SearchQueryResponse {
            tracks,
        }.to_owned()))
    }


}