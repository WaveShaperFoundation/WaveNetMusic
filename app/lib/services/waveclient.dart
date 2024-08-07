import 'dart:io';

import 'package:app/services/audio_handler.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:grpc/grpc.dart';
import 'package:just_audio/just_audio.dart';

import '../models/library_models.dart';
import 'generated/wavenet.pbgrpc.dart';

class WaveClient {
  late ClientChannel channel;
  late LibraryClient libraryClient;
  late AuthenticationClient authenticationClient;
  late PlaylistClient playlistClient;
  String? authToken;

  String hostName = "wavenet.local";
  int serverPort = 50051;
  int streamingPort = 3000;

  WaveAudioHandler? audioHandler;

  WaveClient() {
    if (kDebugMode) {
      print("Creating WaveClient");
    }

    AudioPlayer player = AudioPlayer();
    AudioService.init(
      builder: () => WaveAudioHandler(
          player: player, loaded: true, getTrackById: getTrack),
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.wave.net.app',
        androidNotificationChannelName: 'WaveNet',
        androidNotificationIcon: 'mipmap/ic_stat_wave_svg_borderless',
        androidStopForegroundOnPause: true,
        androidNotificationOngoing: true,
        androidNotificationChannelDescription:
            'This is the WaveNet notification media player channel responsible for playing your music',
      ),
    ).then(
      (value) {
        audioHandler = value;
      },
    );

    changeHost(hostName, serverPort, streamingPort);
  }

  void changeHost(String host, int serverPort, int streamingPort) {
    host = host.replaceAll("http://", "");
    host = host.replaceAll("https://", "");
    hostName = host;
    this.serverPort = serverPort;
    this.streamingPort = streamingPort;
    print("New host is $hostName:$serverPort and streaming at :$streamingPort");
    try {
      this.channel = ClientChannel(host,
          port: serverPort,
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

  void setToken(String authToken){
    this.authToken = authToken;
  }

  Future<String> login(String username, String password) async {
    try {
      var response = await authenticationClient.login(LoginRequest()
        ..username = username
        ..password = password);
      print(
          "Login response: ${response.token} for username ${username} / ${password}");
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

  Future<Track> getTrack(int trackId) async {
    try {
      var response =
          await libraryClient.getTrack(GetTrackRequest()..id = trackId);
      return response;
      print("Track: ${response.name}");
    } catch (e) {
      print("Error getting track: $e");
      return Future.error(e);
    }
  }

  Future<void> addTrackToQueue(int trackId) async {
    try {
      var response =
          await libraryClient.getTrack(GetTrackRequest()..id = trackId);
      MediaItem mediaItem = MediaItem(
        id: response.id.toString(),
        album: response.album.name,
        title: response.name,
        artist: response.artists.map((e) => e.name).join(", "),
        duration: Duration(seconds: response.length.toInt()),
        artUri: Uri.parse(getAlbumCoverURI(response.album.id)),
        extras: {
          "trackId": response.id,
          "albumId": response.album.id,
          "streamingLink": getStreamingLink(response.id),
        },
      );
      this.audioHandler?.addQueueItem(mediaItem);
      print("Added track to queue: ${response.name}");
    } catch (e) {
      print("Error adding track to queue: $e");
    }
  }

  Future<void> playTrack(int trackId) async {
    try {
      var response =
          await libraryClient.getTrack(GetTrackRequest()..id = trackId);
      MediaItem mediaItem = MediaItem(
        id: response.id.toString(),
        album: response.album.name,
        title: response.name,
        artist: response.artists.map((e) => e.name).join(", "),
        duration: Duration(seconds: response.length.toInt()),
        artUri: Uri.parse(getAlbumCoverURI(response.album.id)),
        extras: {
          "trackId": response.id,
          "albumId": response.album.id,
          "streamingLink": getStreamingLink(response.id),
        },
      );
      this.audioHandler?.playWithMediaItem(
          mediaItem, getStreamingLink(trackId), response.album.id);
      print("Playing track: ${response.name}");
    } catch (e) {
      print("Error playing track: $e");
    }
  }

  Future<int> getFilesPort() {
    return Future.value(3000);
  }

  NetworkImage getAlbumCoverByTrack(int trackId) {
    return NetworkImage("http://$hostName:$streamingPort/cover?id=$trackId");
  }

  String getAlbumCoverURI(int albumId) {
    return "http://$hostName:$streamingPort/cover?id=$albumId";
  }

  String getStreamingLink(int trackId) {
    return "http://$hostName:$streamingPort/song?id=$trackId";
  }

  FastCachedImageProvider getAlbumCover(int albumId) {
    return FastCachedImageProvider(
      getAlbumCoverURI(albumId),
    );
  }
}
