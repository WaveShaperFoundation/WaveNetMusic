import 'dart:io';
import 'dart:math';

import 'package:app/services/generated/wavenet.pb.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';
import 'package:smtc_windows/smtc_windows.dart';

class WaveAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  final AudioPlayer player;
  late final SMTCWindows? smtc;
  bool loaded = false;


  @override
  WaveAudioHandler({this.loaded = false, required this.player, required this.smtc}) {
    print("Creating audio handler");
    if (Platform.isWindows && smtc != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        print("add post frame callback");
        try {
          // Listen to button events and update playback status accordingly
          smtc!.buttonPressStream.listen((event) {
            switch (event) {
              case PressedButton.play:
              // Update playback status
                smtc?.setPlaybackStatus(PlaybackStatus.Playing);
                break;
              case PressedButton.pause:
                smtc?.setPlaybackStatus(PlaybackStatus.Paused);
                break;
              case PressedButton.next:
                print('Next');
                break;
              case PressedButton.previous:
                print('Previous');
                break;
              case PressedButton.stop:
                smtc?.setPlaybackStatus(PlaybackStatus.Stopped);
                smtc?.disableSmtc();
                break;
              default:
                break;
            }
          });
        } catch (e) {
          debugPrint("Error: $e");
        }
      });
    }
    playbackState.add(playbackState.value.copyWith(
      controls: [
        MediaControl.skipToPrevious,
        MediaControl.pause,
        MediaControl.stop,
        MediaControl.play,
        MediaControl.skipToNext,
      ],
      systemActions: const {
        MediaAction.seek,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      },
      processingState: const {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[player.processingState]!,
    ));
    player.processingStateStream.listen((event) {
      playbackState.add(playbackState.value.copyWith(
        processingState: const {
          ProcessingState.idle: AudioProcessingState.idle,
          ProcessingState.loading: AudioProcessingState.loading,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed,
        }[event]!,
      ));
    });
    player.positionStream.listen((event) {
      playbackState.add(playbackState.value.copyWith(
        updatePosition: event,
      ));
    });
  }

  @override
  Future<void> play() async {
    playbackState.add(playbackState.value.copyWith(
      playing: true,
    ));
    await player.play();
  }

  @override
  Future<void> pause() async {
    playbackState.add(playbackState.value.copyWith(
      playing: false,
    ));
    await player.pause();
  }

  @override
  Future<void> stop() async {
    await player.stop();
    playbackState.add(playbackState.value.copyWith(
        //processingState: AudioProcessingState.ready,
        ));
  }

  bool liked = false;

  @override
  Future customAction(String name, [Map<String, dynamic>? extras]) {
    if (name == "like") {
      liked = !liked;
      playbackState.add(playbackState.value.copyWith(
        controls: [
          MediaControl.skipToPrevious,
          MediaControl.skipToNext,
          MediaControl.custom(
              androidIcon:
                  liked ? "drawable/thumb_up_outline" : "drawable/thumb_up",
              label: 'Like',
              extras: {"action": "like", "songId": 2},
              name: 'like'),
        ],

      ));
      print("Liked song ${extras!['songId']}");

    }
    return super.customAction(name, extras);
  }

  Future<void> playTrack(Track track) async {
    print(track);

    if(Platform.isWindows){
      print("Updating metadata windows smtc");
      smtc!.updateMetadata(
        MusicMetadata(
          title: track.name,
          album: track.album.name,
          albumArtist: track.album.artists.join(","),
          artist: track.album.artists.join(","),
          thumbnail: 'http://192.168.0.50:3000/cover?id=${track.album.id}',
        )
      );
    }

    this
        .player
        .setUrl("http://192.168.0.50:3000/track?id=${track.id}")
        .then((value) {
      mediaItem.value = MediaItem(
        id: track.id.toString(),
        title: track.name,
        album: track.album.name,
        artist: track.album.artists.first.name,
        duration: Duration(seconds: track.length),
        rating: Rating.newThumbRating(liked),
        artUri: Uri.parse(
          "http://192.168.0.50:3000/cover?id=${track.album.id}",
        ),
      );
      playbackState.add(playbackState.value.copyWith(
        playing: true,
        updatePosition: Duration.zero,
        bufferedPosition: Duration.zero,
        repeatMode: AudioServiceRepeatMode.none,
        captioningEnabled: false,
        shuffleMode: AudioServiceShuffleMode.none,
        controls: [
          MediaControl.skipToPrevious,
          MediaControl.skipToNext,
          MediaControl.custom(
              androidIcon: "drawable/thumb_up_outline",
              label: 'Like',
              extras: {"action": "like", "songId": 2},
              name: 'like'),
        ],
        androidCompactActionIndices: const [0, 1, 2],
        processingState: const {
          ProcessingState.idle: AudioProcessingState.idle,
          ProcessingState.loading: AudioProcessingState.loading,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed,
        }[player.processingState]!,
        systemActions: const {
          MediaAction.custom,
          MediaAction.seek,
          MediaAction.setRating,
        },
      ));
    });
  }

  @override
  Future<void> playMediaItem(MediaItem item) async {
    print(item);

    if(Platform.isWindows){
      print("Updating metadata windows smtc");
      smtc?.updateMetadata(
        MusicMetadata(
          title: item.title,
          album: item.album,
          albumArtist: item.artist,
          artist: item.artist,
          thumbnail: item.artUri.toString(),
        )
      );
    }

    this.player.setUrl(item.id).then((value) {
      mediaItem.value = item;
      mediaItem.add(item);
      playbackState.add(playbackState.value.copyWith(
        playing: true,
        updatePosition: Duration.zero,
        bufferedPosition: Duration.zero,
        repeatMode: AudioServiceRepeatMode.none,
        captioningEnabled: false,
        shuffleMode: AudioServiceShuffleMode.none,
        controls: [
          MediaControl.skipToPrevious,
          MediaControl.skipToNext,
          MediaControl.custom(
              androidIcon: "drawable/thumb_up_outline",
              label: 'Like',
              extras: {"action": "like", "songId": item.id},
              name: 'like'),
        ],
        androidCompactActionIndices: const [0, 1, 2],
        processingState: const {
          ProcessingState.idle: AudioProcessingState.idle,
          ProcessingState.loading: AudioProcessingState.loading,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed,
        }[player.processingState]!,
        systemActions: const {
          MediaAction.custom,
          MediaAction.seek,
          MediaAction.setRating,
        },
      ));
    });
  }

  Future<void> seek(Duration position) => player.seek(position);

  Future<void> skipToQueueItem(int i) => player.seek(Duration.zero, index: i);

  @override
  Future<void> skipToNext() async {
    print("Skipping to next");
  }

  void dispose() {
    player.dispose();
    smtc?.disableSmtc();
  }
}
