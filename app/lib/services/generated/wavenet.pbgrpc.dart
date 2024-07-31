//
//  Generated code. Do not modify.
//  source: wavenet.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'wavenet.pb.dart' as $0;

export 'wavenet.pb.dart';

@$pb.GrpcServiceName('wavenet.Authentication')
class AuthenticationClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginResponse>(
      '/wavenet.Authentication/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginResponse.fromBuffer(value));
  static final _$register = $grpc.ClientMethod<$0.RegisterRequest, $0.RegisterResponse>(
      '/wavenet.Authentication/Register',
      ($0.RegisterRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RegisterResponse.fromBuffer(value));

  AuthenticationClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.LoginResponse> login($0.LoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$0.RegisterResponse> register($0.RegisterRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$register, request, options: options);
  }
}

@$pb.GrpcServiceName('wavenet.Authentication')
abstract class AuthenticationServiceBase extends $grpc.Service {
  $core.String get $name => 'wavenet.Authentication';

  AuthenticationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RegisterRequest, $0.RegisterResponse>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterRequest.fromBuffer(value),
        ($0.RegisterResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.LoginResponse> login_Pre($grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.RegisterResponse> register_Pre($grpc.ServiceCall call, $async.Future<$0.RegisterRequest> request) async {
    return register(call, await request);
  }

  $async.Future<$0.LoginResponse> login($grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$0.RegisterResponse> register($grpc.ServiceCall call, $0.RegisterRequest request);
}
@$pb.GrpcServiceName('wavenet.Library')
class LibraryClient extends $grpc.Client {
  static final _$getAlbums = $grpc.ClientMethod<$0.Empty, $0.GetAlbumsResponse>(
      '/wavenet.Library/GetAlbums',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetAlbumsResponse.fromBuffer(value));
  static final _$getAlbum = $grpc.ClientMethod<$0.GetAlbumRequest, $0.AlbumDetails>(
      '/wavenet.Library/GetAlbum',
      ($0.GetAlbumRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AlbumDetails.fromBuffer(value));
  static final _$getTracks = $grpc.ClientMethod<$0.Empty, $0.GetTracksResponse>(
      '/wavenet.Library/GetTracks',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetTracksResponse.fromBuffer(value));
  static final _$getAlbumTracks = $grpc.ClientMethod<$0.GetAlbumRequest, $0.GetTracksResponse>(
      '/wavenet.Library/GetAlbumTracks',
      ($0.GetAlbumRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetTracksResponse.fromBuffer(value));
  static final _$getTrack = $grpc.ClientMethod<$0.GetTrackRequest, $0.Track>(
      '/wavenet.Library/GetTrack',
      ($0.GetTrackRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Track.fromBuffer(value));
  static final _$getArtists = $grpc.ClientMethod<$0.Empty, $0.GetArtistsResponse>(
      '/wavenet.Library/GetArtists',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetArtistsResponse.fromBuffer(value));
  static final _$getArtist = $grpc.ClientMethod<$0.GetArtistRequest, $0.ArtistWithAlbums>(
      '/wavenet.Library/GetArtist',
      ($0.GetArtistRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ArtistWithAlbums.fromBuffer(value));
  static final _$indexLibrary = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/wavenet.Library/IndexLibrary',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$searchQuery = $grpc.ClientMethod<$0.SearchQueryRequest, $0.SearchQueryResponse>(
      '/wavenet.Library/SearchQuery',
      ($0.SearchQueryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SearchQueryResponse.fromBuffer(value));

  LibraryClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetAlbumsResponse> getAlbums($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAlbums, request, options: options);
  }

  $grpc.ResponseFuture<$0.AlbumDetails> getAlbum($0.GetAlbumRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAlbum, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetTracksResponse> getTracks($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTracks, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetTracksResponse> getAlbumTracks($0.GetAlbumRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAlbumTracks, request, options: options);
  }

  $grpc.ResponseFuture<$0.Track> getTrack($0.GetTrackRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTrack, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetArtistsResponse> getArtists($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getArtists, request, options: options);
  }

  $grpc.ResponseFuture<$0.ArtistWithAlbums> getArtist($0.GetArtistRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getArtist, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> indexLibrary($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$indexLibrary, request, options: options);
  }

  $grpc.ResponseFuture<$0.SearchQueryResponse> searchQuery($0.SearchQueryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$searchQuery, request, options: options);
  }
}

@$pb.GrpcServiceName('wavenet.Library')
abstract class LibraryServiceBase extends $grpc.Service {
  $core.String get $name => 'wavenet.Library';

  LibraryServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.GetAlbumsResponse>(
        'GetAlbums',
        getAlbums_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.GetAlbumsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetAlbumRequest, $0.AlbumDetails>(
        'GetAlbum',
        getAlbum_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetAlbumRequest.fromBuffer(value),
        ($0.AlbumDetails value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.GetTracksResponse>(
        'GetTracks',
        getTracks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.GetTracksResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetAlbumRequest, $0.GetTracksResponse>(
        'GetAlbumTracks',
        getAlbumTracks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetAlbumRequest.fromBuffer(value),
        ($0.GetTracksResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTrackRequest, $0.Track>(
        'GetTrack',
        getTrack_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetTrackRequest.fromBuffer(value),
        ($0.Track value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.GetArtistsResponse>(
        'GetArtists',
        getArtists_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.GetArtistsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetArtistRequest, $0.ArtistWithAlbums>(
        'GetArtist',
        getArtist_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetArtistRequest.fromBuffer(value),
        ($0.ArtistWithAlbums value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>(
        'IndexLibrary',
        indexLibrary_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SearchQueryRequest, $0.SearchQueryResponse>(
        'SearchQuery',
        searchQuery_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SearchQueryRequest.fromBuffer(value),
        ($0.SearchQueryResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetAlbumsResponse> getAlbums_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getAlbums(call, await request);
  }

  $async.Future<$0.AlbumDetails> getAlbum_Pre($grpc.ServiceCall call, $async.Future<$0.GetAlbumRequest> request) async {
    return getAlbum(call, await request);
  }

  $async.Future<$0.GetTracksResponse> getTracks_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getTracks(call, await request);
  }

  $async.Future<$0.GetTracksResponse> getAlbumTracks_Pre($grpc.ServiceCall call, $async.Future<$0.GetAlbumRequest> request) async {
    return getAlbumTracks(call, await request);
  }

  $async.Future<$0.Track> getTrack_Pre($grpc.ServiceCall call, $async.Future<$0.GetTrackRequest> request) async {
    return getTrack(call, await request);
  }

  $async.Future<$0.GetArtistsResponse> getArtists_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getArtists(call, await request);
  }

  $async.Future<$0.ArtistWithAlbums> getArtist_Pre($grpc.ServiceCall call, $async.Future<$0.GetArtistRequest> request) async {
    return getArtist(call, await request);
  }

  $async.Future<$0.Empty> indexLibrary_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return indexLibrary(call, await request);
  }

  $async.Future<$0.SearchQueryResponse> searchQuery_Pre($grpc.ServiceCall call, $async.Future<$0.SearchQueryRequest> request) async {
    return searchQuery(call, await request);
  }

  $async.Future<$0.GetAlbumsResponse> getAlbums($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.AlbumDetails> getAlbum($grpc.ServiceCall call, $0.GetAlbumRequest request);
  $async.Future<$0.GetTracksResponse> getTracks($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.GetTracksResponse> getAlbumTracks($grpc.ServiceCall call, $0.GetAlbumRequest request);
  $async.Future<$0.Track> getTrack($grpc.ServiceCall call, $0.GetTrackRequest request);
  $async.Future<$0.GetArtistsResponse> getArtists($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.ArtistWithAlbums> getArtist($grpc.ServiceCall call, $0.GetArtistRequest request);
  $async.Future<$0.Empty> indexLibrary($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.SearchQueryResponse> searchQuery($grpc.ServiceCall call, $0.SearchQueryRequest request);
}
@$pb.GrpcServiceName('wavenet.Playlist')
class PlaylistClient extends $grpc.Client {
  static final _$getMyPlaylists = $grpc.ClientMethod<$0.Empty, $0.GetPlaylistsResponse>(
      '/wavenet.Playlist/GetMyPlaylists',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetPlaylistsResponse.fromBuffer(value));
  static final _$getPlaylist = $grpc.ClientMethod<$0.GetPlaylistRequest, $0.PlaylistDetails>(
      '/wavenet.Playlist/GetPlaylist',
      ($0.GetPlaylistRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PlaylistDetails.fromBuffer(value));
  static final _$createPlaylist = $grpc.ClientMethod<$0.CreatePlaylistRequest, $0.CreatePlaylistResponse>(
      '/wavenet.Playlist/CreatePlaylist',
      ($0.CreatePlaylistRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreatePlaylistResponse.fromBuffer(value));
  static final _$deletePlaylist = $grpc.ClientMethod<$0.DeletePlaylistRequest, $0.DeletePlaylistResponse>(
      '/wavenet.Playlist/DeletePlaylist',
      ($0.DeletePlaylistRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeletePlaylistResponse.fromBuffer(value));
  static final _$changePlaylist = $grpc.ClientMethod<$0.ChangePlaylistRequest, $0.ChangePlaylistResponse>(
      '/wavenet.Playlist/ChangePlaylist',
      ($0.ChangePlaylistRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChangePlaylistResponse.fromBuffer(value));
  static final _$addTrackToPlaylist = $grpc.ClientMethod<$0.AddTrackToPlaylistRequest, $0.AddTrackToPlaylistResponse>(
      '/wavenet.Playlist/AddTrackToPlaylist',
      ($0.AddTrackToPlaylistRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AddTrackToPlaylistResponse.fromBuffer(value));
  static final _$moveTrackInPlaylist = $grpc.ClientMethod<$0.MoveTrackInPlaylistRequest, $0.MoveTrackInPlaylistResponse>(
      '/wavenet.Playlist/MoveTrackInPlaylist',
      ($0.MoveTrackInPlaylistRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.MoveTrackInPlaylistResponse.fromBuffer(value));
  static final _$removeTrackFromPlaylist = $grpc.ClientMethod<$0.RemoveTrackFromPlaylistRequest, $0.RemoveTrackFromPlaylistResponse>(
      '/wavenet.Playlist/RemoveTrackFromPlaylist',
      ($0.RemoveTrackFromPlaylistRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RemoveTrackFromPlaylistResponse.fromBuffer(value));

  PlaylistClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetPlaylistsResponse> getMyPlaylists($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMyPlaylists, request, options: options);
  }

  $grpc.ResponseFuture<$0.PlaylistDetails> getPlaylist($0.GetPlaylistRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPlaylist, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreatePlaylistResponse> createPlaylist($0.CreatePlaylistRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPlaylist, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeletePlaylistResponse> deletePlaylist($0.DeletePlaylistRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deletePlaylist, request, options: options);
  }

  $grpc.ResponseFuture<$0.ChangePlaylistResponse> changePlaylist($0.ChangePlaylistRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$changePlaylist, request, options: options);
  }

  $grpc.ResponseFuture<$0.AddTrackToPlaylistResponse> addTrackToPlaylist($0.AddTrackToPlaylistRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addTrackToPlaylist, request, options: options);
  }

  $grpc.ResponseFuture<$0.MoveTrackInPlaylistResponse> moveTrackInPlaylist($0.MoveTrackInPlaylistRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$moveTrackInPlaylist, request, options: options);
  }

  $grpc.ResponseFuture<$0.RemoveTrackFromPlaylistResponse> removeTrackFromPlaylist($0.RemoveTrackFromPlaylistRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeTrackFromPlaylist, request, options: options);
  }
}

@$pb.GrpcServiceName('wavenet.Playlist')
abstract class PlaylistServiceBase extends $grpc.Service {
  $core.String get $name => 'wavenet.Playlist';

  PlaylistServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.GetPlaylistsResponse>(
        'GetMyPlaylists',
        getMyPlaylists_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.GetPlaylistsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPlaylistRequest, $0.PlaylistDetails>(
        'GetPlaylist',
        getPlaylist_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetPlaylistRequest.fromBuffer(value),
        ($0.PlaylistDetails value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreatePlaylistRequest, $0.CreatePlaylistResponse>(
        'CreatePlaylist',
        createPlaylist_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreatePlaylistRequest.fromBuffer(value),
        ($0.CreatePlaylistResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeletePlaylistRequest, $0.DeletePlaylistResponse>(
        'DeletePlaylist',
        deletePlaylist_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeletePlaylistRequest.fromBuffer(value),
        ($0.DeletePlaylistResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChangePlaylistRequest, $0.ChangePlaylistResponse>(
        'ChangePlaylist',
        changePlaylist_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChangePlaylistRequest.fromBuffer(value),
        ($0.ChangePlaylistResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddTrackToPlaylistRequest, $0.AddTrackToPlaylistResponse>(
        'AddTrackToPlaylist',
        addTrackToPlaylist_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddTrackToPlaylistRequest.fromBuffer(value),
        ($0.AddTrackToPlaylistResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MoveTrackInPlaylistRequest, $0.MoveTrackInPlaylistResponse>(
        'MoveTrackInPlaylist',
        moveTrackInPlaylist_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MoveTrackInPlaylistRequest.fromBuffer(value),
        ($0.MoveTrackInPlaylistResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveTrackFromPlaylistRequest, $0.RemoveTrackFromPlaylistResponse>(
        'RemoveTrackFromPlaylist',
        removeTrackFromPlaylist_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RemoveTrackFromPlaylistRequest.fromBuffer(value),
        ($0.RemoveTrackFromPlaylistResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetPlaylistsResponse> getMyPlaylists_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getMyPlaylists(call, await request);
  }

  $async.Future<$0.PlaylistDetails> getPlaylist_Pre($grpc.ServiceCall call, $async.Future<$0.GetPlaylistRequest> request) async {
    return getPlaylist(call, await request);
  }

  $async.Future<$0.CreatePlaylistResponse> createPlaylist_Pre($grpc.ServiceCall call, $async.Future<$0.CreatePlaylistRequest> request) async {
    return createPlaylist(call, await request);
  }

  $async.Future<$0.DeletePlaylistResponse> deletePlaylist_Pre($grpc.ServiceCall call, $async.Future<$0.DeletePlaylistRequest> request) async {
    return deletePlaylist(call, await request);
  }

  $async.Future<$0.ChangePlaylistResponse> changePlaylist_Pre($grpc.ServiceCall call, $async.Future<$0.ChangePlaylistRequest> request) async {
    return changePlaylist(call, await request);
  }

  $async.Future<$0.AddTrackToPlaylistResponse> addTrackToPlaylist_Pre($grpc.ServiceCall call, $async.Future<$0.AddTrackToPlaylistRequest> request) async {
    return addTrackToPlaylist(call, await request);
  }

  $async.Future<$0.MoveTrackInPlaylistResponse> moveTrackInPlaylist_Pre($grpc.ServiceCall call, $async.Future<$0.MoveTrackInPlaylistRequest> request) async {
    return moveTrackInPlaylist(call, await request);
  }

  $async.Future<$0.RemoveTrackFromPlaylistResponse> removeTrackFromPlaylist_Pre($grpc.ServiceCall call, $async.Future<$0.RemoveTrackFromPlaylistRequest> request) async {
    return removeTrackFromPlaylist(call, await request);
  }

  $async.Future<$0.GetPlaylistsResponse> getMyPlaylists($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.PlaylistDetails> getPlaylist($grpc.ServiceCall call, $0.GetPlaylistRequest request);
  $async.Future<$0.CreatePlaylistResponse> createPlaylist($grpc.ServiceCall call, $0.CreatePlaylistRequest request);
  $async.Future<$0.DeletePlaylistResponse> deletePlaylist($grpc.ServiceCall call, $0.DeletePlaylistRequest request);
  $async.Future<$0.ChangePlaylistResponse> changePlaylist($grpc.ServiceCall call, $0.ChangePlaylistRequest request);
  $async.Future<$0.AddTrackToPlaylistResponse> addTrackToPlaylist($grpc.ServiceCall call, $0.AddTrackToPlaylistRequest request);
  $async.Future<$0.MoveTrackInPlaylistResponse> moveTrackInPlaylist($grpc.ServiceCall call, $0.MoveTrackInPlaylistRequest request);
  $async.Future<$0.RemoveTrackFromPlaylistResponse> removeTrackFromPlaylist($grpc.ServiceCall call, $0.RemoveTrackFromPlaylistRequest request);
}
@$pb.GrpcServiceName('wavenet.LikedTracks')
class LikedTracksClient extends $grpc.Client {
  static final _$getLikedSongs = $grpc.ClientMethod<$0.Empty, $0.GetTracksResponse>(
      '/wavenet.LikedTracks/GetLikedSongs',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetTracksResponse.fromBuffer(value));
  static final _$likeTrack = $grpc.ClientMethod<$0.AddTrackToLikedRequest, $0.AddTrackToLikedResponse>(
      '/wavenet.LikedTracks/LikeTrack',
      ($0.AddTrackToLikedRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AddTrackToLikedResponse.fromBuffer(value));
  static final _$unlikeTrack = $grpc.ClientMethod<$0.RemoveTrackFromLikedRequest, $0.RemoveTrackFromLikedResponse>(
      '/wavenet.LikedTracks/UnlikeTrack',
      ($0.RemoveTrackFromLikedRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RemoveTrackFromLikedResponse.fromBuffer(value));

  LikedTracksClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetTracksResponse> getLikedSongs($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLikedSongs, request, options: options);
  }

  $grpc.ResponseFuture<$0.AddTrackToLikedResponse> likeTrack($0.AddTrackToLikedRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$likeTrack, request, options: options);
  }

  $grpc.ResponseFuture<$0.RemoveTrackFromLikedResponse> unlikeTrack($0.RemoveTrackFromLikedRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unlikeTrack, request, options: options);
  }
}

@$pb.GrpcServiceName('wavenet.LikedTracks')
abstract class LikedTracksServiceBase extends $grpc.Service {
  $core.String get $name => 'wavenet.LikedTracks';

  LikedTracksServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.GetTracksResponse>(
        'GetLikedSongs',
        getLikedSongs_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.GetTracksResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddTrackToLikedRequest, $0.AddTrackToLikedResponse>(
        'LikeTrack',
        likeTrack_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddTrackToLikedRequest.fromBuffer(value),
        ($0.AddTrackToLikedResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveTrackFromLikedRequest, $0.RemoveTrackFromLikedResponse>(
        'UnlikeTrack',
        unlikeTrack_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RemoveTrackFromLikedRequest.fromBuffer(value),
        ($0.RemoveTrackFromLikedResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetTracksResponse> getLikedSongs_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getLikedSongs(call, await request);
  }

  $async.Future<$0.AddTrackToLikedResponse> likeTrack_Pre($grpc.ServiceCall call, $async.Future<$0.AddTrackToLikedRequest> request) async {
    return likeTrack(call, await request);
  }

  $async.Future<$0.RemoveTrackFromLikedResponse> unlikeTrack_Pre($grpc.ServiceCall call, $async.Future<$0.RemoveTrackFromLikedRequest> request) async {
    return unlikeTrack(call, await request);
  }

  $async.Future<$0.GetTracksResponse> getLikedSongs($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.AddTrackToLikedResponse> likeTrack($grpc.ServiceCall call, $0.AddTrackToLikedRequest request);
  $async.Future<$0.RemoveTrackFromLikedResponse> unlikeTrack($grpc.ServiceCall call, $0.RemoveTrackFromLikedRequest request);
}
