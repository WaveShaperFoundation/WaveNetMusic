//! `SeaORM` Entity. Generated by sea-orm-codegen 0.12.15

use sea_orm::entity::prelude::*;

#[derive(Clone, Debug, PartialEq, DeriveEntityModel, Eq)]
#[sea_orm(table_name = "track")]
pub struct Model {
    #[sea_orm(primary_key)]
    pub id: i32,
    pub title: String,
    pub length: i32,
    #[sea_orm(unique)]
    pub file_location: String,
    pub album: i32,
}

#[derive(Copy, Clone, Debug, EnumIter, DeriveRelation)]
pub enum Relation {
    #[sea_orm(
        belongs_to = "super::album::Entity",
        from = "Column::Album",
        to = "super::album::Column::Id",
        on_update = "Cascade",
        on_delete = "Cascade"
    )]
    Album,
    #[sea_orm(has_many = "super::artist_track::Entity")]
    ArtistTrack,
    #[sea_orm(has_many = "super::playlist_track_item::Entity")]
    PlaylistTrackItem,
    #[sea_orm(has_many = "super::user_likes::Entity")]
    UserLikes,
}

impl Related<super::album::Entity> for Entity {
    fn to() -> RelationDef {
        Relation::Album.def()
    }
}

impl Related<super::artist_track::Entity> for Entity {
    fn to() -> RelationDef {
        Relation::ArtistTrack.def()
    }
}

impl Related<super::playlist_track_item::Entity> for Entity {
    fn to() -> RelationDef {
        Relation::PlaylistTrackItem.def()
    }
}

impl Related<super::user_likes::Entity> for Entity {
    fn to() -> RelationDef {
        Relation::UserLikes.def()
    }
}

impl Related<super::artist::Entity> for Entity {
    fn to() -> RelationDef {
        super::artist_track::Relation::Artist.def()
    }
    fn via() -> Option<RelationDef> {
        Some(super::artist_track::Relation::Track.def().rev())
    }
}

impl Related<super::user::Entity> for Entity {
    fn to() -> RelationDef {
        super::user_likes::Relation::User.def()
    }
    fn via() -> Option<RelationDef> {
        Some(super::user_likes::Relation::Track.def().rev())
    }
}

impl ActiveModelBehavior for ActiveModel {}
