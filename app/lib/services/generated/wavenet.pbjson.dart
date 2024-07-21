//
//  Generated code. Do not modify.
//  source: wavenet.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use searchQueryRequestDescriptor instead')
const SearchQueryRequest$json = {
  '1': 'SearchQueryRequest',
  '2': [
    {'1': 'query', '3': 1, '4': 1, '5': 9, '10': 'query'},
  ],
};

/// Descriptor for `SearchQueryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchQueryRequestDescriptor = $convert.base64Decode(
    'ChJTZWFyY2hRdWVyeVJlcXVlc3QSFAoFcXVlcnkYASABKAlSBXF1ZXJ5');

@$core.Deprecated('Use searchQueryResponseDescriptor instead')
const SearchQueryResponse$json = {
  '1': 'SearchQueryResponse',
  '2': [
    {'1': 'tracks', '3': 2, '4': 3, '5': 11, '6': '.wavenet.Track', '10': 'tracks'},
  ],
};

/// Descriptor for `SearchQueryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchQueryResponseDescriptor = $convert.base64Decode(
    'ChNTZWFyY2hRdWVyeVJlc3BvbnNlEiYKBnRyYWNrcxgCIAMoCzIOLndhdmVuZXQuVHJhY2tSBn'
    'RyYWNrcw==');

@$core.Deprecated('Use getAlbumsResponseDescriptor instead')
const GetAlbumsResponse$json = {
  '1': 'GetAlbumsResponse',
  '2': [
    {'1': 'albums', '3': 1, '4': 3, '5': 11, '6': '.wavenet.Album', '10': 'albums'},
  ],
};

/// Descriptor for `GetAlbumsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAlbumsResponseDescriptor = $convert.base64Decode(
    'ChFHZXRBbGJ1bXNSZXNwb25zZRImCgZhbGJ1bXMYASADKAsyDi53YXZlbmV0LkFsYnVtUgZhbG'
    'J1bXM=');

@$core.Deprecated('Use getAlbumRequestDescriptor instead')
const GetAlbumRequest$json = {
  '1': 'GetAlbumRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `GetAlbumRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAlbumRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRBbGJ1bVJlcXVlc3QSDgoCaWQYASABKAVSAmlk');

@$core.Deprecated('Use getTrackRequestDescriptor instead')
const GetTrackRequest$json = {
  '1': 'GetTrackRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `GetTrackRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTrackRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRUcmFja1JlcXVlc3QSDgoCaWQYASABKAVSAmlk');

@$core.Deprecated('Use getArtistRequestDescriptor instead')
const GetArtistRequest$json = {
  '1': 'GetArtistRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `GetArtistRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getArtistRequestDescriptor = $convert.base64Decode(
    'ChBHZXRBcnRpc3RSZXF1ZXN0Eg4KAmlkGAEgASgFUgJpZA==');

@$core.Deprecated('Use getArtistsResponseDescriptor instead')
const GetArtistsResponse$json = {
  '1': 'GetArtistsResponse',
  '2': [
    {'1': 'artists', '3': 1, '4': 3, '5': 11, '6': '.wavenet.Artist', '10': 'artists'},
  ],
};

/// Descriptor for `GetArtistsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getArtistsResponseDescriptor = $convert.base64Decode(
    'ChJHZXRBcnRpc3RzUmVzcG9uc2USKQoHYXJ0aXN0cxgBIAMoCzIPLndhdmVuZXQuQXJ0aXN0Ug'
    'dhcnRpc3Rz');

@$core.Deprecated('Use getTracksResponseDescriptor instead')
const GetTracksResponse$json = {
  '1': 'GetTracksResponse',
  '2': [
    {'1': 'tracks', '3': 1, '4': 3, '5': 11, '6': '.wavenet.Track', '10': 'tracks'},
  ],
};

/// Descriptor for `GetTracksResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTracksResponseDescriptor = $convert.base64Decode(
    'ChFHZXRUcmFja3NSZXNwb25zZRImCgZ0cmFja3MYASADKAsyDi53YXZlbmV0LlRyYWNrUgZ0cm'
    'Fja3M=');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

@$core.Deprecated('Use artistDescriptor instead')
const Artist$json = {
  '1': 'Artist',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Artist`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List artistDescriptor = $convert.base64Decode(
    'CgZBcnRpc3QSDgoCaWQYASABKAVSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWU=');

@$core.Deprecated('Use artistWithAlbumsDescriptor instead')
const ArtistWithAlbums$json = {
  '1': 'ArtistWithAlbums',
  '2': [
    {'1': 'artist', '3': 1, '4': 1, '5': 11, '6': '.wavenet.Artist', '10': 'artist'},
    {'1': 'albums', '3': 2, '4': 3, '5': 11, '6': '.wavenet.Album', '10': 'albums'},
  ],
};

/// Descriptor for `ArtistWithAlbums`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List artistWithAlbumsDescriptor = $convert.base64Decode(
    'ChBBcnRpc3RXaXRoQWxidW1zEicKBmFydGlzdBgBIAEoCzIPLndhdmVuZXQuQXJ0aXN0UgZhcn'
    'Rpc3QSJgoGYWxidW1zGAIgAygLMg4ud2F2ZW5ldC5BbGJ1bVIGYWxidW1z');

@$core.Deprecated('Use albumDescriptor instead')
const Album$json = {
  '1': 'Album',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'artists', '3': 3, '4': 3, '5': 11, '6': '.wavenet.Artist', '10': 'artists'},
    {'1': 'year', '3': 4, '4': 1, '5': 5, '10': 'year'},
    {'1': 'blurhash', '3': 5, '4': 1, '5': 9, '10': 'blurhash'},
  ],
};

/// Descriptor for `Album`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List albumDescriptor = $convert.base64Decode(
    'CgVBbGJ1bRIOCgJpZBgBIAEoBVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIpCgdhcnRpc3RzGA'
    'MgAygLMg8ud2F2ZW5ldC5BcnRpc3RSB2FydGlzdHMSEgoEeWVhchgEIAEoBVIEeWVhchIaCghi'
    'bHVyaGFzaBgFIAEoCVIIYmx1cmhhc2g=');

@$core.Deprecated('Use albumDetailsDescriptor instead')
const AlbumDetails$json = {
  '1': 'AlbumDetails',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'artists', '3': 3, '4': 3, '5': 11, '6': '.wavenet.Artist', '10': 'artists'},
    {'1': 'year', '3': 4, '4': 1, '5': 5, '10': 'year'},
    {'1': 'blurhash', '3': 5, '4': 1, '5': 9, '10': 'blurhash'},
    {'1': 'tracks', '3': 6, '4': 3, '5': 11, '6': '.wavenet.Track', '10': 'tracks'},
  ],
};

/// Descriptor for `AlbumDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List albumDetailsDescriptor = $convert.base64Decode(
    'CgxBbGJ1bURldGFpbHMSDgoCaWQYASABKAVSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSKQoHYX'
    'J0aXN0cxgDIAMoCzIPLndhdmVuZXQuQXJ0aXN0UgdhcnRpc3RzEhIKBHllYXIYBCABKAVSBHll'
    'YXISGgoIYmx1cmhhc2gYBSABKAlSCGJsdXJoYXNoEiYKBnRyYWNrcxgGIAMoCzIOLndhdmVuZX'
    'QuVHJhY2tSBnRyYWNrcw==');

@$core.Deprecated('Use trackDescriptor instead')
const Track$json = {
  '1': 'Track',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'album', '3': 3, '4': 1, '5': 11, '6': '.wavenet.Album', '10': 'album'},
    {'1': 'artists', '3': 4, '4': 3, '5': 11, '6': '.wavenet.Artist', '10': 'artists'},
    {'1': 'year', '3': 5, '4': 1, '5': 5, '10': 'year'},
    {'1': 'length', '3': 6, '4': 1, '5': 5, '10': 'length'},
  ],
};

/// Descriptor for `Track`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trackDescriptor = $convert.base64Decode(
    'CgVUcmFjaxIOCgJpZBgBIAEoBVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIkCgVhbGJ1bRgDIA'
    'EoCzIOLndhdmVuZXQuQWxidW1SBWFsYnVtEikKB2FydGlzdHMYBCADKAsyDy53YXZlbmV0LkFy'
    'dGlzdFIHYXJ0aXN0cxISCgR5ZWFyGAUgASgFUgR5ZWFyEhYKBmxlbmd0aBgGIAEoBVIGbGVuZ3'
    'Ro');

@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = {
  '1': 'LoginRequest',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 5, '10': 'username'},
    {'1': 'password', '3': 2, '4': 1, '5': 5, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QSGgoIdXNlcm5hbWUYASABKAVSCHVzZXJuYW1lEhoKCHBhc3N3b3JkGA'
    'IgASgFUghwYXNzd29yZA==');

@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse$json = {
  '1': 'LoginResponse',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 5, '10': 'token'},
    {'1': 'status', '3': 2, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode(
    'Cg1Mb2dpblJlc3BvbnNlEhQKBXRva2VuGAEgASgFUgV0b2tlbhIWCgZzdGF0dXMYAiABKAVSBn'
    'N0YXR1cw==');

