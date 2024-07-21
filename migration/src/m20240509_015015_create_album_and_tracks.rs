use sea_orm_migration::prelude::*;

#[derive(DeriveMigrationName)]
pub struct Migration;

#[async_trait::async_trait]
impl MigrationTrait for Migration {
    async fn up(&self, manager: &SchemaManager) -> Result<(), DbErr> {
        // Replace the sample below with your own migration scripts

        manager
            .create_table(
                Table::create()
                    .table(Artist::Table)
                    .if_not_exists()
                    .col(
                        ColumnDef::new(Artist::Id)
                            .integer()
                            .not_null()
                            .auto_increment()
                            .primary_key(),
                    )
                    .col(ColumnDef::new(Artist::Name).string().not_null())
                    .to_owned(),
            )
            .await?;

        manager.
            create_table(
                Table::create()
                    .table(Album::Table)
                    .if_not_exists()
                    .col(
                        ColumnDef::new(Album::Id)
                            .integer()
                            .not_null()
                            .auto_increment()
                            .primary_key(),
                    )
                    .col(
                        ColumnDef::new(Album::BlurHash)
                            .string()
                            .null()
                    )
                    .col(
                        ColumnDef::new(Album::Released)
                            .integer()
                            .null()
                    )
                    .col(
                        ColumnDef::new(Album::Title)
                            .string()
                            .not_null()
                    )
                    .to_owned()
            ).await?;

        manager
            .create_table(
                Table::create()
                    .table(Track::Table)
                    .if_not_exists()
                    .col(
                        ColumnDef::new(Track::Id)
                            .integer()
                            .not_null()
                            .auto_increment()
                            .primary_key(),
                    )
                    .col(
                        ColumnDef::new(Track::Title)
                            .string()
                            .not_null()
                    )
                    .col(
                        ColumnDef::new(Track::Length)
                            .integer()
                            .not_null()
                    )
                    .col(
                        ColumnDef::new(Track::FileLocation)
                            .unique_key()
                            .string()
                            .not_null()
                    )
                    .col(
                        ColumnDef::new(Track::Album)
                            .integer()
                            .not_null()
                    )
                    .foreign_key(
                        ForeignKey::create()
                            .name("fk_album_id")
                            .from(Track::Table, Track::Album)
                            .to(Album::Table, Album::Id)
                            .on_delete(ForeignKeyAction::Cascade)
                            .on_update(ForeignKeyAction::Cascade),
                    ).to_owned(),
            )
            .await?;

        // Create Junction Tables
        manager
            .create_table(
                Table::create()
                    .table(ArtistAlbum::Table)
                    .if_not_exists()
                    .col(ColumnDef::new(ArtistAlbum::ArtistId).integer().not_null())
                    .col(ColumnDef::new(ArtistAlbum::AlbumId).integer().not_null())
                    .primary_key(
                        Index::create()
                            .col(ArtistAlbum::ArtistId)
                            .col(ArtistAlbum::AlbumId),
                    )
                    .foreign_key(
                        ForeignKey::create()
                            .name("fk-artist_album-artist_id")
                            .from(ArtistAlbum::Table, ArtistAlbum::ArtistId)
                            .to(Artist::Table, Artist::Id)
                            .on_delete(ForeignKeyAction::Cascade)
                            .on_update(ForeignKeyAction::Cascade),
                    )
                    .foreign_key(
                        ForeignKey::create()
                            .name("fk-artist_album-album_id")
                            .from(ArtistAlbum::Table, ArtistAlbum::AlbumId)
                            .to(Album::Table, Album::Id)
                            .on_delete(ForeignKeyAction::Cascade)
                            .on_update(ForeignKeyAction::Cascade),
                    )
                    .to_owned(),
            )
            .await?;

        // Create Junction Tables
        manager
            .create_table(
                Table::create()
                    .table(ArtistTrack::Table)
                    .if_not_exists()
                    .col(ColumnDef::new(ArtistTrack::ArtistId).integer().not_null())
                    .col(ColumnDef::new(ArtistTrack::TrackId).integer().not_null())
                    .primary_key(
                        Index::create()
                            .col(ArtistTrack::ArtistId)
                            .col(ArtistTrack::TrackId),
                    )
                    .foreign_key(
                        ForeignKey::create()
                            .name("fk-artist_track-artist_id")
                            .from(ArtistTrack::Table, ArtistTrack::ArtistId)
                            .to(Artist::Table, Artist::Id)
                            .on_delete(ForeignKeyAction::Cascade)
                            .on_update(ForeignKeyAction::Cascade),
                    )
                    .foreign_key(
                        ForeignKey::create()
                            .name("fk-artist_track-track_id")
                            .from(ArtistTrack::Table, ArtistTrack::TrackId)
                            .to(Track::Table, Track::Id)
                            .on_delete(ForeignKeyAction::Cascade)
                            .on_update(ForeignKeyAction::Cascade),
                    )
                    .to_owned(),
            )
            .await
    }

    async fn down(&self, manager: &SchemaManager) -> Result<(), DbErr> {

        manager
            .drop_table(Table::drop().table(ArtistAlbum::Table).to_owned())
            .await?;

        manager
            .drop_table(Table::drop().table(ArtistTrack::Table).to_owned())
            .await?;

        // Replace the sample below with your own migration scripts
        manager
            .drop_table(Table::drop().table(Artist::Table).to_owned())
            .await.expect("TODO: panic message");

        manager
            .drop_table(Table::drop().table(Track::Table).to_owned())
            .await.expect("TODO: panic message");

        manager
            .drop_table(Table::drop().table(Album::Table).to_owned())
            .await
    }
}

#[derive(DeriveIden)]
pub enum Track {
    Table,
    Id,
    Album,
    Title,
    Length,
    FileLocation
}

#[derive(Iden)]
enum ArtistTrack {
    Table,
    ArtistId,
    TrackId,
}

#[derive(DeriveIden)]
pub enum Album {
    Table,
    Id,
    BlurHash,
    Title,
    Released,
}

#[derive(Iden)]
enum ArtistAlbum {
    Table,
    ArtistId,
    AlbumId,
}

#[derive(DeriveIden)]
pub enum Artist {
    Table,
    Id,
    Name
}
