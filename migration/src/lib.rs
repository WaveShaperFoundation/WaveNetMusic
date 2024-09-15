pub use sea_orm_migration::prelude::*;

mod m20240509_015015_create_album_and_tracks;
mod m20240722_124400_add_user_authentication;
mod m20240727_153616_add_playlist_support;
mod m20240729_020956_add_likes_functionality;
mod m20240810_111631_add_cover_art_functionality;

pub struct Migrator;

#[async_trait::async_trait]
impl MigratorTrait for Migrator {
    fn migrations() -> Vec<Box<dyn MigrationTrait>> {
        vec![
            Box::new(m20240509_015015_create_album_and_tracks::Migration),
            Box::new(m20240722_124400_add_user_authentication::Migration),
            Box::new(m20240727_153616_add_playlist_support::Migration),
            Box::new(m20240729_020956_add_likes_functionality::Migration),
            Box::new(m20240810_111631_add_cover_art_functionality::Migration),
        ]
    }
}
