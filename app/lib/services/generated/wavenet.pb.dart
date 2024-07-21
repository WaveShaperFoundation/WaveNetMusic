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

import 'package:protobuf/protobuf.dart' as $pb;

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
    $core.Iterable<Track>? tracks,
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
    ..pc<Track>(6, _omitFieldNames ? '' : 'tracks', $pb.PbFieldType.PM, subBuilder: Track.create)
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
  $core.List<Track> get tracks => $_getList(5);
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
    $core.int? username,
    $core.int? password,
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
    ..a<$core.int>(1, _omitFieldNames ? '' : 'username', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'password', $pb.PbFieldType.O3)
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
  $core.int get username => $_getIZ(0);
  @$pb.TagNumber(1)
  set username($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get password => $_getIZ(1);
  @$pb.TagNumber(2)
  set password($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class LoginResponse extends $pb.GeneratedMessage {
  factory LoginResponse({
    $core.int? token,
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
    ..a<$core.int>(1, _omitFieldNames ? '' : 'token', $pb.PbFieldType.O3)
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
  $core.int get token => $_getIZ(0);
  @$pb.TagNumber(1)
  set token($core.int v) { $_setSignedInt32(0, v); }
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


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
