pub use sea_orm_migration::prelude::*;

mod m20240509_015015_create_album_and_tracks;
mod m20240722_124400_add_user_authentication;

pub struct Migrator;

#[async_trait::async_trait]
impl MigratorTrait for Migrator {
    fn migrations() -> Vec<Box<dyn MigrationTrait>> {
        vec![
            Box::new(m20240509_015015_create_album_and_tracks::Migration),
            Box::new(m20240722_124400_add_user_authentication::Migration),
        ]
    }
}
