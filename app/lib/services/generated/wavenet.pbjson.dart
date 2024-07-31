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
    {'1': 'tracks', '3': 6, '4': 3, '5': 11, '6': '.wavenet.AlbumTrack', '10': 'tracks'},
  ],
};

/// Descriptor for `AlbumDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List albumDetailsDescriptor = $convert.base64Decode(
    'CgxBbGJ1bURldGFpbHMSDgoCaWQYASABKAVSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSKQoHYX'
    'J0aXN0cxgDIAMoCzIPLndhdmVuZXQuQXJ0aXN0UgdhcnRpc3RzEhIKBHllYXIYBCABKAVSBHll'
    'YXISGgoIYmx1cmhhc2gYBSABKAlSCGJsdXJoYXNoEisKBnRyYWNrcxgGIAMoCzITLndhdmVuZX'
    'QuQWxidW1UcmFja1IGdHJhY2tz');

@$core.Deprecated('Use albumTrackDescriptor instead')
const AlbumTrack$json = {
  '1': 'AlbumTrack',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'artists', '3': 3, '4': 3, '5': 11, '6': '.wavenet.Artist', '10': 'artists'},
    {'1': 'year', '3': 4, '4': 1, '5': 5, '10': 'year'},
    {'1': 'length', '3': 5, '4': 1, '5': 5, '10': 'length'},
  ],
};

/// Descriptor for `AlbumTrack`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List albumTrackDescriptor = $convert.base64Decode(
    'CgpBbGJ1bVRyYWNrEg4KAmlkGAEgASgFUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEikKB2FydG'
    'lzdHMYAyADKAsyDy53YXZlbmV0LkFydGlzdFIHYXJ0aXN0cxISCgR5ZWFyGAQgASgFUgR5ZWFy'
    'EhYKBmxlbmd0aBgFIAEoBVIGbGVuZ3Ro');

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
    {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QSGgoIdXNlcm5hbWUYASABKAlSCHVzZXJuYW1lEhoKCHBhc3N3b3JkGA'
    'IgASgJUghwYXNzd29yZA==');

@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse$json = {
  '1': 'LoginResponse',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'token', '17': true},
    {'1': 'status', '3': 2, '4': 1, '5': 5, '10': 'status'},
  ],
  '8': [
    {'1': '_token'},
  ],
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode(
    'Cg1Mb2dpblJlc3BvbnNlEhkKBXRva2VuGAEgASgJSABSBXRva2VuiAEBEhYKBnN0YXR1cxgCIA'
    'EoBVIGc3RhdHVzQggKBl90b2tlbg==');

@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = {
  '1': 'RegisterRequest',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    {'1': 'publicName', '3': 4, '4': 1, '5': 9, '10': 'publicName'},
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode(
    'Cg9SZWdpc3RlclJlcXVlc3QSGgoIdXNlcm5hbWUYASABKAlSCHVzZXJuYW1lEhoKCHBhc3N3b3'
    'JkGAIgASgJUghwYXNzd29yZBIUCgVlbWFpbBgDIAEoCVIFZW1haWwSHgoKcHVibGljTmFtZRgE'
    'IAEoCVIKcHVibGljTmFtZQ==');

@$core.Deprecated('Use registerResponseDescriptor instead')
const RegisterResponse$json = {
  '1': 'RegisterResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    {'1': 'token', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'token', '17': true},
  ],
  '8': [
    {'1': '_token'},
  ],
};

/// Descriptor for `RegisterResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerResponseDescriptor = $convert.base64Decode(
    'ChBSZWdpc3RlclJlc3BvbnNlEhYKBnN0YXR1cxgBIAEoBVIGc3RhdHVzEhkKBXRva2VuGAIgAS'
    'gJSABSBXRva2VuiAEBQggKBl90b2tlbg==');

@$core.Deprecated('Use addTrackToLikedRequestDescriptor instead')
const AddTrackToLikedRequest$json = {
  '1': 'AddTrackToLikedRequest',
  '2': [
    {'1': 'trackId', '3': 1, '4': 1, '5': 5, '10': 'trackId'},
  ],
};

/// Descriptor for `AddTrackToLikedRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addTrackToLikedRequestDescriptor = $convert.base64Decode(
    'ChZBZGRUcmFja1RvTGlrZWRSZXF1ZXN0EhgKB3RyYWNrSWQYASABKAVSB3RyYWNrSWQ=');

@$core.Deprecated('Use addTrackToLikedResponseDescriptor instead')
const AddTrackToLikedResponse$json = {
  '1': 'AddTrackToLikedResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 11, '6': '.wavenet.ActionResponse', '10': 'status'},
    {'1': 'likedId', '3': 2, '4': 1, '5': 5, '10': 'likedId'},
  ],
};

/// Descriptor for `AddTrackToLikedResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addTrackToLikedResponseDescriptor = $convert.base64Decode(
    'ChdBZGRUcmFja1RvTGlrZWRSZXNwb25zZRIvCgZzdGF0dXMYASABKAsyFy53YXZlbmV0LkFjdG'
    'lvblJlc3BvbnNlUgZzdGF0dXMSGAoHbGlrZWRJZBgCIAEoBVIHbGlrZWRJZA==');

@$core.Deprecated('Use removeTrackFromLikedRequestDescriptor instead')
const RemoveTrackFromLikedRequest$json = {
  '1': 'RemoveTrackFromLikedRequest',
  '2': [
    {'1': 'likedId', '3': 1, '4': 1, '5': 5, '10': 'likedId'},
  ],
};

/// Descriptor for `RemoveTrackFromLikedRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeTrackFromLikedRequestDescriptor = $convert.base64Decode(
    'ChtSZW1vdmVUcmFja0Zyb21MaWtlZFJlcXVlc3QSGAoHbGlrZWRJZBgBIAEoBVIHbGlrZWRJZA'
    '==');

@$core.Deprecated('Use removeTrackFromLikedResponseDescriptor instead')
const RemoveTrackFromLikedResponse$json = {
  '1': 'RemoveTrackFromLikedResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 11, '6': '.wavenet.ActionResponse', '10': 'status'},
  ],
};

/// Descriptor for `RemoveTrackFromLikedResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeTrackFromLikedResponseDescriptor = $convert.base64Decode(
    'ChxSZW1vdmVUcmFja0Zyb21MaWtlZFJlc3BvbnNlEi8KBnN0YXR1cxgBIAEoCzIXLndhdmVuZX'
    'QuQWN0aW9uUmVzcG9uc2VSBnN0YXR1cw==');

@$core.Deprecated('Use actionResponseDescriptor instead')
const ActionResponse$json = {
  '1': 'ActionResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.wavenet.ActionResponse.Status', '10': 'status'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'message', '17': true},
  ],
  '4': [ActionResponse_Status$json],
  '8': [
    {'1': '_message'},
  ],
};

@$core.Deprecated('Use actionResponseDescriptor instead')
const ActionResponse_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'OK', '2': 0},
    {'1': 'ERROR', '2': 1},
  ],
};

/// Descriptor for `ActionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List actionResponseDescriptor = $convert.base64Decode(
    'Cg5BY3Rpb25SZXNwb25zZRI2CgZzdGF0dXMYASABKA4yHi53YXZlbmV0LkFjdGlvblJlc3Bvbn'
    'NlLlN0YXR1c1IGc3RhdHVzEh0KB21lc3NhZ2UYAiABKAlIAFIHbWVzc2FnZYgBASIbCgZTdGF0'
    'dXMSBgoCT0sQABIJCgVFUlJPUhABQgoKCF9tZXNzYWdl');

@$core.Deprecated('Use getPlaylistRequestDescriptor instead')
const GetPlaylistRequest$json = {
  '1': 'GetPlaylistRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `GetPlaylistRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPlaylistRequestDescriptor = $convert.base64Decode(
    'ChJHZXRQbGF5bGlzdFJlcXVlc3QSDgoCaWQYASABKAVSAmlk');

@$core.Deprecated('Use getPlaylistsResponseDescriptor instead')
const GetPlaylistsResponse$json = {
  '1': 'GetPlaylistsResponse',
  '2': [
    {'1': 'playlists', '3': 1, '4': 3, '5': 11, '6': '.wavenet.PlaylistResponse', '10': 'playlists'},
  ],
};

/// Descriptor for `GetPlaylistsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPlaylistsResponseDescriptor = $convert.base64Decode(
    'ChRHZXRQbGF5bGlzdHNSZXNwb25zZRI3CglwbGF5bGlzdHMYASADKAsyGS53YXZlbmV0LlBsYX'
    'lsaXN0UmVzcG9uc2VSCXBsYXlsaXN0cw==');

@$core.Deprecated('Use createPlaylistRequestDescriptor instead')
const CreatePlaylistRequest$json = {
  '1': 'CreatePlaylistRequest',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `CreatePlaylistRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPlaylistRequestDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVQbGF5bGlzdFJlcXVlc3QSFAoFdGl0bGUYASABKAlSBXRpdGxlEiAKC2Rlc2NyaX'
    'B0aW9uGAIgASgJUgtkZXNjcmlwdGlvbg==');

@$core.Deprecated('Use changePlaylistResponseDescriptor instead')
const ChangePlaylistResponse$json = {
  '1': 'ChangePlaylistResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 11, '6': '.wavenet.ActionResponse', '10': 'status'},
  ],
};

/// Descriptor for `ChangePlaylistResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePlaylistResponseDescriptor = $convert.base64Decode(
    'ChZDaGFuZ2VQbGF5bGlzdFJlc3BvbnNlEi8KBnN0YXR1cxgBIAEoCzIXLndhdmVuZXQuQWN0aW'
    '9uUmVzcG9uc2VSBnN0YXR1cw==');

@$core.Deprecated('Use addTrackToPlaylistRequestDescriptor instead')
const AddTrackToPlaylistRequest$json = {
  '1': 'AddTrackToPlaylistRequest',
  '2': [
    {'1': 'playlistId', '3': 1, '4': 1, '5': 5, '10': 'playlistId'},
    {'1': 'trackId', '3': 2, '4': 1, '5': 5, '10': 'trackId'},
  ],
};

/// Descriptor for `AddTrackToPlaylistRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addTrackToPlaylistRequestDescriptor = $convert.base64Decode(
    'ChlBZGRUcmFja1RvUGxheWxpc3RSZXF1ZXN0Eh4KCnBsYXlsaXN0SWQYASABKAVSCnBsYXlsaX'
    'N0SWQSGAoHdHJhY2tJZBgCIAEoBVIHdHJhY2tJZA==');

@$core.Deprecated('Use addTrackToPlaylistResponseDescriptor instead')
const AddTrackToPlaylistResponse$json = {
  '1': 'AddTrackToPlaylistResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 11, '6': '.wavenet.ActionResponse', '10': 'status'},
    {'1': 'addedTrackId', '3': 2, '4': 1, '5': 5, '10': 'addedTrackId'},
  ],
};

/// Descriptor for `AddTrackToPlaylistResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addTrackToPlaylistResponseDescriptor = $convert.base64Decode(
    'ChpBZGRUcmFja1RvUGxheWxpc3RSZXNwb25zZRIvCgZzdGF0dXMYASABKAsyFy53YXZlbmV0Lk'
    'FjdGlvblJlc3BvbnNlUgZzdGF0dXMSIgoMYWRkZWRUcmFja0lkGAIgASgFUgxhZGRlZFRyYWNr'
    'SWQ=');

@$core.Deprecated('Use moveTrackInPlaylistRequestDescriptor instead')
const MoveTrackInPlaylistRequest$json = {
  '1': 'MoveTrackInPlaylistRequest',
  '2': [
    {'1': 'playlistTrackId', '3': 1, '4': 1, '5': 5, '10': 'playlistTrackId'},
    {'1': 'afterPlaylistTrackId', '3': 2, '4': 1, '5': 5, '10': 'afterPlaylistTrackId'},
  ],
};

/// Descriptor for `MoveTrackInPlaylistRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moveTrackInPlaylistRequestDescriptor = $convert.base64Decode(
    'ChpNb3ZlVHJhY2tJblBsYXlsaXN0UmVxdWVzdBIoCg9wbGF5bGlzdFRyYWNrSWQYASABKAVSD3'
    'BsYXlsaXN0VHJhY2tJZBIyChRhZnRlclBsYXlsaXN0VHJhY2tJZBgCIAEoBVIUYWZ0ZXJQbGF5'
    'bGlzdFRyYWNrSWQ=');

@$core.Deprecated('Use moveTrackInPlaylistResponseDescriptor instead')
const MoveTrackInPlaylistResponse$json = {
  '1': 'MoveTrackInPlaylistResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 11, '6': '.wavenet.ActionResponse', '10': 'status'},
  ],
};

/// Descriptor for `MoveTrackInPlaylistResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moveTrackInPlaylistResponseDescriptor = $convert.base64Decode(
    'ChtNb3ZlVHJhY2tJblBsYXlsaXN0UmVzcG9uc2USLwoGc3RhdHVzGAEgASgLMhcud2F2ZW5ldC'
    '5BY3Rpb25SZXNwb25zZVIGc3RhdHVz');

@$core.Deprecated('Use removeTrackFromPlaylistRequestDescriptor instead')
const RemoveTrackFromPlaylistRequest$json = {
  '1': 'RemoveTrackFromPlaylistRequest',
  '2': [
    {'1': 'playlistTrackId', '3': 1, '4': 1, '5': 5, '10': 'playlistTrackId'},
  ],
};

/// Descriptor for `RemoveTrackFromPlaylistRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeTrackFromPlaylistRequestDescriptor = $convert.base64Decode(
    'Ch5SZW1vdmVUcmFja0Zyb21QbGF5bGlzdFJlcXVlc3QSKAoPcGxheWxpc3RUcmFja0lkGAEgAS'
    'gFUg9wbGF5bGlzdFRyYWNrSWQ=');

@$core.Deprecated('Use removeTrackFromPlaylistResponseDescriptor instead')
const RemoveTrackFromPlaylistResponse$json = {
  '1': 'RemoveTrackFromPlaylistResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 11, '6': '.wavenet.ActionResponse', '10': 'status'},
  ],
};

/// Descriptor for `RemoveTrackFromPlaylistResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeTrackFromPlaylistResponseDescriptor = $convert.base64Decode(
    'Ch9SZW1vdmVUcmFja0Zyb21QbGF5bGlzdFJlc3BvbnNlEi8KBnN0YXR1cxgBIAEoCzIXLndhdm'
    'VuZXQuQWN0aW9uUmVzcG9uc2VSBnN0YXR1cw==');

@$core.Deprecated('Use createPlaylistResponseDescriptor instead')
const CreatePlaylistResponse$json = {
  '1': 'CreatePlaylistResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 11, '6': '.wavenet.ActionResponse', '10': 'status'},
    {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `CreatePlaylistResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPlaylistResponseDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVQbGF5bGlzdFJlc3BvbnNlEi8KBnN0YXR1cxgBIAEoCzIXLndhdmVuZXQuQWN0aW'
    '9uUmVzcG9uc2VSBnN0YXR1cxIOCgJpZBgCIAEoBVICaWQ=');

@$core.Deprecated('Use deletePlaylistRequestDescriptor instead')
const DeletePlaylistRequest$json = {
  '1': 'DeletePlaylistRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `DeletePlaylistRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePlaylistRequestDescriptor = $convert.base64Decode(
    'ChVEZWxldGVQbGF5bGlzdFJlcXVlc3QSDgoCaWQYASABKAVSAmlk');

@$core.Deprecated('Use deletePlaylistResponseDescriptor instead')
const DeletePlaylistResponse$json = {
  '1': 'DeletePlaylistResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 11, '6': '.wavenet.ActionResponse', '10': 'status'},
  ],
};

/// Descriptor for `DeletePlaylistResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePlaylistResponseDescriptor = $convert.base64Decode(
    'ChZEZWxldGVQbGF5bGlzdFJlc3BvbnNlEi8KBnN0YXR1cxgBIAEoCzIXLndhdmVuZXQuQWN0aW'
    '9uUmVzcG9uc2VSBnN0YXR1cw==');

@$core.Deprecated('Use changePlaylistRequestDescriptor instead')
const ChangePlaylistRequest$json = {
  '1': 'ChangePlaylistRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'title', '17': true},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'description', '17': true},
  ],
  '8': [
    {'1': '_title'},
    {'1': '_description'},
  ],
};

/// Descriptor for `ChangePlaylistRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePlaylistRequestDescriptor = $convert.base64Decode(
    'ChVDaGFuZ2VQbGF5bGlzdFJlcXVlc3QSDgoCaWQYASABKAVSAmlkEhkKBXRpdGxlGAIgASgJSA'
    'BSBXRpdGxliAEBEiUKC2Rlc2NyaXB0aW9uGAMgASgJSAFSC2Rlc2NyaXB0aW9uiAEBQggKBl90'
    'aXRsZUIOCgxfZGVzY3JpcHRpb24=');

@$core.Deprecated('Use playlistResponseDescriptor instead')
const PlaylistResponse$json = {
  '1': 'PlaylistResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
    {'1': 'coverSource', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'coverSource', '17': true},
    {'1': 'createdAt', '3': 5, '4': 1, '5': 3, '10': 'createdAt'},
  ],
  '8': [
    {'1': '_description'},
    {'1': '_coverSource'},
  ],
};

/// Descriptor for `PlaylistResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playlistResponseDescriptor = $convert.base64Decode(
    'ChBQbGF5bGlzdFJlc3BvbnNlEg4KAmlkGAEgASgFUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bG'
    'USJQoLZGVzY3JpcHRpb24YAyABKAlIAFILZGVzY3JpcHRpb26IAQESJQoLY292ZXJTb3VyY2UY'
    'BCABKAlIAVILY292ZXJTb3VyY2WIAQESHAoJY3JlYXRlZEF0GAUgASgDUgljcmVhdGVkQXRCDg'
    'oMX2Rlc2NyaXB0aW9uQg4KDF9jb3ZlclNvdXJjZQ==');

@$core.Deprecated('Use playlistDetailsDescriptor instead')
const PlaylistDetails$json = {
  '1': 'PlaylistDetails',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'coverSource', '3': 4, '4': 1, '5': 9, '10': 'coverSource'},
    {'1': 'createdAt', '3': 5, '4': 1, '5': 5, '10': 'createdAt'},
    {'1': 'tracks', '3': 6, '4': 3, '5': 11, '6': '.wavenet.PlaylistTrack', '10': 'tracks'},
  ],
};

/// Descriptor for `PlaylistDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playlistDetailsDescriptor = $convert.base64Decode(
    'Cg9QbGF5bGlzdERldGFpbHMSDgoCaWQYASABKAVSAmlkEhQKBXRpdGxlGAIgASgJUgV0aXRsZR'
    'IgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SIAoLY292ZXJTb3VyY2UYBCABKAlS'
    'C2NvdmVyU291cmNlEhwKCWNyZWF0ZWRBdBgFIAEoBVIJY3JlYXRlZEF0Ei4KBnRyYWNrcxgGIA'
    'MoCzIWLndhdmVuZXQuUGxheWxpc3RUcmFja1IGdHJhY2tz');

@$core.Deprecated('Use playlistTrackDescriptor instead')
const PlaylistTrack$json = {
  '1': 'PlaylistTrack',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'track', '3': 2, '4': 1, '5': 11, '6': '.wavenet.Track', '10': 'track'},
    {'1': 'addedBy', '3': 3, '4': 1, '5': 5, '10': 'addedBy'},
    {'1': 'addedAt', '3': 4, '4': 1, '5': 5, '10': 'addedAt'},
    {'1': 'position', '3': 5, '4': 1, '5': 5, '10': 'position'},
  ],
};

/// Descriptor for `PlaylistTrack`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playlistTrackDescriptor = $convert.base64Decode(
    'Cg1QbGF5bGlzdFRyYWNrEg4KAmlkGAEgASgFUgJpZBIkCgV0cmFjaxgCIAEoCzIOLndhdmVuZX'
    'QuVHJhY2tSBXRyYWNrEhgKB2FkZGVkQnkYAyABKAVSB2FkZGVkQnkSGAoHYWRkZWRBdBgEIAEo'
    'BVIHYWRkZWRBdBIaCghwb3NpdGlvbhgFIAEoBVIIcG9zaXRpb24=');

