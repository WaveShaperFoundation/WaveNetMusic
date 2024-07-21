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
  static final _$logins = $grpc.ClientMethod<$0.LoginRequest, $0.GetArtistsResponse>(
      '/wavenet.Authentication/Logins',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetArtistsResponse.fromBuffer(value));

  AuthenticationClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.LoginResponse> login($0.LoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetArtistsResponse> logins($0.LoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$logins, request, options: options);
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
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.GetArtistsResponse>(
        'Logins',
        logins_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.GetArtistsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.LoginResponse> login_Pre($grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.GetArtistsResponse> logins_Pre($grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return logins(call, await request);
  }

  $async.Future<$0.LoginResponse> login($grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$0.GetArtistsResponse> logins($grpc.ServiceCall call, $0.LoginRequest request);
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
