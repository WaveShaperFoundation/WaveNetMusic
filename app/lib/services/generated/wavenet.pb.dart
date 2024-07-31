//
//  Generated code. Do not modify.
//  source: wavenet.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'wavenet.pbenum.dart';

export 'wavenet.pbenum.dart';

class SearchQueryRequest extends $pb.GeneratedMessage {
  factory SearchQueryRequest({
    $core.String? query,
  }) {
    final $result = create();
    if (query != null) {
      $result.query = query;
    }
    return $result;
  }
  SearchQueryRequest._() : super();
  factory SearchQueryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchQueryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SearchQueryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'query')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchQueryRequest clone() => SearchQueryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchQueryRequest copyWith(void Function(SearchQueryRequest) updates) => super.copyWith((message) => updates(message as SearchQueryRequest)) as SearchQueryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchQueryRequest create() => SearchQueryRequest._();
  SearchQueryRequest createEmptyInstance() => create();
  static $pb.PbList<SearchQueryRequest> createRepeated() => $pb.PbList<SearchQueryRequest>();
  @$core.pragma('dart2js:noInline')
  static SearchQueryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchQueryRequest>(create);
  static SearchQueryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get query => $_getSZ(0);
  @$pb.TagNumber(1)
  set query($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuery() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuery() => clearField(1);
}

class SearchQueryResponse extends $pb.GeneratedMessage {
  factory SearchQueryResponse({
    $core.Iterable<Track>? tracks,
  }) {
    final $result = create();
    if (tracks != null) {
      $result.tracks.addAll(tracks);
    }
    return $result;
  }
  SearchQueryResponse._() : super();
  factory SearchQueryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchQueryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SearchQueryResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..pc<Track>(2, _omitFieldNames ? '' : 'tracks', $pb.PbFieldType.PM, subBuilder: Track.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchQueryResponse clone() => SearchQueryResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchQueryResponse copyWith(void Function(SearchQueryResponse) updates) => super.copyWith((message) => updates(message as SearchQueryResponse)) as SearchQueryResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchQueryResponse create() => SearchQueryResponse._();
  SearchQueryResponse createEmptyInstance() => create();
  static $pb.PbList<SearchQueryResponse> createRepeated() => $pb.PbList<SearchQueryResponse>();
  @$core.pragma('dart2js:noInline')
  static SearchQueryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchQueryResponse>(create);
  static SearchQueryResponse? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<Track> get tracks => $_getList(0);
}

class GetAlbumsResponse extends $pb.GeneratedMessage {
  factory GetAlbumsResponse({
    $core.Iterable<Album>? albums,
  }) {
    final $result = create();
    if (albums != null) {
      $result.albums.addAll(albums);
    }
    return $result;
  }
  GetAlbumsResponse._() : super();
  factory GetAlbumsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAlbumsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAlbumsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..pc<Album>(1, _omitFieldNames ? '' : 'albums', $pb.PbFieldType.PM, subBuilder: Album.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAlbumsResponse clone() => GetAlbumsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAlbumsResponse copyWith(void Function(GetAlbumsResponse) updates) => super.copyWith((message) => updates(message as GetAlbumsResponse)) as GetAlbumsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAlbumsResponse create() => GetAlbumsResponse._();
  GetAlbumsResponse createEmptyInstance() => create();
  static $pb.PbList<GetAlbumsResponse> createRepeated() => $pb.PbList<GetAlbumsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAlbumsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAlbumsResponse>(create);
  static GetAlbumsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Album> get albums => $_getList(0);
}

class GetAlbumRequest extends $pb.GeneratedMessage {
  factory GetAlbumRequest({
    $core.int? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetAlbumRequest._() : super();
  factory GetAlbumRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAlbumRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAlbumRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAlbumRequest clone() => GetAlbumRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAlbumRequest copyWith(void Function(GetAlbumRequest) updates) => super.copyWith((message) => updates(message as GetAlbumRequest)) as GetAlbumRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAlbumRequest create() => GetAlbumRequest._();
  GetAlbumRequest createEmptyInstance() => create();
  static $pb.PbList<GetAlbumRequest> createRepeated() => $pb.PbList<GetAlbumRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAlbumRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAlbumRequest>(create);
  static GetAlbumRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetTrackRequest extends $pb.GeneratedMessage {
  factory GetTrackRequest({
    $core.int? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetTrackRequest._() : super();
  factory GetTrackRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTrackRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTrackRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTrackRequest clone() => GetTrackRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTrackRequest copyWith(void Function(GetTrackRequest) updates) => super.copyWith((message) => updates(message as GetTrackRequest)) as GetTrackRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTrackRequest create() => GetTrackRequest._();
  GetTrackRequest createEmptyInstance() => create();
  static $pb.PbList<GetTrackRequest> createRepeated() => $pb.PbList<GetTrackRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTrackRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTrackRequest>(create);
  static GetTrackRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetArtistRequest extends $pb.GeneratedMessage {
  factory GetArtistRequest({
    $core.int? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetArtistRequest._() : super();
  factory GetArtistRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetArtistRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetArtistRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetArtistRequest clone() => GetArtistRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetArtistRequest copyWith(void Function(GetArtistRequest) updates) => super.copyWith((message) => updates(message as GetArtistRequest)) as GetArtistRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetArtistRequest create() => GetArtistRequest._();
  GetArtistRequest createEmptyInstance() => create();
  static $pb.PbList<GetArtistRequest> createRepeated() => $pb.PbList<GetArtistRequest>();
  @$core.pragma('dart2js:noInline')
  static GetArtistRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetArtistRequest>(create);
  static GetArtistRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetArtistsResponse extends $pb.GeneratedMessage {
  factory GetArtistsResponse({
    $core.Iterable<Artist>? artists,
  }) {
    final $result = create();
    if (artists != null) {
      $result.artists.addAll(artists);
    }
    return $result;
  }
  GetArtistsResponse._() : super();
  factory GetArtistsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetArtistsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetArtistsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..pc<Artist>(1, _omitFieldNames ? '' : 'artists', $pb.PbFieldType.PM, subBuilder: Artist.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetArtistsResponse clone() => GetArtistsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetArtistsResponse copyWith(void Function(GetArtistsResponse) updates) => super.copyWith((message) => updates(message as GetArtistsResponse)) as GetArtistsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetArtistsResponse create() => GetArtistsResponse._();
  GetArtistsResponse createEmptyInstance() => create();
  static $pb.PbList<GetArtistsResponse> createRepeated() => $pb.PbList<GetArtistsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetArtistsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetArtistsResponse>(create);
  static GetArtistsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Artist> get artists => $_getList(0);
}

class GetTracksResponse extends $pb.GeneratedMessage {
  factory GetTracksResponse({
    $core.Iterable<Track>? tracks,
  }) {
    final $result = create();
    if (tracks != null) {
      $result.tracks.addAll(tracks);
    }
    return $result;
  }
  GetTracksResponse._() : super();
  factory GetTracksResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTracksResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTracksResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..pc<Track>(1, _omitFieldNames ? '' : 'tracks', $pb.PbFieldType.PM, subBuilder: Track.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTracksResponse clone() => GetTracksResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTracksResponse copyWith(void Function(GetTracksResponse) updates) => super.copyWith((message) => updates(message as GetTracksResponse)) as GetTracksResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTracksResponse create() => GetTracksResponse._();
  GetTracksResponse createEmptyInstance() => create();
  static $pb.PbList<GetTracksResponse> createRepeated() => $pb.PbList<GetTracksResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTracksResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTracksResponse>(create);
  static GetTracksResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Track> get tracks => $_getList(0);
}

class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();
  Empty._() : super();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Empty', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class Artist extends $pb.GeneratedMessage {
  factory Artist({
    $core.int? id,
    $core.String? name,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  Artist._() : super();
  factory Artist.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Artist.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Artist', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Artist clone() => Artist()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Artist copyWith(void Function(Artist) updates) => super.copyWith((message) => updates(message as Artist)) as Artist;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Artist create() => Artist._();
  Artist createEmptyInstance() => create();
  static $pb.PbList<Artist> createRepeated() => $pb.PbList<Artist>();
  @$core.pragma('dart2js:noInline')
  static Artist getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Artist>(create);
  static Artist? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class ArtistWithAlbums extends $pb.GeneratedMessage {
  factory ArtistWithAlbums({
    Artist? artist,
    $core.Iterable<Album>? albums,
  }) {
    final $result = create();
    if (artist != null) {
      $result.artist = artist;
    }
    if (albums != null) {
      $result.albums.addAll(albums);
    }
    return $result;
  }
  ArtistWithAlbums._() : super();
  factory ArtistWithAlbums.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ArtistWithAlbums.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ArtistWithAlbums', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..aOM<Artist>(1, _omitFieldNames ? '' : 'artist', subBuilder: Artist.create)
    ..pc<Album>(2, _omitFieldNames ? '' : 'albums', $pb.PbFieldType.PM, subBuilder: Album.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ArtistWithAlbums clone() => ArtistWithAlbums()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ArtistWithAlbums copyWith(void Function(ArtistWithAlbums) updates) => super.copyWith((message) => updates(message as ArtistWithAlbums)) as ArtistWithAlbums;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArtistWithAlbums create() => ArtistWithAlbums._();
  ArtistWithAlbums createEmptyInstance() => create();
  static $pb.PbList<ArtistWithAlbums> createRepeated() => $pb.PbList<ArtistWithAlbums>();
  @$core.pragma('dart2js:noInline')
  static ArtistWithAlbums getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ArtistWithAlbums>(create);
  static ArtistWithAlbums? _defaultInstance;

  @$pb.TagNumber(1)
  Artist get artist => $_getN(0);
  @$pb.TagNumber(1)
  set artist(Artist v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasArtist() => $_has(0);
  @$pb.TagNumber(1)
  void clearArtist() => clearField(1);
  @$pb.TagNumber(1)
  Artist ensureArtist() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<Album> get albums => $_getList(1);
}

class Album extends $pb.GeneratedMessage {
  factory Album({
    $core.int? id,
    $core.String? name,
    $core.Iterable<Artist>? artists,
    $core.int? year,
    $core.String? blurhash,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (artists != null) {
      $result.artists.addAll(artists);
    }
    if (year != null) {
      $result.year = year;
    }
    if (blurhash != null) {
      $result.blurhash = blurhash;
    }
    return $result;
  }
  Album._() : super();
  factory Album.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Album.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Album', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..pc<Artist>(3, _omitFieldNames ? '' : 'artists', $pb.PbFieldType.PM, subBuilder: Artist.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'year', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'blurhash')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Album clone() => Album()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Album copyWith(void Function(Album) updates) => super.copyWith((message) => updates(message as Album)) as Album;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Album create() => Album._();
  Album createEmptyInstance() => create();
  static $pb.PbList<Album> createRepeated() => $pb.PbList<Album>();
  @$core.pragma('dart2js:noInline')
  static Album getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Album>(create);
  static Album? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<Artist> get artists => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get year => $_getIZ(3);
  @$pb.TagNumber(4)
  set year($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasYear() => $_has(3);
  @$pb.TagNumber(4)
  void clearYear() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get blurhash => $_getSZ(4);
  @$pb.TagNumber(5)
  set blurhash($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBlurhash() => $_has(4);
  @$pb.TagNumber(5)
  void clearBlurhash() => clearField(5);
}

class AlbumDetails extends $pb.GeneratedMessage {
  factory AlbumDetails({
    $core.int? id,
    $core.String? name,
    $core.Iterable<Artist>? artists,
    $core.int? year,
    $core.String? blurhash,
    $core.Iterable<AlbumTrack>? tracks,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (artists != null) {
      $result.artists.addAll(artists);
    }
    if (year != null) {
      $result.year = year;
    }
    if (blurhash != null) {
      $result.blurhash = blurhash;
    }
    if (tracks != null) {
      $result.tracks.addAll(tracks);
    }
    return $result;
  }
  AlbumDetails._() : super();
  factory AlbumDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AlbumDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AlbumDetails', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..pc<Artist>(3, _omitFieldNames ? '' : 'artists', $pb.PbFieldType.PM, subBuilder: Artist.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'year', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'blurhash')
    ..pc<AlbumTrack>(6, _omitFieldNames ? '' : 'tracks', $pb.PbFieldType.PM, subBuilder: AlbumTrack.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AlbumDetails clone() => AlbumDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AlbumDetails copyWith(void Function(AlbumDetails) updates) => super.copyWith((message) => updates(message as AlbumDetails)) as AlbumDetails;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AlbumDetails create() => AlbumDetails._();
  AlbumDetails createEmptyInstance() => create();
  static $pb.PbList<AlbumDetails> createRepeated() => $pb.PbList<AlbumDetails>();
  @$core.pragma('dart2js:noInline')
  static AlbumDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AlbumDetails>(create);
  static AlbumDetails? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<Artist> get artists => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get year => $_getIZ(3);
  @$pb.TagNumber(4)
  set year($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasYear() => $_has(3);
  @$pb.TagNumber(4)
  void clearYear() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get blurhash => $_getSZ(4);
  @$pb.TagNumber(5)
  set blurhash($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBlurhash() => $_has(4);
  @$pb.TagNumber(5)
  void clearBlurhash() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<AlbumTrack> get tracks => $_getList(5);
}

class AlbumTrack extends $pb.GeneratedMessage {
  factory AlbumTrack({
    $core.int? id,
    $core.String? name,
    $core.Iterable<Artist>? artists,
    $core.int? year,
    $core.int? length,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (artists != null) {
      $result.artists.addAll(artists);
    }
    if (year != null) {
      $result.year = year;
    }
    if (length != null) {
      $result.length = length;
    }
    return $result;
  }
  AlbumTrack._() : super();
  factory AlbumTrack.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AlbumTrack.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AlbumTrack', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..pc<Artist>(3, _omitFieldNames ? '' : 'artists', $pb.PbFieldType.PM, subBuilder: Artist.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'year', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'length', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AlbumTrack clone() => AlbumTrack()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AlbumTrack copyWith(void Function(AlbumTrack) updates) => super.copyWith((message) => updates(message as AlbumTrack)) as AlbumTrack;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AlbumTrack create() => AlbumTrack._();
  AlbumTrack createEmptyInstance() => create();
  static $pb.PbList<AlbumTrack> createRepeated() => $pb.PbList<AlbumTrack>();
  @$core.pragma('dart2js:noInline')
  static AlbumTrack getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AlbumTrack>(create);
  static AlbumTrack? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<Artist> get artists => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get year => $_getIZ(3);
  @$pb.TagNumber(4)
  set year($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasYear() => $_has(3);
  @$pb.TagNumber(4)
  void clearYear() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get length => $_getIZ(4);
  @$pb.TagNumber(5)
  set length($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLength() => $_has(4);
  @$pb.TagNumber(5)
  void clearLength() => clearField(5);
}

class Track extends $pb.GeneratedMessage {
  factory Track({
    $core.int? id,
    $core.String? name,
    Album? album,
    $core.Iterable<Artist>? artists,
    $core.int? year,
    $core.int? length,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (album != null) {
      $result.album = album;
    }
    if (artists != null) {
      $result.artists.addAll(artists);
    }
    if (year != null) {
      $result.year = year;
    }
    if (length != null) {
      $result.length = length;
    }
    return $result;
  }
  Track._() : super();
  factory Track.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Track.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Track', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOM<Album>(3, _omitFieldNames ? '' : 'album', subBuilder: Album.create)
    ..pc<Artist>(4, _omitFieldNames ? '' : 'artists', $pb.PbFieldType.PM, subBuilder: Artist.create)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'year', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'length', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Track clone() => Track()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Track copyWith(void Function(Track) updates) => super.copyWith((message) => updates(message as Track)) as Track;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Track create() => Track._();
  Track createEmptyInstance() => create();
  static $pb.PbList<Track> createRepeated() => $pb.PbList<Track>();
  @$core.pragma('dart2js:noInline')
  static Track getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Track>(create);
  static Track? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  Album get album => $_getN(2);
  @$pb.TagNumber(3)
  set album(Album v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAlbum() => $_has(2);
  @$pb.TagNumber(3)
  void clearAlbum() => clearField(3);
  @$pb.TagNumber(3)
  Album ensureAlbum() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<Artist> get artists => $_getList(3);

  @$pb.TagNumber(5)
  $core.int get year => $_getIZ(4);
  @$pb.TagNumber(5)
  set year($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasYear() => $_has(4);
  @$pb.TagNumber(5)
  void clearYear() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get length => $_getIZ(5);
  @$pb.TagNumber(6)
  set length($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLength() => $_has(5);
  @$pb.TagNumber(6)
  void clearLength() => clearField(6);
}

class LoginRequest extends $pb.GeneratedMessage {
  factory LoginRequest({
    $core.String? username,
    $core.String? password,
  }) {
    final $result = create();
    if (username != null) {
      $result.username = username;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  LoginRequest._() : super();
  factory LoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoginRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'username')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginRequest clone() => LoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginRequest copyWith(void Function(LoginRequest) updates) => super.copyWith((message) => updates(message as LoginRequest)) as LoginRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginRequest create() => LoginRequest._();
  LoginRequest createEmptyInstance() => create();
  static $pb.PbList<LoginRequest> createRepeated() => $pb.PbList<LoginRequest>();
  @$core.pragma('dart2js:noInline')
  static LoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginRequest>(create);
  static LoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class LoginResponse extends $pb.GeneratedMessage {
  factory LoginResponse({
    $core.String? token,
    $core.int? status,
  }) {
    final $result = create();
    if (token != null) {
      $result.token = token;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  LoginResponse._() : super();
  factory LoginResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoginResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginResponse clone() => LoginResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginResponse copyWith(void Function(LoginResponse) updates) => super.copyWith((message) => updates(message as LoginResponse)) as LoginResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginResponse create() => LoginResponse._();
  LoginResponse createEmptyInstance() => create();
  static $pb.PbList<LoginResponse> createRepeated() => $pb.PbList<LoginResponse>();
  @$core.pragma('dart2js:noInline')
  static LoginResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginResponse>(create);
  static LoginResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get status => $_getIZ(1);
  @$pb.TagNumber(2)
  set status($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
}

class RegisterRequest extends $pb.GeneratedMessage {
  factory RegisterRequest({
    $core.String? username,
    $core.String? password,
    $core.String? email,
    $core.String? publicName,
  }) {
    final $result = create();
    if (username != null) {
      $result.username = username;
    }
    if (password != null) {
      $result.password = password;
    }
    if (email != null) {
      $result.email = email;
    }
    if (publicName != null) {
      $result.publicName = publicName;
    }
    return $result;
  }
  RegisterRequest._() : super();
  factory RegisterRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegisterRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'username')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..aOS(4, _omitFieldNames ? '' : 'publicName', protoName: 'publicName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterRequest clone() => RegisterRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterRequest copyWith(void Function(RegisterRequest) updates) => super.copyWith((message) => updates(message as RegisterRequest)) as RegisterRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterRequest create() => RegisterRequest._();
  RegisterRequest createEmptyInstance() => create();
  static $pb.PbList<RegisterRequest> createRepeated() => $pb.PbList<RegisterRequest>();
  @$core.pragma('dart2js:noInline')
  static RegisterRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterRequest>(create);
  static RegisterRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get publicName => $_getSZ(3);
  @$pb.TagNumber(4)
  set publicName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPublicName() => $_has(3);
  @$pb.TagNumber(4)
  void clearPublicName() => clearField(4);
}

class RegisterResponse extends $pb.GeneratedMessage {
  factory RegisterResponse({
    $core.int? status,
    $core.String? token,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (token != null) {
      $result.token = token;
    }
    return $result;
  }
  RegisterResponse._() : super();
  factory RegisterResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegisterResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'token')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterResponse clone() => RegisterResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterResponse copyWith(void Function(RegisterResponse) updates) => super.copyWith((message) => updates(message as RegisterResponse)) as RegisterResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterResponse create() => RegisterResponse._();
  RegisterResponse createEmptyInstance() => create();
  static $pb.PbList<RegisterResponse> createRepeated() => $pb.PbList<RegisterResponse>();
  @$core.pragma('dart2js:noInline')
  static RegisterResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterResponse>(create);
  static RegisterResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get token => $_getSZ(1);
  @$pb.TagNumber(2)
  set token($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => clearField(2);
}

class AddTrackToLikedRequest extends $pb.GeneratedMessage {
  factory AddTrackToLikedRequest({
    $core.int? trackId,
  }) {
    final $result = create();
    if (trackId != null) {
      $result.trackId = trackId;
    }
    return $result;
  }
  AddTrackToLikedRequest._() : super();
  factory AddTrackToLikedRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddTrackToLikedRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddTrackToLikedRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'trackId', $pb.PbFieldType.O3, protoName: 'trackId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddTrackToLikedRequest clone() => AddTrackToLikedRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddTrackToLikedRequest copyWith(void Function(AddTrackToLikedRequest) updates) => super.copyWith((message) => updates(message as AddTrackToLikedRequest)) as AddTrackToLikedRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddTrackToLikedRequest create() => AddTrackToLikedRequest._();
  AddTrackToLikedRequest createEmptyInstance() => create();
  static $pb.PbList<AddTrackToLikedRequest> createRepeated() => $pb.PbList<AddTrackToLikedRequest>();
  @$core.pragma('dart2js:noInline')
  static AddTrackToLikedRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddTrackToLikedRequest>(create);
  static AddTrackToLikedRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get trackId => $_getIZ(0);
  @$pb.TagNumber(1)
  set trackId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrackId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrackId() => clearField(1);
}

class AddTrackToLikedResponse extends $pb.GeneratedMessage {
  factory AddTrackToLikedResponse({
    ActionResponse? status,
    $core.int? likedId,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (likedId != null) {
      $result.likedId = likedId;
    }
    return $result;
  }
  AddTrackToLikedResponse._() : super();
  factory AddTrackToLikedResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddTrackToLikedResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddTrackToLikedResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..aOM<ActionResponse>(1, _omitFieldNames ? '' : 'status', subBuilder: ActionResponse.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'likedId', $pb.PbFieldType.O3, protoName: 'likedId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddTrackToLikedResponse clone() => AddTrackToLikedResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddTrackToLikedResponse copyWith(void Function(AddTrackToLikedResponse) updates) => super.copyWith((message) => updates(message as AddTrackToLikedResponse)) as AddTrackToLikedResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddTrackToLikedResponse create() => AddTrackToLikedResponse._();
  AddTrackToLikedResponse createEmptyInstance() => create();
  static $pb.PbList<AddTrackToLikedResponse> createRepeated() => $pb.PbList<AddTrackToLikedResponse>();
  @$core.pragma('dart2js:noInline')
  static AddTrackToLikedResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddTrackToLikedResponse>(create);
  static AddTrackToLikedResponse? _defaultInstance;

  @$pb.TagNumber(1)
  ActionResponse get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(ActionResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
  @$pb.TagNumber(1)
  ActionResponse ensureStatus() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get likedId => $_getIZ(1);
  @$pb.TagNumber(2)
  set likedId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLikedId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLikedId() => clearField(2);
}

class RemoveTrackFromLikedRequest extends $pb.GeneratedMessage {
  factory RemoveTrackFromLikedRequest({
    $core.int? likedId,
  }) {
    final $result = create();
    if (likedId != null) {
      $result.likedId = likedId;
    }
    return $result;
  }
  RemoveTrackFromLikedRequest._() : super();
  factory RemoveTrackFromLikedRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveTrackFromLikedRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveTrackFromLikedRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'likedId', $pb.PbFieldType.O3, protoName: 'likedId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveTrackFromLikedRequest clone() => RemoveTrackFromLikedRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveTrackFromLikedRequest copyWith(void Function(RemoveTrackFromLikedRequest) updates) => super.copyWith((message) => updates(message as RemoveTrackFromLikedRequest)) as RemoveTrackFromLikedRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveTrackFromLikedRequest create() => RemoveTrackFromLikedRequest._();
  RemoveTrackFromLikedRequest createEmptyInstance() => create();
  static $pb.PbList<RemoveTrackFromLikedRequest> createRepeated() => $pb.PbList<RemoveTrackFromLikedRequest>();
  @$core.pragma('dart2js:noInline')
  static RemoveTrackFromLikedRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveTrackFromLikedRequest>(create);
  static RemoveTrackFromLikedRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get likedId => $_getIZ(0);
  @$pb.TagNumber(1)
  set likedId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLikedId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLikedId() => clearField(1);
}

class RemoveTrackFromLikedResponse extends $pb.GeneratedMessage {
  factory RemoveTrackFromLikedResponse({
    ActionResponse? status,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  RemoveTrackFromLikedResponse._() : super();
  factory RemoveTrackFromLikedResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveTrackFromLikedResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveTrackFromLikedResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..aOM<ActionResponse>(1, _omitFieldNames ? '' : 'status', subBuilder: ActionResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveTrackFromLikedResponse clone() => RemoveTrackFromLikedResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveTrackFromLikedResponse copyWith(void Function(RemoveTrackFromLikedResponse) updates) => super.copyWith((message) => updates(message as RemoveTrackFromLikedResponse)) as RemoveTrackFromLikedResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveTrackFromLikedResponse create() => RemoveTrackFromLikedResponse._();
  RemoveTrackFromLikedResponse createEmptyInstance() => create();
  static $pb.PbList<RemoveTrackFromLikedResponse> createRepeated() => $pb.PbList<RemoveTrackFromLikedResponse>();
  @$core.pragma('dart2js:noInline')
  static RemoveTrackFromLikedResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveTrackFromLikedResponse>(create);
  static RemoveTrackFromLikedResponse? _defaultInstance;

  @$pb.TagNumber(1)
  ActionResponse get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(ActionResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
  @$pb.TagNumber(1)
  ActionResponse ensureStatus() => $_ensure(0);
}

class ActionResponse extends $pb.GeneratedMessage {
  factory ActionResponse({
    ActionResponse_Status? status,
    $core.String? message,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  ActionResponse._() : super();
  factory ActionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ActionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..e<ActionResponse_Status>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: ActionResponse_Status.OK, valueOf: ActionResponse_Status.valueOf, enumValues: ActionResponse_Status.values)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActionResponse clone() => ActionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActionResponse copyWith(void Function(ActionResponse) updates) => super.copyWith((message) => updates(message as ActionResponse)) as ActionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActionResponse create() => ActionResponse._();
  ActionResponse createEmptyInstance() => create();
  static $pb.PbList<ActionResponse> createRepeated() => $pb.PbList<ActionResponse>();
  @$core.pragma('dart2js:noInline')
  static ActionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActionResponse>(create);
  static ActionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  ActionResponse_Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(ActionResponse_Status v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class GetPlaylistRequest extends $pb.GeneratedMessage {
  factory GetPlaylistRequest({
    $core.int? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetPlaylistRequest._() : super();
  factory GetPlaylistRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPlaylistRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPlaylistRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPlaylistRequest clone() => GetPlaylistRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPlaylistRequest copyWith(void Function(GetPlaylistRequest) updates) => super.copyWith((message) => updates(message as GetPlaylistRequest)) as GetPlaylistRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPlaylistRequest create() => GetPlaylistRequest._();
  GetPlaylistRequest createEmptyInstance() => create();
  static $pb.PbList<GetPlaylistRequest> createRepeated() => $pb.PbList<GetPlaylistRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPlaylistRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPlaylistRequest>(create);
  static GetPlaylistRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetPlaylistsResponse extends $pb.GeneratedMessage {
  factory GetPlaylistsResponse({
    $core.Iterable<PlaylistResponse>? playlists,
  }) {
    final $result = create();
    if (playlists != null) {
      $result.playlists.addAll(playlists);
    }
    return $result;
  }
  GetPlaylistsResponse._() : super();
  factory GetPlaylistsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPlaylistsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPlaylistsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..pc<PlaylistResponse>(1, _omitFieldNames ? '' : 'playlists', $pb.PbFieldType.PM, subBuilder: PlaylistResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPlaylistsResponse clone() => GetPlaylistsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPlaylistsResponse copyWith(void Function(GetPlaylistsResponse) updates) => super.copyWith((message) => updates(message as GetPlaylistsResponse)) as GetPlaylistsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPlaylistsResponse create() => GetPlaylistsResponse._();
  GetPlaylistsResponse createEmptyInstance() => create();
  static $pb.PbList<GetPlaylistsResponse> createRepeated() => $pb.PbList<GetPlaylistsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPlaylistsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPlaylistsResponse>(create);
  static GetPlaylistsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PlaylistResponse> get playlists => $_getList(0);
}

class CreatePlaylistRequest extends $pb.GeneratedMessage {
  factory CreatePlaylistRequest({
    $core.String? title,
    $core.String? description,
  }) {
    final $result = create();
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    return $result;
  }
  CreatePlaylistRequest._() : super();
  factory CreatePlaylistRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePlaylistRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePlaylistRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePlaylistRequest clone() => CreatePlaylistRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePlaylistRequest copyWith(void Function(CreatePlaylistRequest) updates) => super.copyWith((message) => updates(message as CreatePlaylistRequest)) as CreatePlaylistRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePlaylistRequest create() => CreatePlaylistRequest._();
  CreatePlaylistRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePlaylistRequest> createRepeated() => $pb.PbList<CreatePlaylistRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePlaylistRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePlaylistRequest>(create);
  static CreatePlaylistRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);
}

class ChangePlaylistResponse extends $pb.GeneratedMessage {
  factory ChangePlaylistResponse({
    ActionResponse? status,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  ChangePlaylistResponse._() : super();
  factory ChangePlaylistResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangePlaylistResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChangePlaylistResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..aOM<ActionResponse>(1, _omitFieldNames ? '' : 'status', subBuilder: ActionResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangePlaylistResponse clone() => ChangePlaylistResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangePlaylistResponse copyWith(void Function(ChangePlaylistResponse) updates) => super.copyWith((message) => updates(message as ChangePlaylistResponse)) as ChangePlaylistResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangePlaylistResponse create() => ChangePlaylistResponse._();
  ChangePlaylistResponse createEmptyInstance() => create();
  static $pb.PbList<ChangePlaylistResponse> createRepeated() => $pb.PbList<ChangePlaylistResponse>();
  @$core.pragma('dart2js:noInline')
  static ChangePlaylistResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangePlaylistResponse>(create);
  static ChangePlaylistResponse? _defaultInstance;

  @$pb.TagNumber(1)
  ActionResponse get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(ActionResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
  @$pb.TagNumber(1)
  ActionResponse ensureStatus() => $_ensure(0);
}

class AddTrackToPlaylistRequest extends $pb.GeneratedMessage {
  factory AddTrackToPlaylistRequest({
    $core.int? playlistId,
    $core.int? trackId,
  }) {
    final $result = create();
    if (playlistId != null) {
      $result.playlistId = playlistId;
    }
    if (trackId != null) {
      $result.trackId = trackId;
    }
    return $result;
  }
  AddTrackToPlaylistRequest._() : super();
  factory AddTrackToPlaylistRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddTrackToPlaylistRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddTrackToPlaylistRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'playlistId', $pb.PbFieldType.O3, protoName: 'playlistId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'trackId', $pb.PbFieldType.O3, protoName: 'trackId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddTrackToPlaylistRequest clone() => AddTrackToPlaylistRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddTrackToPlaylistRequest copyWith(void Function(AddTrackToPlaylistRequest) updates) => super.copyWith((message) => updates(message as AddTrackToPlaylistRequest)) as AddTrackToPlaylistRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddTrackToPlaylistRequest create() => AddTrackToPlaylistRequest._();
  AddTrackToPlaylistRequest createEmptyInstance() => create();
  static $pb.PbList<AddTrackToPlaylistRequest> createRepeated() => $pb.PbList<AddTrackToPlaylistRequest>();
  @$core.pragma('dart2js:noInline')
  static AddTrackToPlaylistRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddTrackToPlaylistRequest>(create);
  static AddTrackToPlaylistRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get playlistId => $_getIZ(0);
  @$pb.TagNumber(1)
  set playlistId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlaylistId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlaylistId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get trackId => $_getIZ(1);
  @$pb.TagNumber(2)
  set trackId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTrackId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTrackId() => clearField(2);
}

class AddTrackToPlaylistResponse extends $pb.GeneratedMessage {
  factory AddTrackToPlaylistResponse({
    ActionResponse? status,
    $core.int? addedTrackId,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (addedTrackId != null) {
      $result.addedTrackId = addedTrackId;
    }
    return $result;
  }
  AddTrackToPlaylistResponse._() : super();
  factory AddTrackToPlaylistResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddTrackToPlaylistResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddTrackToPlaylistResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..aOM<ActionResponse>(1, _omitFieldNames ? '' : 'status', subBuilder: ActionResponse.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'addedTrackId', $pb.PbFieldType.O3, protoName: 'addedTrackId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddTrackToPlaylistResponse clone() => AddTrackToPlaylistResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddTrackToPlaylistResponse copyWith(void Function(AddTrackToPlaylistResponse) updates) => super.copyWith((message) => updates(message as AddTrackToPlaylistResponse)) as AddTrackToPlaylistResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddTrackToPlaylistResponse create() => AddTrackToPlaylistResponse._();
  AddTrackToPlaylistResponse createEmptyInstance() => create();
  static $pb.PbList<AddTrackToPlaylistResponse> createRepeated() => $pb.PbList<AddTrackToPlaylistResponse>();
  @$core.pragma('dart2js:noInline')
  static AddTrackToPlaylistResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddTrackToPlaylistResponse>(create);
  static AddTrackToPlaylistResponse? _defaultInstance;

  @$pb.TagNumber(1)
  ActionResponse get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(ActionResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
  @$pb.TagNumber(1)
  ActionResponse ensureStatus() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get addedTrackId => $_getIZ(1);
  @$pb.TagNumber(2)
  set addedTrackId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddedTrackId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddedTrackId() => clearField(2);
}

class MoveTrackInPlaylistRequest extends $pb.GeneratedMessage {
  factory MoveTrackInPlaylistRequest({
    $core.int? playlistTrackId,
    $core.int? afterPlaylistTrackId,
  }) {
    final $result = create();
    if (playlistTrackId != null) {
      $result.playlistTrackId = playlistTrackId;
    }
    if (afterPlaylistTrackId != null) {
      $result.afterPlaylistTrackId = afterPlaylistTrackId;
    }
    return $result;
  }
  MoveTrackInPlaylistRequest._() : super();
  factory MoveTrackInPlaylistRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MoveTrackInPlaylistRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MoveTrackInPlaylistRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'playlistTrackId', $pb.PbFieldType.O3, protoName: 'playlistTrackId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'afterPlaylistTrackId', $pb.PbFieldType.O3, protoName: 'afterPlaylistTrackId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MoveTrackInPlaylistRequest clone() => MoveTrackInPlaylistRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MoveTrackInPlaylistRequest copyWith(void Function(MoveTrackInPlaylistRequest) updates) => super.copyWith((message) => updates(message as MoveTrackInPlaylistRequest)) as MoveTrackInPlaylistRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MoveTrackInPlaylistRequest create() => MoveTrackInPlaylistRequest._();
  MoveTrackInPlaylistRequest createEmptyInstance() => create();
  static $pb.PbList<MoveTrackInPlaylistRequest> createRepeated() => $pb.PbList<MoveTrackInPlaylistRequest>();
  @$core.pragma('dart2js:noInline')
  static MoveTrackInPlaylistRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MoveTrackInPlaylistRequest>(create);
  static MoveTrackInPlaylistRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get playlistTrackId => $_getIZ(0);
  @$pb.TagNumber(1)
  set playlistTrackId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlaylistTrackId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlaylistTrackId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get afterPlaylistTrackId => $_getIZ(1);
  @$pb.TagNumber(2)
  set afterPlaylistTrackId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAfterPlaylistTrackId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAfterPlaylistTrackId() => clearField(2);
}

class MoveTrackInPlaylistResponse extends $pb.GeneratedMessage {
  factory MoveTrackInPlaylistResponse({
    ActionResponse? status,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  MoveTrackInPlaylistResponse._() : super();
  factory MoveTrackInPlaylistResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MoveTrackInPlaylistResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MoveTrackInPlaylistResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..aOM<ActionResponse>(1, _omitFieldNames ? '' : 'status', subBuilder: ActionResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MoveTrackInPlaylistResponse clone() => MoveTrackInPlaylistResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MoveTrackInPlaylistResponse copyWith(void Function(MoveTrackInPlaylistResponse) updates) => super.copyWith((message) => updates(message as MoveTrackInPlaylistResponse)) as MoveTrackInPlaylistResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MoveTrackInPlaylistResponse create() => MoveTrackInPlaylistResponse._();
  MoveTrackInPlaylistResponse createEmptyInstance() => create();
  static $pb.PbList<MoveTrackInPlaylistResponse> createRepeated() => $pb.PbList<MoveTrackInPlaylistResponse>();
  @$core.pragma('dart2js:noInline')
  static MoveTrackInPlaylistResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MoveTrackInPlaylistResponse>(create);
  static MoveTrackInPlaylistResponse? _defaultInstance;

  @$pb.TagNumber(1)
  ActionResponse get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(ActionResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
  @$pb.TagNumber(1)
  ActionResponse ensureStatus() => $_ensure(0);
}

class RemoveTrackFromPlaylistRequest extends $pb.GeneratedMessage {
  factory RemoveTrackFromPlaylistRequest({
    $core.int? playlistTrackId,
  }) {
    final $result = create();
    if (playlistTrackId != null) {
      $result.playlistTrackId = playlistTrackId;
    }
    return $result;
  }
  RemoveTrackFromPlaylistRequest._() : super();
  factory RemoveTrackFromPlaylistRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveTrackFromPlaylistRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveTrackFromPlaylistRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'playlistTrackId', $pb.PbFieldType.O3, protoName: 'playlistTrackId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveTrackFromPlaylistRequest clone() => RemoveTrackFromPlaylistRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveTrackFromPlaylistRequest copyWith(void Function(RemoveTrackFromPlaylistRequest) updates) => super.copyWith((message) => updates(message as RemoveTrackFromPlaylistRequest)) as RemoveTrackFromPlaylistRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveTrackFromPlaylistRequest create() => RemoveTrackFromPlaylistRequest._();
  RemoveTrackFromPlaylistRequest createEmptyInstance() => create();
  static $pb.PbList<RemoveTrackFromPlaylistRequest> createRepeated() => $pb.PbList<RemoveTrackFromPlaylistRequest>();
  @$core.pragma('dart2js:noInline')
  static RemoveTrackFromPlaylistRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveTrackFromPlaylistRequest>(create);
  static RemoveTrackFromPlaylistRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get playlistTrackId => $_getIZ(0);
  @$pb.TagNumber(1)
  set playlistTrackId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlaylistTrackId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlaylistTrackId() => clearField(1);
}

class RemoveTrackFromPlaylistResponse extends $pb.GeneratedMessage {
  factory RemoveTrackFromPlaylistResponse({
    ActionResponse? status,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  RemoveTrackFromPlaylistResponse._() : super();
  factory RemoveTrackFromPlaylistResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveTrackFromPlaylistResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveTrackFromPlaylistResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..aOM<ActionResponse>(1, _omitFieldNames ? '' : 'status', subBuilder: ActionResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveTrackFromPlaylistResponse clone() => RemoveTrackFromPlaylistResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveTrackFromPlaylistResponse copyWith(void Function(RemoveTrackFromPlaylistResponse) updates) => super.copyWith((message) => updates(message as RemoveTrackFromPlaylistResponse)) as RemoveTrackFromPlaylistResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveTrackFromPlaylistResponse create() => RemoveTrackFromPlaylistResponse._();
  RemoveTrackFromPlaylistResponse createEmptyInstance() => create();
  static $pb.PbList<RemoveTrackFromPlaylistResponse> createRepeated() => $pb.PbList<RemoveTrackFromPlaylistResponse>();
  @$core.pragma('dart2js:noInline')
  static RemoveTrackFromPlaylistResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveTrackFromPlaylistResponse>(create);
  static RemoveTrackFromPlaylistResponse? _defaultInstance;

  @$pb.TagNumber(1)
  ActionResponse get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(ActionResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
  @$pb.TagNumber(1)
  ActionResponse ensureStatus() => $_ensure(0);
}

class CreatePlaylistResponse extends $pb.GeneratedMessage {
  factory CreatePlaylistResponse({
    ActionResponse? status,
    $core.int? id,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  CreatePlaylistResponse._() : super();
  factory CreatePlaylistResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePlaylistResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePlaylistResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..aOM<ActionResponse>(1, _omitFieldNames ? '' : 'status', subBuilder: ActionResponse.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePlaylistResponse clone() => CreatePlaylistResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePlaylistResponse copyWith(void Function(CreatePlaylistResponse) updates) => super.copyWith((message) => updates(message as CreatePlaylistResponse)) as CreatePlaylistResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePlaylistResponse create() => CreatePlaylistResponse._();
  CreatePlaylistResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePlaylistResponse> createRepeated() => $pb.PbList<CreatePlaylistResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePlaylistResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePlaylistResponse>(create);
  static CreatePlaylistResponse? _defaultInstance;

  @$pb.TagNumber(1)
  ActionResponse get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(ActionResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
  @$pb.TagNumber(1)
  ActionResponse ensureStatus() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
}

class DeletePlaylistRequest extends $pb.GeneratedMessage {
  factory DeletePlaylistRequest({
    $core.int? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  DeletePlaylistRequest._() : super();
  factory DeletePlaylistRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePlaylistRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePlaylistRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePlaylistRequest clone() => DeletePlaylistRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePlaylistRequest copyWith(void Function(DeletePlaylistRequest) updates) => super.copyWith((message) => updates(message as DeletePlaylistRequest)) as DeletePlaylistRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePlaylistRequest create() => DeletePlaylistRequest._();
  DeletePlaylistRequest createEmptyInstance() => create();
  static $pb.PbList<DeletePlaylistRequest> createRepeated() => $pb.PbList<DeletePlaylistRequest>();
  @$core.pragma('dart2js:noInline')
  static DeletePlaylistRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePlaylistRequest>(create);
  static DeletePlaylistRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class DeletePlaylistResponse extends $pb.GeneratedMessage {
  factory DeletePlaylistResponse({
    ActionResponse? status,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  DeletePlaylistResponse._() : super();
  factory DeletePlaylistResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePlaylistResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePlaylistResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..aOM<ActionResponse>(1, _omitFieldNames ? '' : 'status', subBuilder: ActionResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePlaylistResponse clone() => DeletePlaylistResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePlaylistResponse copyWith(void Function(DeletePlaylistResponse) updates) => super.copyWith((message) => updates(message as DeletePlaylistResponse)) as DeletePlaylistResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePlaylistResponse create() => DeletePlaylistResponse._();
  DeletePlaylistResponse createEmptyInstance() => create();
  static $pb.PbList<DeletePlaylistResponse> createRepeated() => $pb.PbList<DeletePlaylistResponse>();
  @$core.pragma('dart2js:noInline')
  static DeletePlaylistResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePlaylistResponse>(create);
  static DeletePlaylistResponse? _defaultInstance;

  @$pb.TagNumber(1)
  ActionResponse get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(ActionResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
  @$pb.TagNumber(1)
  ActionResponse ensureStatus() => $_ensure(0);
}

class ChangePlaylistRequest extends $pb.GeneratedMessage {
  factory ChangePlaylistRequest({
    $core.int? id,
    $core.String? title,
    $core.String? description,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    return $result;
  }
  ChangePlaylistRequest._() : super();
  factory ChangePlaylistRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangePlaylistRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChangePlaylistRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangePlaylistRequest clone() => ChangePlaylistRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangePlaylistRequest copyWith(void Function(ChangePlaylistRequest) updates) => super.copyWith((message) => updates(message as ChangePlaylistRequest)) as ChangePlaylistRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangePlaylistRequest create() => ChangePlaylistRequest._();
  ChangePlaylistRequest createEmptyInstance() => create();
  static $pb.PbList<ChangePlaylistRequest> createRepeated() => $pb.PbList<ChangePlaylistRequest>();
  @$core.pragma('dart2js:noInline')
  static ChangePlaylistRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangePlaylistRequest>(create);
  static ChangePlaylistRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);
}

class PlaylistResponse extends $pb.GeneratedMessage {
  factory PlaylistResponse({
    $core.int? id,
    $core.String? title,
    $core.String? description,
    $core.String? coverSource,
    $fixnum.Int64? createdAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    if (coverSource != null) {
      $result.coverSource = coverSource;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  PlaylistResponse._() : super();
  factory PlaylistResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlaylistResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PlaylistResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOS(4, _omitFieldNames ? '' : 'coverSource', protoName: 'coverSource')
    ..aInt64(5, _omitFieldNames ? '' : 'createdAt', protoName: 'createdAt')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlaylistResponse clone() => PlaylistResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlaylistResponse copyWith(void Function(PlaylistResponse) updates) => super.copyWith((message) => updates(message as PlaylistResponse)) as PlaylistResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlaylistResponse create() => PlaylistResponse._();
  PlaylistResponse createEmptyInstance() => create();
  static $pb.PbList<PlaylistResponse> createRepeated() => $pb.PbList<PlaylistResponse>();
  @$core.pragma('dart2js:noInline')
  static PlaylistResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlaylistResponse>(create);
  static PlaylistResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get coverSource => $_getSZ(3);
  @$pb.TagNumber(4)
  set coverSource($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCoverSource() => $_has(3);
  @$pb.TagNumber(4)
  void clearCoverSource() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get createdAt => $_getI64(4);
  @$pb.TagNumber(5)
  set createdAt($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => clearField(5);
}

class PlaylistDetails extends $pb.GeneratedMessage {
  factory PlaylistDetails({
    $core.int? id,
    $core.String? title,
    $core.String? description,
    $core.String? coverSource,
    $core.int? createdAt,
    $core.Iterable<PlaylistTrack>? tracks,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    if (coverSource != null) {
      $result.coverSource = coverSource;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (tracks != null) {
      $result.tracks.addAll(tracks);
    }
    return $result;
  }
  PlaylistDetails._() : super();
  factory PlaylistDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlaylistDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PlaylistDetails', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOS(4, _omitFieldNames ? '' : 'coverSource', protoName: 'coverSource')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'createdAt', $pb.PbFieldType.O3, protoName: 'createdAt')
    ..pc<PlaylistTrack>(6, _omitFieldNames ? '' : 'tracks', $pb.PbFieldType.PM, subBuilder: PlaylistTrack.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlaylistDetails clone() => PlaylistDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlaylistDetails copyWith(void Function(PlaylistDetails) updates) => super.copyWith((message) => updates(message as PlaylistDetails)) as PlaylistDetails;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlaylistDetails create() => PlaylistDetails._();
  PlaylistDetails createEmptyInstance() => create();
  static $pb.PbList<PlaylistDetails> createRepeated() => $pb.PbList<PlaylistDetails>();
  @$core.pragma('dart2js:noInline')
  static PlaylistDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlaylistDetails>(create);
  static PlaylistDetails? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get coverSource => $_getSZ(3);
  @$pb.TagNumber(4)
  set coverSource($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCoverSource() => $_has(3);
  @$pb.TagNumber(4)
  void clearCoverSource() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get createdAt => $_getIZ(4);
  @$pb.TagNumber(5)
  set createdAt($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<PlaylistTrack> get tracks => $_getList(5);
}

class PlaylistTrack extends $pb.GeneratedMessage {
  factory PlaylistTrack({
    $core.int? id,
    Track? track,
    $core.int? addedBy,
    $core.int? addedAt,
    $core.int? position,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (track != null) {
      $result.track = track;
    }
    if (addedBy != null) {
      $result.addedBy = addedBy;
    }
    if (addedAt != null) {
      $result.addedAt = addedAt;
    }
    if (position != null) {
      $result.position = position;
    }
    return $result;
  }
  PlaylistTrack._() : super();
  factory PlaylistTrack.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlaylistTrack.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PlaylistTrack', package: const $pb.PackageName(_omitMessageNames ? '' : 'wavenet'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOM<Track>(2, _omitFieldNames ? '' : 'track', subBuilder: Track.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'addedBy', $pb.PbFieldType.O3, protoName: 'addedBy')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'addedAt', $pb.PbFieldType.O3, protoName: 'addedAt')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'position', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlaylistTrack clone() => PlaylistTrack()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlaylistTrack copyWith(void Function(PlaylistTrack) updates) => super.copyWith((message) => updates(message as PlaylistTrack)) as PlaylistTrack;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlaylistTrack create() => PlaylistTrack._();
  PlaylistTrack createEmptyInstance() => create();
  static $pb.PbList<PlaylistTrack> createRepeated() => $pb.PbList<PlaylistTrack>();
  @$core.pragma('dart2js:noInline')
  static PlaylistTrack getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlaylistTrack>(create);
  static PlaylistTrack? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  Track get track => $_getN(1);
  @$pb.TagNumber(2)
  set track(Track v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTrack() => $_has(1);
  @$pb.TagNumber(2)
  void clearTrack() => clearField(2);
  @$pb.TagNumber(2)
  Track ensureTrack() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get addedBy => $_getIZ(2);
  @$pb.TagNumber(3)
  set addedBy($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAddedBy() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddedBy() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get addedAt => $_getIZ(3);
  @$pb.TagNumber(4)
  set addedAt($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAddedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearAddedAt() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get position => $_getIZ(4);
  @$pb.TagNumber(5)
  set position($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPosition() => $_has(4);
  @$pb.TagNumber(5)
  void clearPosition() => clearField(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
