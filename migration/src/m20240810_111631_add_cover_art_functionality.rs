use sea_orm_migration::prelude::*;
use crate::m20240509_015015_create_album_and_tracks::Track;
use crate::m20240722_124400_add_user_authentication::User;
use crate::m20240727_153616_add_playlist_support::PlaylistUser;

#[derive(DeriveMigrationName)]
pub struct Migration;

#[async_trait::async_trait]
impl MigrationTrait for Migration {
    async fn up(&self, manager: &SchemaManager) -> Result<(), DbErr> {
        manager
            .create_table(
                Table::create()
                    .table(Artwork::Table)
                    .if_not_exists()
                    .col(
                        ColumnDef::new(Artwork::Id)
                            .integer()
                            .not_null()
                            .auto_increment()
                            .primary_key(),
                    )
                    .col(ColumnDef::new(Artwork::FileLocation).string().not_null().unique_key())
                    .col(ColumnDef::new(Artwork::BlurHash).string())
                    .col(ColumnDef::new(Artwork::ImageHash).string())
                    .to_owned(),
            )
            .await?;

        TableAlterStatement::new();

        manager.alter_table(
            Table::alter()
                .table(Track::Table)
                .add_column(
                    ColumnDef::new(Track::Artwork)
                        .integer()
                )
                .add_foreign_key(
                    &TableForeignKey::new()
                        .name("fk_track_artwork")
                        .from_tbl(Track::Table)
                        .from_col(Track::Artwork)
                        .to_tbl(Artwork::Table)
                        .to_col(Artwork::Id)
                        .to_owned()
                )
                .to_owned()
        ).await
    }

    async fn down(&self, manager: &SchemaManager) -> Result<(), DbErr> {
        manager
            .drop_table(Table::drop().table(Artwork::Table).to_owned())
            .await
    }
}

#[derive(DeriveIden)]
enum Artwork {
    Table,
    Id,
    FileLocation,
    BlurHash,
    ImageHash,
}
