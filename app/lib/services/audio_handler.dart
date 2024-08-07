import 'package:app/services/generated/wavenet.pb.dart';
import 'package:app/services/waveclient.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';

class WaveAudioHandler extends BaseAudioHandler
    with QueueHandler, SeekHandler, ChangeNotifier {
  final AudioPlayer player;

  MediaItem? currentSong;
  List<Track>? _songs;
  bool loaded = false;

  int queueIndex = 0;
  int currentPlayingId = -1;
  int currentPlayingAlbumId = -1;
  Future<Track> Function(int trackId) getTrackById;

  @override
  WaveAudioHandler(
      {this.loaded = false, required this.player, required this.getTrackById}) {
    print("Creating audio handler");

    player.processingStateStream.listen((state) {
      if (state == ProcessingState.completed) {
        print("Song completed skipping to ");
        print(queue.value.map((e) => e.toString()).join("\n"));
        skipToNext();
      }
      ;
    });

    player.positionStream.listen(_broadcastPosition);
    player.playbackEventStream.listen(_broadcastState);
  }

  void _broadcastPosition(Duration position) {
    playbackState.add(playbackState.value.copyWith(updatePosition: position));
  }

  void _broadcastState(PlaybackEvent event) {
    final playing = player.playing;
    print("new broadcast says position is at "+player.position.toString());
    playbackState.add(playbackState.value.copyWith(
      controls: [
        MediaControl.skipToPrevious,
        if (playing) MediaControl.pause else MediaControl.play,
        MediaControl.skipToNext,
      ],
      systemActions: const {
        MediaAction.seek,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      },
      androidCompactActionIndices: const [0, 1, 3],
      processingState: const {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[player.processingState]!,
      playing: playing,
      updatePosition: player.position,
      bufferedPosition: player.bufferedPosition,
      speed: player.speed,
      queueIndex: queueIndex,
    ));
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

  Future<void> playWithMediaItem(
      MediaItem item, String streamingUrl, int albumId) async {
    currentPlayingId = int.parse(item.id);
    currentPlayingAlbumId = albumId;
    currentSong = item;
    notifyListeners();
    this.player.setUrl(streamingUrl).then((value) {
      this.player.play();
      mediaItem.value = item;
      mediaItem.add(item);
    });
  }

  @override
  Future<void> playMediaItem(MediaItem item) async {
    print("Tryna resolve the media item");
    currentPlayingId = int.parse(item.id);
    currentSong = item;
    notifyListeners();
    this.player.setUrl(item.extras!["streamingLink"]).then((value) {
      mediaItem.value = item;
      mediaItem.add(item);
    });
  }

  @override
  Future<void> seek(Duration position) {
    return player.seek(position);
  }

  @override
  Future<void> skipToQueueItem(int index) async {
    print("Skipping to $index");
    queueIndex = index;
    if (index < queue.value.length) {
      await playMediaItem(queue.value[index]);
    } else {
      await playMediaItem(queue.value[queue.value.length]);
    }
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }
}
