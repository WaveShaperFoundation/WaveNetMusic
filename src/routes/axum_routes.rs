use std::path::Path;
use axum::body::Body;
use axum::extract::{Query, Request, State};
use axum::http::{header, StatusCode};
use axum::response::{IntoResponse, Response};
use serde::Deserialize;
use tonic::codegen::Service;
use tower_http::services::ServeFile;
use crate::AppState;

#[derive(Deserialize)]
pub struct RequestAudioStream {
    id: String,
}

pub async fn retrieve_album_cover(
    Query(RequestAudioStream { id }): Query<RequestAudioStream>,
    State(state): State<AppState>,
    mut req: Request<Body>,
) -> Result<Response, (StatusCode, String)> {
    // Changed return type to Result

    let album_identifier = id.parse::<i32>().map_err(|_| {
        (StatusCode::BAD_REQUEST, "Invalid song ID".to_string())
    })?; // Now we can use the `?` operator

    let track_lock = state
        .library_service
        .read()
        .await;

    let track = track_lock
        .get_tracks_of_album(album_identifier)
        .await
        .map_err(|_| {
            println!("Track not found with path"); // Added this line
            (StatusCode::NOT_FOUND, "Track not found".to_string())
        })?; // `?` operator here as well

    let path_string = track[0].file_location.clone();
    let path_option = Path::new(&path_string).parent();
    let path = match path_option {
        Some(path) => path,
        None => {
            return Err((StatusCode::NOT_FOUND, "Cover not found".to_string()));
        }
    };
    let path = path.join("Cover.jpg");
    let mime = mime_guess::from_path(path.clone()).first_or_octet_stream();
    req.headers_mut().insert(
        header::CONTENT_TYPE,
        mime.as_ref().parse().unwrap(),
    );


    let serve_future = ServeFile::new(path).call(req);

    Ok(serve_future.await.into_response())
}

pub async fn stream_audio_file(
    Query(RequestAudioStream { id }): Query<RequestAudioStream>,
    State(state): State<AppState>,
    mut req: Request<Body>,
) -> Result<impl IntoResponse, (StatusCode, String)> {
    // Changed return type to Result

    let song_identifier = id.parse::<i32>().map_err(|_| {
        (StatusCode::BAD_REQUEST, "Invalid song ID".to_string())
    })?; // Now we can use the `?` operator

    let track_lock = state
        .library_service
        .read()
        .await;

    let track = track_lock
        .get_track(song_identifier)
        .await
        .map_err(|_| (StatusCode::NOT_FOUND, "Track not found".to_string()))?; // `?` operator here as well

    let path = track.file_location.clone();
    let mime = mime_guess::from_path(path.clone()).first_or_octet_stream();
    req.headers_mut().insert(
        header::CONTENT_TYPE,
        mime.as_ref().parse().unwrap(),
    );


    let serve_future = ServeFile::new(path).call(req);

    Ok(serve_future.await.into_response())
}