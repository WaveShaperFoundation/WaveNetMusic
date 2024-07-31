use sea_orm_migration::prelude::*;
use crate::m20240509_015015_create_album_and_tracks::Track;
use crate::m20240722_124400_add_user_authentication::User;

#[derive(DeriveMigrationName)]
pub struct Migration;

#[async_trait::async_trait]
impl MigrationTrait for Migration {
    async fn up(&self, manager: &SchemaManager) -> Result<(), DbErr> {
        manager
            .create_table(
                Table::create()
                    .table(Playlist::Table)
                    .if_not_exists()
                    .col(
                        ColumnDef::new(Playlist::Id)
                            .integer()
                            .not_null()
                            .auto_increment()
                            .primary_key(),
                    )
                    .col(ColumnDef::new(Playlist::Title).string().not_null())
                    .col(ColumnDef::new(Playlist::Description).string())
                    .col(ColumnDef::new(Playlist::CreatedAt).timestamp().not_null().default(Expr::current_timestamp()))
                    .col(ColumnDef::new(Playlist::CoverSource).string())
                    .to_owned(),
            )
            .await?;

        manager
            .create_table(
                Table::create()
                    .table(PlaylistUser::Table)
                    .if_not_exists()
                    .col(
                        ColumnDef::new(PlaylistUser::PlaylistId)
                            .integer()
                            .not_null()
                    )
                    .col(
                        ColumnDef::new(PlaylistUser::UserId)
                            .integer()
                            .not_null()
                    )
                    .col(ColumnDef::new(PlaylistUser::RoleLevel).integer().not_null())
                    .primary_key(
                        Index::create()
                            .name("pk_playlist_user")
                            .col(PlaylistUser::PlaylistId)
                            .col(PlaylistUser::UserId)
                            .primary()
                    )
                    .foreign_key(
                        ForeignKey::create()
                            .name("fk_playlist_user_playlist_id")
                            .from_tbl(PlaylistUser::Table)
                            .from_col(PlaylistUser::PlaylistId)
                            .to_tbl(Playlist::Table)
                            .to_col(Playlist::Id),
                    )
                    .foreign_key(
                        ForeignKey::create()
                            .name("fk_playlist_user_user_id")
                            .from_tbl(PlaylistUser::Table)
                            .from_col(PlaylistUser::UserId)
                            .to_tbl(User::Table)
                            .to_col(User::Id),
                    )
                    .to_owned(),
            ).await?;

        manager.create_table(
            Table::create()
                .table(PlaylistTrackItem::Table)
                .if_not_exists()
                .col(
                    ColumnDef::new(PlaylistTrackItem::Id)
                        .integer()
                        .not_null()
                        .auto_increment()
                        .primary_key(),
                )
                .col(
                    ColumnDef::new(PlaylistTrackItem::PlaylistId)
                        .integer()
                        .not_null()
                )
                .col(
                    ColumnDef::new(PlaylistTrackItem::TrackId)
                        .integer()
                        .not_null()
                )
                .col(
                    ColumnDef::new(PlaylistTrackItem::AdderId)
                        .integer()
                        .not_null()
                )
                .col(
                    ColumnDef::new(PlaylistTrackItem::AddedAt)
                        .timestamp()
                        .not_null()
                )
                .col(
                    ColumnDef::new(PlaylistTrackItem::NextCursorId)
                        .integer()
                )
                .col(
                    ColumnDef::new(PlaylistTrackItem::PreviousCursorId)
                        .integer()
                )
                .foreign_key(
                    ForeignKey::create()
                        .name("fk_playlist_song_item_playlist_id")
                        .from_tbl(PlaylistTrackItem::Table)
                        .from_col(PlaylistTrackItem::PlaylistId)
                        .to_tbl(Playlist::Table)
                        .to_col(Playlist::Id),
                )
                .foreign_key(
                    ForeignKey::create()
                        .name("fk_playlist_song_item_song_id")
                        .from_tbl(PlaylistTrackItem::Table)
                        .from_col(PlaylistTrackItem::TrackId)
                        .to_tbl(Track::Table)
                        .to_col(Track::Id),
                )
                .foreign_key(
                    ForeignKey::create()
                        .name("fk_playlist_song_item_adder_id")
                        .from_tbl(PlaylistTrackItem::Table)
                        .from_col(PlaylistTrackItem::AdderId)
                        .to_tbl(User::Table)
                        .to_col(User::Id),
                )
                .foreign_key(
                    ForeignKey::create()
                        .name("fk_playlist_song_item_head_id")
                        .from_tbl(PlaylistTrackItem::Table)
                        .from_col(PlaylistTrackItem::NextCursorId)
                        .to_tbl(PlaylistTrackItem::Table)
                        .to_col(PlaylistTrackItem::Id),
                )
                .foreign_key(
                    ForeignKey::create()
                        .name("fk_playlist_song_item_tail_id")
                        .from_tbl(PlaylistTrackItem::Table)
                        .from_col(PlaylistTrackItem::PreviousCursorId)
                        .to_tbl(PlaylistTrackItem::Table)
                        .to_col(PlaylistTrackItem::Id),
                )
                .to_owned()

        ).await
    }

    async fn down(&self, manager: &SchemaManager) -> Result<(), DbErr> {
        manager
            .drop_table(Table::drop().table(Playlist::Table).to_owned())
            .await?;

        manager
            .drop_table(Table::drop().table(PlaylistUser::Table).to_owned())
            .await?;

        manager
            .drop_table(Table::drop().table(PlaylistTrackItem::Table).to_owned())
            .await
    }
}

#[derive(DeriveIden)]
enum Playlist {
    Table,
    Id,
    Title,
    Description,
    CreatedAt,
    CoverSource,
}

#[derive(DeriveIden)]
pub enum PlaylistUser {
    Table,
    PlaylistId,
    UserId,
    RoleLevel,
}

#[derive(DeriveIden)]
enum PlaylistTrackItem {
    Table,
    Id,
    PlaylistId,
    TrackId,
    AdderId,
    AddedAt,
    NextCursorId,
    PreviousCursorId,
}