use futures::stream::FuturesUnordered;
use std::collections::HashMap;
use std::error::Error;
use std::ffi::OsStr;
use std::io::Cursor;
use std::sync::Arc;
use std::time::{Instant, SystemTime};
use audiotags::{Picture, Tag};
use blurhash::encode;
use image::{EncodableLayout, GenericImageView, ImageResult};
use sea_orm::{ActiveModelTrait, ColumnTrait, DatabaseConnection, DatabaseTransaction, DbErr, EntityOrSelect, EntityTrait, IntoActiveModel, JoinType, NotSet, PaginatorTrait, QueryFilter, QuerySelect, RelationTrait, RuntimeErr, TransactionTrait};
use sea_orm::ActiveValue::Set;
use tokio::sync::{Mutex, RwLock, Semaphore};
use entity::{album, artist, artist_album, artist_track, track};
use walkdir::WalkDir;
use entity::prelude::{Album, ArtistTrack, Track};
use crate::models::album::AlbumModel;
use crate::models::artist::ArtistModel;
use crate::models::error::WaveError;
use crate::models::track::TrackModel;
use image::io::Reader as ImageReader;
use paris::{Logger};
use entity::artist::{ActiveModel as ArtistActiveModel, ActiveModel, Model};
use entity::artist_album::ActiveModel as ArtistAlbumActiveModel;
use entity::artist_track::ActiveModel as ArtistTrackActiveModel;
use entity::track::ActiveModel as TrackActiveModel;
use entity::album::ActiveModel as AlbumActiveModel;
use crate::models::meili_models::{MeiliAlbum, MeiliArtist, MeiliTrack};
use crate::services::search_service::SearchService;
use symphonia::core::codecs::CODEC_TYPE_NULL;
use symphonia::core::formats::FormatOptions;
use symphonia::core::formats::Track as SymphoniaTrack;
use symphonia::core::io::{MediaSourceStream, MediaSourceStreamOptions};
use symphonia::core::meta::{MetadataOptions, MetadataRevision, StandardTagKey, Value};
use symphonia::core::probe::Hint;
use symphonia::default::get_probe;
use std::fs::File;
use std::borrow::BorrowMut;
use std::future::Future;
use std::io::BufReader;
use std::ops::{Deref, DerefMut};
use std::path::Path;
use symphonia::core::units::TimeBase;
use std::borrow::Borrow;
use tokio::io::AsyncWriteExt;
use tokio::task::JoinHandle;
use tokio_stream::StreamExt;

#[derive(Clone)]
pub struct LibraryService {
    database_connection: Arc<RwLock<DatabaseConnection>>,
    search_service: Arc<RwLock<SearchService>>,
    library_path: String,
}

impl LibraryService {
    pub fn new(database_connection: Arc<RwLock<DatabaseConnection>>, search_service: Arc<RwLock<SearchService>>, library_path: String) -> Self {
        Self {
            database_connection,
            search_service,
            library_path,
        }
    }

    pub async fn get_albums(&self) -> Result<Vec<AlbumModel>, WaveError> {
        let connection = self.database_connection.clone();
        let con = connection.read().await;
        let album_result = Album::find()
            .find_with_related(artist::Entity)
            .all(&con as &DatabaseConnection)
            .await?;

        let album_result = album_result.iter()
            .map(|(album, artists)| (album.clone(), artists));

        let album_mapped = album_result.map(|(album, artists)| {
            let artists_mapped = artists.iter().map(|artist| {
                ArtistModel {
                    id: artist.id,
                    name: artist.name.clone(),
                }
            }).collect::<Vec<ArtistModel>>();

            AlbumModel {
                id: album.id,
                name: album.title.clone(),
                blur_hash: album.blur_hash,
                artists: artists_mapped,
                year: album.released.unwrap_or(0),
                dynamic_image: None,
            }
        }).collect::<Vec<AlbumModel>>();

        Ok(album_mapped)
    }

    pub async fn get_tracks(&self) -> Result<Vec<TrackModel>, Box<dyn Error>> {
        let connection = self.database_connection.clone();
        let con = connection.read().await;
        let track_results = Track::find()
            .find_also_related(artist::Entity)
            .all(&con as &DatabaseConnection)
            .await?;

        let track_results = track_results.iter()
            .map(|(track, artists)| (track.clone(), artists));

        let track_mapped = track_results.map(|(track, artists)| {
            let artists_mapped = artists.iter().map(|artist| {
                ArtistModel {
                    id: artist.id,
                    name: artist.name.clone(),
                }
            }).collect::<Vec<ArtistModel>>();

            TrackModel {
                id: track.id,
                artist: artists_mapped,
                album: AlbumModel {
                    id: track.album,
                    name: String::from("Unknown"),
                    artists: vec![],
                    blur_hash: None,
                    dynamic_image: None,
                    year: 0,
                },
                title: track.title,
                length: track.length,
                file_location: track.file_location,
            }
        }).collect::<Vec<TrackModel>>();

        Ok(track_mapped)
    }

    pub async fn get_track(&self, id: i32) -> Result<TrackModel, WaveError> {
        let connection = self.database_connection.clone();
        let con = connection.read().await;
        let track = Track::find_by_id(id)
            .find_with_related(artist::Entity)
            .all(&con as &DatabaseConnection)
            .await?;

        match track.first() {
            None => Err(WaveError::new("Track not found")),
            Some(track) => {
                let (track, artists) = track;

                let album_result = Album::find_by_id(track.album)
                    .find_with_related(artist::Entity)
                    .all(&con as &DatabaseConnection)
                    .await?;

                let album_result = album_result
                    .first()
                    .map(|(album, artists)| (album.clone(), artists));

                let album = if let Some(result) = album_result {
                    let (album, artists) = result;
                    let artists_mapped = artists.iter().map(|artist| {
                        ArtistModel {
                            id: artist.id,
                            name: artist.name.clone(),
                        }
                    }).collect::<Vec<ArtistModel>>();
                    AlbumModel {
                        id: album.id,
                        name: album.title.clone(),
                        artists: artists_mapped,
                        blur_hash: album.blur_hash,
                        dynamic_image: None,
                        year: album.released.unwrap_or(0),
                    }
                } else {
                    return Err(WaveError::new("Album not found"));
                };

                let artists_mapped = artists.iter().map(|artist| {
                    ArtistModel {
                        id: artist.id,
                        name: artist.name.clone(),
                    }
                }).collect::<Vec<ArtistModel>>();

                Ok(TrackModel {
                    id: track.id,
                    artist: artists_mapped,
                    album: album,
                    title: track.title.clone(),
                    length: track.length,
                    file_location: track.file_location.clone(),
                })
            }
        }
    }

    pub async fn get_artists(&self) -> Result<Vec<ArtistModel>, Box<dyn std::error::Error>> {
        todo!("Implement get_artists")
    }

    pub async fn get_tracks_of_album(&self, album_id: i32) -> Result<Vec<TrackModel>, Box<dyn std::error::Error>> {
        let connection = self.database_connection.clone();
        let con = connection.read().await;
        let tracks = Track::find()
            .find_with_related(artist::Entity)
            .filter(track::Column::Album.eq(album_id))
            .all(&con as &DatabaseConnection)
            .await?;

        let album = Album::find_by_id(album_id)
            .find_also_related(artist::Entity)
            .one(&con as &DatabaseConnection)
            .await?
            .map(|(album, artists)| (album.clone(), artists));

        let album = if let Some(album) = album {
            AlbumModel {
                id: album.0.id,
                name: album.0.title,
                artists: album.1.iter().map(|artist| {
                    ArtistModel {
                        id: artist.id,
                        name: artist.name.clone(),
                    }
                }).collect::<Vec<ArtistModel>>(),
                blur_hash: album.0.blur_hash,
                dynamic_image: None,
                year: album.0.released.unwrap_or(0),
            }
        } else {
            return Err(Box::new(std::io::Error::new(std::io::ErrorKind::Other, "Album not found")));
        };

        let tracks = tracks.iter()
            .map(|(track, artists)| {
                TrackModel {
                    id: track.id,
                    artist: artists.iter().map(|artist| {
                        ArtistModel {
                            id: artist.id,
                            name: artist.name.clone(),
                        }
                    }).collect::<Vec<ArtistModel>>(),
                    album: album.clone(),
                    title: track.title.clone(),
                    length: track.length,
                    file_location: track.file_location.clone(),
                }
            })
            .collect::<Vec<TrackModel>>();

        Ok(tracks)
    }

    pub fn get_track_length_seconds(&self, file_path: &str) -> Result<i32, String> {
        // Open the media file.
        let file = File::open(file_path).map_err(|e| e.to_string())?;
        let media_source = MediaSourceStream::new(Box::new(file), Default::default());

        // Create a probe.
        let probe = get_probe();
        let hint = Hint::new();

        // Use the probe to guess the format.
        let format = probe
            .format(&hint, media_source, &FormatOptions::default(), &MetadataOptions::default())
            .map_err(|e| e.to_string())?;

        // Find the first audio track.
        let track = format
            .format.tracks()
            .iter()
            .find(|track| track.codec_params.codec != CODEC_TYPE_NULL)
            .ok_or("No audio track found")?;

        // Get the duration in seconds.
        let duration = self.track_duration_in_seconds(track)?;

        Ok(duration)
    }

    fn track_duration_in_seconds(&self, track: &SymphoniaTrack) -> Result<i32, String> {
        if let Some(time_base) = track.codec_params.time_base {
            if let Some(n_frames) = track.codec_params.n_frames {
                let seconds = time_base.calc_time(n_frames).seconds;
                return Ok(seconds as i32);
            }
        }
        Err("Could not determine duration".into())
    }

    pub async fn get_album(&self, id: i32) -> Result<AlbumModel, WaveError> {
        let connection = self.database_connection.clone();
        let con = connection.read().await;
        let album_result = Album::find_by_id(id)
            .find_with_related(artist::Entity)
            .all(&con as &DatabaseConnection)
            .await?;

        let album_artists = album_result
            .iter()
            .map(|(_album, artists)| {
                artists.iter().map(|artist| {
                    ArtistModel {
                        id: artist.id,
                        name: artist.name.clone(),
                    }
                }).collect::<Vec<ArtistModel>>()
            })
            .collect::<Vec<Vec<ArtistModel>>>();

        let mut artists_in_album = vec![];
        for album_artist in album_artists {
            for artist in album_artist {
                artists_in_album.push(artist.clone());
            }
        };

        match album_result.first() {
            Some(result) => {
                let (album, _artists) = result;

                Ok(AlbumModel {
                    id: album.id,
                    name: album.title.clone(),
                    blur_hash: album.blur_hash.clone(),
                    artists: artists_in_album,
                    year: album.released.unwrap_or(0),
                    dynamic_image: None,
                })
            }
            None => Err(WaveError::new("Album not found"))
        }
    }

    async fn run_limited_tasks(handles: Vec<tokio::task::JoinHandle<()>>, limit: usize) {
        let mut futures_unordered = FuturesUnordered::new();

        // Loop through all task handles
        for handle in handles.into_iter() {
            // Push task into the futures unordered set
            futures_unordered.push(handle);

            // Check if we have reached the limit
            if futures_unordered.len() >= limit {
                // Wait for one of the tasks to finish before adding new tasks
                futures_unordered.next().await;
            }
        }

        // Await remaining tasks in the unordered set
        while let Some(_) = futures_unordered.next().await {
            // All remaining tasks will be awaited
        }
    }

    pub async fn scan_library(&self) -> Result<(i32, i32, i32), WaveError> {
        let mut logger = Logger::new();
        let connection = self.database_connection.read().await;
        let started_instant = Instant::now();
        logger.info(format!("Starting indexing"));

        // Create stats variables
        let mut tracks_scanned = 0;
        let mut tracks_added = 0;
        let mut tracks_skipped = 0;

        // Start database transaction
        let mut transaction_db = match connection.begin().await {
            Ok(transaction) => transaction,
            Err(error) => {
                return Err(WaveError::string(error.to_string()))
            }
        };

        let trans_mut: Arc<&DatabaseTransaction> = Arc::new(&transaction_db);

        let paths = WalkDir::new(self.library_path.clone());

        let mut task_handles: Vec<JoinHandle<_>> = Vec::new();

        let self_arc = self.clone(); // Create an Arc clone of self

        let semaphore = Arc::new(Semaphore::new(8));

        for path in paths {
            let path = match path {
                Ok(path) => path,
                Err(error) => {
                    return Err(WaveError::string(error.to_string()))
                }
            };
            if !path.file_type().is_file() {
                continue;
            }
            let extension = match path.path().extension().and_then(|e| e.to_str()) {
                Some("mp3") => "mp3",
                Some("flac") => "flac",
                Some("ogg") => "ogg",
                Some("wav") => "wav",
                _ => {
                    continue;
                }
            };

            let task_queue = Arc::new(RwLock::<Vec<String>>::new(vec![]));


            let database_arc_lock = Arc::new(Mutex::new(connection.clone()));
            let self_clone = self_arc.clone(); // Clone the Arc for each task

            let semaphore_clone = semaphore.clone(); // Clone the semaphore

            let task_handle = tokio::spawn(async move {
                let mut logger = Logger::new();
                let _permit = semaphore_clone.acquire().await; // Acquire semaphore permit

                let metadata = match self_clone.extract_metadata(path.clone().path()) {
                    Ok(metadata) => metadata,
                    Err(error) => {
                        logger.error(error.to_string());
                        tracks_skipped += 1;
                        return ();
                    }
                };

                if metadata.artworks.first().is_some() {
                    let artwork_instance = metadata.artworks.first().unwrap();
                    let artwork_md5 = md5::compute(artwork_instance.data.clone());


                    let path = format!("{}\\Cover.jpg", path.clone().path().parent().unwrap().to_str().unwrap());

                    println!("{}", path.clone());

                    let database_clone = database_arc_lock.clone();
                    let binding = database_clone.lock().await;
                    let database_lock = binding.deref();

                    let artwork = entity::artwork::Entity::find()
                        .filter(
                            entity::artwork::Column::FileLocation.eq(format!("{}",path.clone()))
                        )
                        .one(database_lock)
                        .await;

                    let artwork_track: Option<entity::artwork::Model> = match artwork {
                        Ok(artwork_model) => {
                            match artwork_model {
                                None => {
                                    let artwork_hash = format!("{:x}", artwork_md5.clone());
                                    logger.info(format!("No artwork found for {:?} {:?} in the database ", metadata.title, metadata.album));
                                    let image_blurhash = self_clone.generate_blur_hash_from_u8(artwork_instance).await;
                                    let artwork_new = entity::artwork::ActiveModel {
                                        id: Default::default(),
                                        file_location: Set(path.clone()),
                                        blur_hash: Set(Some(image_blurhash.unwrap_or(" ".parse().unwrap()))),
                                        image_hash: Set(Some(artwork_hash.clone())),
                                    };
                                    match artwork_new.insert(database_lock).await {
                                        Ok(artwork_saved) => {
                                            logger.info(format!("Saving image to database and fs {}", path.clone()));
                                            let image = image::load_from_memory(&*artwork_instance.data.clone());
                                            let image_saved = match image {
                                                Ok(image) => {
                                                    match image.save(path.clone()) {
                                                        Ok(_) => {
                                                            logger.info(format!("Saved image to {}", path.clone()));
                                                        }
                                                        Err(error) => {
                                                            logger.error(format!("Error saving image {}", path.clone()));
                                                        }
                                                    }
                                                }
                                                Err(_) => {
                                                    logger.error("Error creating Image file");
                                                }
                                            };
                                            Some(artwork_saved)
                                        }
                                        Err(error) => {
                                            logger.info(format!("Error inserting data for {:?} {:?} in the database, {}", metadata.title, metadata.album, error.to_string()));
                                            None
                                        }
                                    }
                                }
                                Some(artwork) => {
                                    logger.info(format!("Artwork already exists for {:?} {:?} in the database ", metadata.title, metadata.album));
                                    Some(artwork)
                                }
                            }
                        }
                        Err(error) => {
                            logger.info(format!("Error retrieving artwork of {:?} {:?} {}",metadata.title, metadata.album,error.to_string()));
                            None
                        }
                    };
                    drop(database_lock)
                }



                let database_clone = database_arc_lock.clone();
                let binding = database_clone.lock().await;
                let database_lock = binding.deref();

                let binding = path.clone().into_path();
                let path_str = binding.to_str().unwrap();

                let song_indexed = track::Entity::find()
                    .filter(
                        track::Column::FileLocation.eq(path_str)
                    ).count(database_lock).await;

                match song_indexed {
                    Ok(count) => {
                        if count >= 1 {
                            logger.info(format!("Skipping song at {:?}", path.clone()));
                            return;
                        }
                    }
                    Err(error) => {
                        logger.error(format!("Database error when checking existence of song {}", error.to_string()));
                        return;
                    }
                }








                let mut artists = vec![];

                match metadata.artist {
                    None => {}
                    Some(artists_vec) => {
                        for artist_value in artists_vec {
                            let artist = match entity::artist::Entity::find()
                                .filter(
                                    artist::Column::Name.contains(artist_value.clone())
                                ).one(database_lock)
                                .await {
                                Ok(artist) => {
                                    match artist {
                                        None => {
                                            let artist_new = ActiveModel {
                                                id: NotSet,
                                                name: Set(artist_value.clone()),
                                            };
                                            match artist_new.insert(database_lock).await {
                                                Ok(artist_added) => artist_added,
                                                Err(error) => {
                                                    logger.error(format!("Error adding artist {:?} due to {}", artist_value.clone(), error.to_string()));
                                                    continue;
                                                }
                                            }
                                        }
                                        Some(selected_artist) => selected_artist
                                    }
                                }
                                Err(error) => {
                                    logger.error(format!("Error fetching artist {}", error.to_string()));
                                    return ();
                                }
                            };
                            artists.push(artist);
                        }
                    }
                }

                let mut album_artists = vec![];

                match metadata.album_artist {
                    None => {}
                    Some(album_artists_vec) => {
                        for album_artist_value in album_artists_vec {
                            let album_artist = match entity::artist::Entity::find()
                                .filter(
                                    artist::Column::Name.contains(album_artist_value.clone())
                                ).one(database_lock)
                                .await {
                                Ok(album_artist) => {
                                    match album_artist {
                                        None => {
                                            let album_artist_new = ActiveModel {
                                                id: NotSet,
                                                name: Set(album_artist_value.clone()),
                                            };
                                            match album_artist_new.insert(database_lock).await {
                                                Ok(album_artist_added) => album_artist_added,
                                                Err(_) => {
                                                    logger.error(format!("Error adding album_artist {:?}", album_artist_value.clone()));
                                                    continue;
                                                }
                                            }
                                        }
                                        Some(selected_album_artist) => selected_album_artist
                                    }
                                }
                                Err(error) => {
                                    logger.error(format!("Error fetching album_artist {}", error.to_string()));
                                    return ();
                                }
                            };
                            album_artists.push(album_artist);
                        }
                    }
                }

                let album_value = metadata.album.unwrap_or_else(|| "No album".to_string());
                let album = match entity::album::Entity::find()
                    .filter(
                        album::Column::Title.contains(album_value.clone())
                    )
                    .one(database_lock)
                    .await {
                    Ok(album) => {
                        match album {
                            None => {
                                let album_new = entity::album::ActiveModel {
                                    id: NotSet,
                                    blur_hash: Default::default(),
                                    released: Default::default(),
                                    title: Set(album_value.clone()),
                                };
                                match album_new.insert(database_lock).await {
                                    Ok(album_added) => album_added,
                                    Err(_) => {
                                        logger.error(format!("Error adding album {:?}", album_value.clone()));
                                        return ();
                                    }
                                }
                            }
                            Some(selected_album) => selected_album
                        }
                    }
                    Err(error) => {
                        logger.error(format!("Error fetching artist {}", error.to_string()));
                        return ();
                    }
                };


                let track_value = metadata.title.unwrap_or_else(|| "No track".to_string());
                let track = match entity::track::Entity::find()
                    .filter(
                        track::Column::FileLocation.contains(path.clone().into_path().to_str().unwrap_or_else(|| {
                            logger.error("Fatal error when unwraping path string");
                            return "";
                        })),
                    ).one(database_lock)
                    .await {
                    Ok(track) => {
                        match track {
                            None => {
                                let track_new = entity::track::ActiveModel {
                                    id: Default::default(),
                                    title: Set(track_value.clone()),
                                    length: Set(metadata.duration.unwrap_or_else(|| 0)),
                                    file_location: Set(path.clone().into_path().to_str().unwrap().parse().unwrap()),
                                    album: Set(album.id),
                                    artwork: NotSet,
                                };
                                match track_new.insert(database_lock).await {
                                    Ok(track_added) => track_added,
                                    Err(error) => {
                                        logger.error(format!("Error adding track {:?} due to {}", track_value.clone(), error.to_string()));
                                        return ();
                                    }
                                }
                            }
                            Some(selected_track) => selected_track
                        }
                    }
                    Err(error) => {
                        logger.error(format!("Error fetching track {:?}", track_value));
                        return ();
                    }
                };


                logger.info(format!("Indexed file at {}", path.clone().file_name().to_str().unwrap().to_string()));
                return ();
            });
            task_handles.push(task_handle)
        }

        //LibraryService::run_limited_tasks(task_handles, 2).await;

        let results: Vec<_> = futures::future::join_all(task_handles).await;


        let ended = Instant::now();

        logger.done().success(format!("Finished indexing library, took {:?}", (ended - started_instant)));

        Ok((1, 1, 1))
    }


    pub fn extract_metadata<P: AsRef<Path>>(&self, path: P) -> Result<TrackMetadata, WaveError> {
        // Open the media file.
        let file = File::open(path.as_ref())?;

        // Create the media source stream.
        let mss = MediaSourceStream::new(Box::new(file), Default::default());

        // Create a hint to help the format registry guess the format of the stream.
        let mut hint = Hint::new();

        // Provide the hint based on the file extension.
        if let Some(ext) = path.as_ref().extension() {
            hint.with_extension(&ext.to_string_lossy());
        }

        // Probe the media stream for a supported format.
        let probed = get_probe().format(&hint, mss, &FormatOptions::default(), &MetadataOptions::default())?;
        let mut format = probed.format;

        // Initialize empty metadata fields.
        let mut title = None;
        let mut album = None;
        let mut artist = Vec::new();
        let mut album_artist = Vec::new();
        let mut release_date = None;
        let mut genre = None;
        let mut artworks = Vec::new();

        // Iterate over the metadata if present.
        if let Some(metadata) = format.metadata().current() {
            for tag in metadata.tags() {
                match tag.std_key {
                    Some(StandardTagKey::TrackTitle) => title = Some(tag.value.clone().to_string()),
                    Some(StandardTagKey::Album) => album = Some(tag.value.clone().to_string()),
                    Some(StandardTagKey::Artist) => {
                        artist.push((tag.value.clone().to_string()))
                    }
                    Some(StandardTagKey::AlbumArtist) => {
                        album_artist.push((tag.value.clone().to_string()))
                    }
                    Some(StandardTagKey::Date) => release_date = Some(tag.value.clone().to_string()),
                    Some(StandardTagKey::Genre) => genre = Some(tag.value.clone().to_string()),
                    _ => {}
                }
            }

            for visual in metadata.visuals() {
                if let data = visual.data.clone() {
                    artworks.push(TrackArtwork {
                        height: 1000,
                        width: 1000,
                        data: Vec::from(data),
                    })
                }
            }
        }

        let artist_field = Some(artist);
        let artist_album_field = Some(album_artist);


        let length = match self.get_track_length_seconds(path.as_ref().to_str().unwrap()) {
            Ok(data) => { data }
            Err(_) => { 0 }
        };

        Ok(TrackMetadata {
            title,
            album,
            artist: artist_field,
            album_artist: artist_album_field,
            release_date,
            genre,
            duration: Some(length),
            artworks,
        })
    }

    pub async fn index_library(&self) -> Result<String, WaveError> {
        let mut log = Logger::new();

        let library_path = self.library_path.clone();
        //Iterate through the library path and index all files ending with .flac
        log.loading(format!("Indexing library at {}", library_path.clone()));

        for entry in WalkDir::new(library_path) {
            let entry = entry.unwrap();
            if !entry.file_type().is_file() {
                continue;
            }

            let path = entry.path();
            let file_extension = path.extension();

            if (file_extension == None) {
                continue;
            }

            let is_track = match file_extension.and_then(|s| s.to_str()) {
                Some("flac") => true,
                Some("wav") => true,
                Some("mp3") => true,
                _ => false
            };

            if is_track {
                log.info(format!("Cursor at {:?}", path.to_str().unwrap_or("no path found")));
                let tag_result = Tag::new().read_from_path(&path);
                let tag = match tag_result {
                    Ok(tag) => tag,
                    Err(e) => {
                        log.error(format!("[Library] Error reading tag: {:?}", e));
                        continue;
                        return Err(WaveError::string(e.to_string()));
                    }
                };


                log.info("Indexing artists");

                let artists_active_models = match tag.artists() {
                    Some(artists) => artists.iter().map(|artist| {
                        log.info(format!("Now indexing artist {:?}", String::from_utf8_lossy((*artist).as_bytes()).to_string()));
                        ArtistActiveModel {
                            id: NotSet,
                            name: Set(String::from(*artist).replace("\u{0000}", "")),
                        }
                    }).collect::<Vec<ArtistActiveModel>>(),
                    None => vec![],
                };

                let mut artists = vec![];
                for active_artist in artists_active_models {
                    let artist_pushing = self.add_active_artist(active_artist).await?;
                    self.search_service.read().await.add_artist(MeiliArtist {
                        id: artist_pushing.id.clone().unwrap(),
                        name: artist_pushing.name.clone().unwrap().replace("\u{0000}", " "),
                    }).await?;
                    artists.push(artist_pushing);
                }

                log.info("Indexing album artists");
                let album_artists_active_models = match tag.artists() {
                    Some(artists) => artists.iter().map(|artist| {
                        ArtistActiveModel {
                            id: NotSet,
                            name: Set(String::from(*artist).replace("\u{0000}", " ")),
                        }
                    }).collect::<Vec<ArtistActiveModel>>(),
                    None => vec![],
                };

                let mut album_artists = vec![];
                for active_artist in album_artists_active_models {
                    let artist_pushing = self.add_active_artist(active_artist).await?;
                    self.search_service.read().await.add_artist(MeiliArtist {
                        id: artist_pushing.id.clone().unwrap(),
                        name: artist_pushing.name.clone().unwrap(),
                    }).await?;
                    album_artists.push(artist_pushing);
                }


                log.info("Indexing album name");
                let album_name = match tag.album() {
                    Some(album) => String::from(album.title).replace("\u{0000}", " "),
                    None => String::from("Unknown"),
                };


                log.info("Indexing album year");
                let album_year = match tag.year() {
                    Some(year) => Set(Some(year)),
                    None => NotSet,
                };

                log.info("Indexing album");
                let album = self.add_active_album(AlbumActiveModel {
                    id: NotSet,
                    title: Set(album_name),
                    blur_hash: NotSet,
                    released: album_year,
                }, tag.album_cover()).await?;

                let album_active_model = album.clone().into_active_model();

                let track_title = match tag.title() {
                    Some(title) => String::from(title).replace("\u{0000}", " "),
                    None => String::from("Unknown"),
                };

                log.info(format!("Indexing the Track Title {:?} at path {:?}", track_title.clone(), path.to_str().unwrap_or("NOT FOUND AAAA")));

                let _track_number = match tag.track_number() {
                    Some(track_number) => Set(Some(track_number)),
                    None => NotSet,
                };

                let track_length = match tag.duration() {
                    Some(length) => Set(length as i32),
                    None => {
                        match self.get_track_length_seconds(path.to_str().unwrap()) {
                            Ok(seconds) => {
                                log.info(format!("Calculated length of song via symphfonia {:?}", seconds));
                                Set(seconds as i32)
                            }
                            Err(_) => {
                                log.error("Could not parse the length of the file");
                                Set(-1)
                            }
                        }
                    }
                };

                let _track_album_artist = match tag.album_artists() {
                    Some(artists) => artists.iter().map(|artist| {
                        ArtistActiveModel {
                            id: NotSet,
                            name: Set(String::from(*artist).replace("\u{0000}", " ")),
                        }
                    }).collect::<Vec<ArtistActiveModel>>(),
                    None => vec![],
                };

                let track_file_location = match path.to_str() {
                    None => {
                        println!("[Library] Error getting file location");
                        return Err(WaveError::new("Error getting file location"));
                    }
                    Some(location) => {
                        location.to_string()
                    }
                };

                let track = self.add_active_track(TrackActiveModel {
                    id: NotSet,
                    title: Set(track_title),
                    album: album_active_model.id.clone(),
                    length: track_length,
                    file_location: Set(track_file_location),
                    artwork: NotSet,
                }).await;


                let track = match track {
                    Ok(track) => track,
                    Err(e) => {
                        println!("[Library] Error adding track: {:?}", e);
                        return Err(WaveError::new("Error adding track"));
                    }
                };


                let meili_album = MeiliAlbum {
                    id: album.id.clone().unwrap(),
                    name: album.title.clone().unwrap(),
                    year: tag.year().unwrap_or(0),
                };

                let meili_album_add = self.search_service.read().await.add_album(meili_album).await;
                match meili_album_add {
                    Ok(_) => {
                        //log.success("Added album to search index");
                    }
                    Err(e) => {
                        log.error(format!("[Library] Error adding album to search index: {:?}", e));
                    }
                }

                let meili_track = MeiliTrack {
                    id: track.id.clone().unwrap(),
                    name: track.title.clone().unwrap(),
                    artist: artists.iter().map(|artist| {
                        MeiliArtist {
                            id: artist.id.clone().unwrap(),
                            name: artist.name.clone().unwrap(),
                        }
                    }).collect(),
                    album: MeiliAlbum {
                        id: album.id.clone().unwrap(),
                        name: album.title.clone().unwrap(),
                        year: 0,
                    },
                    genre: tag.genre().unwrap_or("No genre").to_string(),
                    year: tag.year().unwrap_or(0),
                };

                let meili_add = self.search_service.read().await.add_track(meili_track).await;
                match meili_add {
                    Ok(_) => {
                        //log.success("Added track to search index");
                    }
                    Err(e) => {
                        log.error(format!("Error adding track to search index: {:?}", e));
                    }
                }

                for track_artist in artists {
                    log.info(format!("Adding artist to track {}", track_artist.id.clone().unwrap()));
                    let artist_track = self.add_artist_to_track(ArtistTrackActiveModel {
                        artist_id: track_artist.id.clone(),
                        track_id: track.id.clone(),
                    }).await;

                    match artist_track {
                        Ok(result) => {
                            log.success(format!("Added artist to track {}", result.artist_id.clone().unwrap()));
                        }
                        Err(e) => {
                            log.error(format!("Error adding artist to track: {:?}", e));
                        }
                    }
                }

                for album_artist in album_artists {
                    log.info(format!("Adding artist {} to album {}", album_artist.id.clone().unwrap(), album.id.clone().unwrap()));
                    let artist_album = self.add_artist_to_album(ArtistAlbumActiveModel {
                        artist_id: album_artist.id.clone(),
                        album_id: album.id.clone(),
                    }).await;

                    match artist_album {
                        Ok(result) => {
                            log.success(format!("Added artist to track {}", result.artist_id.clone().unwrap()));
                        }
                        Err(e) => {
                            log.error(format!("Error adding artist to album: {:?}", e));
                        }
                    }
                }

                log.info(format!("Finished tracking the track {:?}", path.to_str().unwrap_or("No file url found")));
            }
        }
        Ok(String::from("Okay"))
    }


    async fn add_artist_to_track(&self, artist_track: ArtistTrackActiveModel) -> Result<ArtistTrackActiveModel, WaveError> {
        let connection = self.database_connection.clone();
        let con = connection.read().await;

        let database_artist_track = artist_track::Entity::find()
            .filter(artist_track::Column::ArtistId.eq(artist_track.artist_id.clone().unwrap()))
            .filter(artist_track::Column::TrackId.eq(artist_track.track_id.clone().unwrap()))
            .one(&con as &DatabaseConnection).await?;

        if let Some(artist_track) = database_artist_track {
            return Ok(artist_track.into_active_model());
        }

        let _insert = ArtistTrack::insert(artist_track.clone().into_active_model())
            .exec(&con as &DatabaseConnection).await;

        Ok(
            ArtistTrackActiveModel {
                artist_id: artist_track.artist_id.clone(),
                track_id: artist_track.track_id.clone(),
            }
        )
    }

    async fn add_artist_to_album(&self, artist_album: ArtistAlbumActiveModel) -> Result<ArtistAlbumActiveModel, WaveError> {
        let connection = self.database_connection.clone();
        let con = connection.read().await;


        let database_artist_album = artist_album::Entity::find()
            .filter(artist_album::Column::ArtistId.eq(artist_album.artist_id.clone().unwrap()))
            .filter(artist_album::Column::AlbumId.eq(artist_album.album_id.clone().unwrap()))
            .one(&con as &DatabaseConnection).await?;

        if let Some(artist_album) = database_artist_album {
            return Ok(artist_album.into_active_model());
        }

        let _insert = artist_album.clone().insert(&con as &DatabaseConnection).await;

        Ok(
            ArtistAlbumActiveModel {
                artist_id: artist_album.artist_id.clone(),
                album_id: artist_album.album_id.clone(),
            }
        )
    }

    async fn add_active_track(&self, active_model: TrackActiveModel) -> Result<TrackActiveModel, WaveError> {
        let connection = self.database_connection.clone();
        let con = connection.read().await;

        let track_title = active_model.title.clone().unwrap();

        let database_track = track::Entity::find()
            .filter(track::Column::Title.eq(track_title.clone()))
            .one(&con as &DatabaseConnection).await?;

        if let Some(track) = database_track {
            return Ok(track.into_active_model());
        }

        println!("Track {} not found, adding", active_model.title.clone().unwrap());


        let insert = Track::insert(active_model.clone().into_active_model())
            .exec(&con as &DatabaseConnection).await;

        let insert_id = match insert {
            Ok(insert) => {
                println!("Inserted track {} with id {}", active_model.title.clone().unwrap(), insert.last_insert_id);
                insert.last_insert_id
            }
            Err(e) => {
                println!("Error inserting track: {:?}", e);
                return Err(WaveError::string(e.to_string()));
            }
        };

        Ok(
            TrackActiveModel {
                id: Set(insert_id),
                title: active_model.title.clone(),
                album: active_model.album.clone(),
                length: active_model.length.clone(),
                file_location: active_model.file_location.clone(),
                artwork: active_model.artwork.clone(),
            }
        )
    }

    async fn add_active_album(&self, active_model: AlbumActiveModel, picture: Option<Picture<'_>>) -> Result<AlbumActiveModel, WaveError> {
        let connection = self.database_connection.clone();
        let con = connection.read().await;

        let album_title = active_model.title.clone().unwrap();

        let database_album = album::Entity::find()
            .filter(album::Column::Title.eq(album_title.clone()))
            .one(&con as &DatabaseConnection).await?;

        if let Some(album) = database_album.clone() {
            if let None = album.blur_hash {
                let album_blur_hash = match picture.clone() {
                    Some(picture) => {
                        match self.generate_blurhash(picture).await {
                            Ok(blurhash) => Set(Some(blurhash)),
                            Err(e) => {
                                println!("Error generating blurhash: {:?}", e);
                                NotSet
                            }
                        }
                    }
                    None => {
                        println!("No image provided for blur hash");
                        NotSet
                    }
                };


                let update = Album::update(AlbumActiveModel {
                    id: Set(album.id),
                    title: Set(album_title.clone()),
                    blur_hash: album_blur_hash.clone(),
                    released: active_model.released.clone(),
                })
                    .filter(album::Column::Id.eq(album.id))
                    .exec(&con as &DatabaseConnection).await;

                match update {
                    Ok(_) => {
                        println!("Updated album {} with blur hash {:?}", album_title.clone(), album_blur_hash.clone());
                    }
                    Err(e) => {
                        println!("Error updating album: {:?}", e);
                    }
                }
            }
        }


        if let Some(album) = database_album {
            return Ok(album.into_active_model());
        }

        let album_blur_hash = match picture {
            Some(picture) => {
                match self.generate_blurhash(picture.clone()).await {
                    Ok(blurhash) => Set(Some(blurhash)),
                    Err(e) => {
                        println!("Error generating blurhash: {:?}", e);
                        NotSet
                    }
                }
            }
            None => {
                println!("No image provided for blur hash");
                NotSet
            }
        };

        let album_active_model = AlbumActiveModel {
            id: NotSet,
            title: Set(album_title),
            blur_hash: album_blur_hash.clone(),
            released: active_model.released.clone(),
        };


        let insert = Album::insert(album_active_model.clone().into_active_model())
            .exec(&con as &DatabaseConnection).await;

        let insert_id = if let Ok(insert) = insert {
            println!("Inserted album {} with id {}", active_model.title.clone().unwrap(), insert.last_insert_id);
            insert.last_insert_id
        } else {
            return Err(WaveError::new("Error inserting album"));
        };


        Ok(
            AlbumActiveModel {
                id: Set(insert_id),
                title: active_model.title.clone(),
                blur_hash: album_blur_hash,
                released: active_model.released.clone(),
            }
        )
    }

    async fn generate_blur_hash_from_u8(&self, picture: &TrackArtwork) -> Result<String, WaveError> {
        let img = ImageReader::new(Cursor::new(picture.data.clone())).with_guessed_format();
        let img = if let Ok(img) = img {
            img
        } else {
            return Err(WaveError::new("Error reading image"));
        };
        let image = img.decode();
        let image = if let Ok(image) = image {
            image
        } else {
            return Err(WaveError::new("Error decoding image"));
        };
        let (w, h) = image.dimensions();
        let blurhash = encode(3, 3, w, h, image.to_rgba8().as_bytes()).unwrap();
        Ok(blurhash)
    }

    async fn generate_blurhash(&self, picture: Picture<'_>) -> Result<String, WaveError> {
        let img = ImageReader::new(Cursor::new(picture.data)).with_guessed_format();
        let img = if let Ok(img) = img {
            img
        } else {
            return Err(WaveError::new("Error reading image"));
        };
        let image = img.decode();
        let image = if let Ok(image) = image {
            image
        } else {
            return Err(WaveError::new("Error decoding image"));
        };
        let (w, h) = image.dimensions();
        println!("[Library] Generating blurHash for ");
        let time_now = SystemTime::now();
        let blurhash = encode(3, 3, w, h, image.to_rgba8().as_bytes()).unwrap();
        let time_finished = SystemTime::now();
        let diff = time_finished.duration_since(time_now).unwrap();
        println!("[Library] blurHash {} took {} seconds", blurhash.clone(), diff.as_secs());
        Ok(blurhash)
    }

    async fn add_active_artist(&self, active_model: ActiveModel) -> Result<ArtistActiveModel, WaveError> {
        let connection = self.database_connection.clone();
        let con = connection.read().await;

        let database_artist = artist::Entity::find()
            .filter(artist::Column::Name.eq(active_model.name.clone().into_value().unwrap()))
            .one(&con as &DatabaseConnection).await?;

        if let Some(artist) = database_artist {
            println!("Artist {} already exists", artist.name.clone());
            return Ok(artist.into_active_model());
        }

        println!("Artist {} not found, adding", active_model.name.clone().into_value().unwrap());
        active_model.save(&con as &DatabaseConnection).await.map_err(|e| e.into())
    }


    async fn add_artist_active_model(&self, artist: ArtistActiveModel) -> Result<ArtistActiveModel, Box<dyn Error>> {
        let connection = self.database_connection.clone();
        let con = connection.read().await;
        let artist_insert = artist.save(&con as &DatabaseConnection).await;
        match artist_insert {
            Ok(artist) => Ok(artist),
            Err(e) => Err(Box::new(std::io::Error::new(std::io::ErrorKind::Other, e.to_string())))
        }
    }

    async fn insert_artist(&self, artist: entity::artist::ActiveModel, connection: &DatabaseConnection) {
        let artist_insert = artist.insert(connection).await;
        match artist_insert {
            Ok(artist) => {
                println!("Inserted artist {}", artist.name.clone());
            }
            Err(e) => {
                println!("Error inserting artist: {:?}", e);
            }
        }
    }

    async fn add_artist(&self, artist: ArtistModel) -> Result<ArtistModel, Box<dyn std::error::Error>> {
        let artist_active = artist::ActiveModel {
            id: NotSet,
            name: Set(artist.name.clone()),
        };
        let connection = self.database_connection.clone();
        let con = connection.read().await;

        let artist_in_database = artist::Entity::find()
            .filter(artist::Column::Name.eq(artist.name.clone().to_string()))
            .one(&con as &DatabaseConnection).await?;

        return match artist_in_database {
            None => {
                let artist_insert = artist_active.insert(&con as &DatabaseConnection).await?;
                let inserted_artist_option = artist::Entity::find_by_id(artist_insert.id).one(&con as &DatabaseConnection).await?;

                if let Some(inserted_artist) = inserted_artist_option {
                    println!("Inserted artist {}", inserted_artist.name.clone());

                    Ok(ArtistModel {
                        id: inserted_artist.id,
                        name: inserted_artist.name,
                    })
                } else {
                    Err(Box::new(std::io::Error::new(std::io::ErrorKind::Other, "Inserted artist not found and cant be added")))
                }
            }

            Some(artist) => {
                self.search_service.read().await.add_artist(MeiliArtist {
                    id: artist.id,
                    name: artist.name.clone(),
                }).await?;
                Ok(ArtistModel {
                    id: artist.id,
                    name: artist.name,
                })
            }
        };
    }
}

#[derive(Debug)]
pub struct TrackMetadata {
    pub title: Option<String>,
    pub album: Option<String>,
    pub artist: Option<Vec<String>>,
    pub album_artist: Option<Vec<String>>,
    pub release_date: Option<String>,
    pub genre: Option<String>,
    pub duration: Option<i32>,
    pub artworks: Vec<TrackArtwork>, // Artworks as a vector of bytes
}

#[derive(Debug)]
pub struct TrackArtwork {
    pub width: u32,
    pub height: u32,
    pub data: Vec<u8>,
}