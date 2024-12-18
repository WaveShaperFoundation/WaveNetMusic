//! `SeaORM` Entity. Generated by sea-orm-codegen 0.12.15

use sea_orm::entity::prelude::*;

#[derive(Clone, Debug, PartialEq, DeriveEntityModel, Eq)]
#[sea_orm(table_name = "artist")]
pub struct Model {
    #[sea_orm(primary_key)]
    pub id: i32,
    pub name: String,
}

#[derive(Copy, Clone, Debug, EnumIter, DeriveRelation)]
pub enum Relation {
    #[sea_orm(has_many = "super::artist_album::Entity")]
    ArtistAlbum,
    #[sea_orm(has_many = "super::artist_track::Entity")]
    ArtistTrack,
}

impl Related<super::artist_album::Entity> for Entity {
    fn to() -> RelationDef {
        Relation::ArtistAlbum.def()
    }
}

impl Related<super::artist_track::Entity> for Entity {
    fn to() -> RelationDef {
        Relation::ArtistTrack.def()
    }
}

impl Related<super::album::Entity> for Entity {
    fn to() -> RelationDef {
        super::artist_album::Relation::Album.def()
    }
    fn via() -> Option<RelationDef> {
        Some(super::artist_album::Relation::Artist.def().rev())
    }
}

impl Related<super::track::Entity> for Entity {
    fn to() -> RelationDef {
        super::artist_track::Relation::Track.def()
    }
    fn via() -> Option<RelationDef> {
        Some(super::artist_track::Relation::Artist.def().rev())
    }
}

impl ActiveModelBehavior for ActiveModel {}
