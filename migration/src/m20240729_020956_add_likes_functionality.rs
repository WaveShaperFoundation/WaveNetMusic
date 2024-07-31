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
                  .table(UserLikes::Table)
                    .if_not_exists()
                    .col(
                        ColumnDef::new(UserLikes::UserId)
                            .integer()
                            .not_null()
                    )
                    .col(
                        ColumnDef::new(UserLikes::TrackId)
                            .integer()
                            .not_null()
                    )
                    .col(
                        ColumnDef::new(UserLikes::AddedAt)
                            .timestamp()
                            .not_null()
                            .default(Expr::current_timestamp())
                    )
                    .primary_key(
                        Index::create()
                            .name("pk_user_likes")
                            .col(UserLikes::UserId)
                            .col(UserLikes::TrackId)
                            .primary()
                    )
                    .foreign_key(
                        ForeignKey::create()
                            .name("fk_user_likes_user_id")
                            .from_tbl(UserLikes::Table)
                            .from_col(UserLikes::UserId)
                            .to_tbl(User::Table)
                            .to_col(User::Id),
                    )
                    .foreign_key(
                        ForeignKey::create()
                            .name("fk_user_likes_track_id")
                            .from_tbl(UserLikes::Table)
                            .from_col(UserLikes::TrackId)
                            .to_tbl(Track::Table)
                            .to_col(Track::Id)
                            .on_delete(ForeignKeyAction::Cascade),
                    )
                  .to_owned(),
            ).await
    }

    async fn down(&self, manager: &SchemaManager) -> Result<(), DbErr> {
        manager
            .drop_table(Table::drop().table(UserLikes::Table).to_owned())
            .await
    }
}

#[derive(DeriveIden)]
enum UserLikes {
    Table,
    UserId,
    TrackId,
    AddedAt,
}
