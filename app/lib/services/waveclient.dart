import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';

import '../models/library_models.dart';
import 'generated/wavenet.pbgrpc.dart';

class WaveClient {
  late ClientChannel channel;
  late LibraryClient libraryClient;
  late AuthenticationClient authenticationClient;
  late PlaylistClient playlistClient;
  String? authToken;

  WaveClient() {
    if (kDebugMode) {
      print("Creating WaveClient");
    }
    changeHost("192.168.0.65");
  }

  void changeHost(String host){
    host = host.replaceAll("http://", "");
    host = host.replaceAll("https://", "");
    host = host.replaceAll("3000","50051");
    try {
      this.channel = ClientChannel(host,
          port: 50051,
          options: const ChannelOptions(
            userAgent: "Windoof",
            credentials: ChannelCredentials.insecure(),
          ));
      this.authenticationClient = AuthenticationClient(channel);
      this.libraryClient = LibraryClient(channel);
      this.playlistClient = PlaylistClient(channel);
    } catch (e) {
      print("Error creating WaveClient: $e");
    }
  }

  Future<String> login(String username, String password) async {
    try {
      var response = await authenticationClient.login(LoginRequest()
        ..username = username
        ..password = password);
      print("Login response: ${response.token}");
      authToken = response.token;
      return Future.value(response.token);
    } catch (e) {
      print("Error logging in: $e");
      return Future.error(e);
    }
  }

  Future<int> createPlaylist(String title, String description) async {
    try {
      var response = await playlistClient.createPlaylist(
          CreatePlaylistRequest()
            ..title = title
            ..description = description,
          options: CallOptions(metadata: {"auth_token": authToken as String}));
      print("Playlist created: ${response.id}");
      return response.id;
    } catch (e) {
      print("Error creating playlist: $e");
      return -1;
    }
  }

  Future<List<WavePlaylist>> getMyPlaylists() async {
    try {
      var response = await playlistClient.getMyPlaylists(Empty(),
          options: CallOptions(metadata: {"auth_token": authToken as String}));
      print("My playlists: ${response.playlists}");
      return response.playlists.map(
        (e) {
          return WavePlaylist(
            id: e.id,
            title: e.title,
            description: e.description,
            coverSource: e.coverSource,
            createdAt: DateTime.fromMillisecondsSinceEpoch(e.createdAt.toInt()),
          );
        },
      ).toList();
    } catch (e) {
      print("Error getting my playlists: $e");
      return Future.error("Error getting my playlists: $e");
    }
  }

  Future<int> addTrackToPlaylist(int playlistId, int trackId) async {
    if (authToken == null) {
      return Future.error("Not logged in");
    }
    try {
      var response = await playlistClient.addTrackToPlaylist(
          AddTrackToPlaylistRequest()
            ..playlistId = playlistId
            ..trackId = trackId,
          options: CallOptions(metadata: {"auth_token": authToken as String}));
      return response.addedTrackId;
    } catch (e) {
      print("Error adding track to playlist: $e");
      return Future.error("Error adding track to playlist: $e");
    }
  }

  Future<PlaylistDetails> getPlaylistDetails(int playlistId) async {
    try {
      var response = await playlistClient
          .getPlaylist(GetPlaylistRequest()..id = playlistId);
      return response;
    } catch (e) {
      print("Error getting playlist details: $e");
      return Future.error("Error getting playlist details: $e");
    }
  }

  Future<void> getArtists() async {
    try {
      var response = await libraryClient.getArtists(Empty());
      print("Artists: ${response.artists}");
    } catch (e) {
      print("Error getting artists: $e");
    }
  }
}
