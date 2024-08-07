import 'dart:async';

import 'package:animations/animations.dart';
import 'package:app/widgets/album_cover_card.dart';
import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:text_scroll/text_scroll.dart';

import '../services/audio_handler.dart';
import '../services/generated/wavenet.pb.dart';
import '../services/waveclient.dart';
import '../widgets/album_song_tile.dart';

class NowPlayingPage extends StatefulWidget {
  final ScrollController scrollController;

  const NowPlayingPage({super.key, required this.scrollController});

  @override
  State<NowPlayingPage> createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  PaletteGenerator? paletteGenerator;

  int index = 0;

  Duration position = Duration.zero;
  Duration bufferedPosition = Duration.zero;
  Duration trackDuration = Duration.zero;
  MediaItem mediaItem = MediaItem(
      id: "0",
      album: "No Album",
      title: "No Title",
      artist: "No Artist",
      duration: Duration.zero);

  late StreamSubscription positionSubscription;
  late StreamSubscription bufferedPositionSubscription;
  late StreamSubscription durationSubscription;
  late StreamSubscription mediaItemSubscription;
  late StreamSubscription playBackSubscription;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    )..forward();
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);

    _updatePaletteGenerator();
    var audio_handler = context.read<WaveClient>().audioHandler;
    if (audio_handler == null) return;

    position = audio_handler.playbackState.value.position;
    bufferedPosition = audio_handler.playbackState.value.bufferedPosition;
    if (audio_handler.player.duration != null) {
      trackDuration = audio_handler.player.duration!;
    } else {
      trackDuration = Duration.zero;
    }
    mediaItem = audio_handler.mediaItem.value!;

    positionSubscription = audio_handler.player.positionStream.listen((event) {
      position = event;
      if (index == 0) {
        setState(() {});
      }
    });

    bufferedPositionSubscription =
        audio_handler.player.bufferedPositionStream.listen((event) {
      bufferedPosition = event;
      if (index == 0) {
        setState(() {});
      }
    });

    durationSubscription = audio_handler.player.durationStream.listen((event) {
      if (event != null) {
        trackDuration = event;
      } else {
        trackDuration = Duration.zero;
      }
      if (index == 0) {
        setState(() {});
      }
    });

    mediaItemSubscription = audio_handler.mediaItem.stream.listen((event) {
      mediaItem = event!;
      if (index == 0) {
        setState(() {});
      }
    });

    audio_handler.playbackState.value.playing
        ? controller.forward()
        : controller.reverse();

    playBackSubscription = audio_handler.playbackState.stream.listen((event) {
      if (event.playing) {
        controller.forward();
      } else {
        controller.reverse();
      }
      if (index == 0) {
        setState(() {});
      }
    });
  }

  Future<void> _updatePaletteGenerator() async {
    var waveClient = context.read<WaveClient>();
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      waveClient.getAlbumCover(waveClient.audioHandler!.currentPlayingAlbumId),
      maximumColorCount: 20,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var audioHandler = context.read<WaveClient>().audioHandler;
    if (audioHandler == null) return Container();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: PageTransitionSwitcher(
        reverse: index == 0,
        transitionBuilder: (Widget child, Animation<double> primaryAnimation,
            Animation<double> secondaryAnimation) {
          return SharedAxisTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
            transitionType: SharedAxisTransitionType.horizontal,
            fillColor: Colors.transparent,
          );
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          key: ValueKey(index.toString()),
          controller: widget.scrollController,
          children: [
            if (index == 0) ...buildPlayingInformation(context, audioHandler),
            if (index == 1) ...buildQueueInformation(),
          ],
        ),
      )),
    );
  }

  List<Widget> buildQueueInformation() {
    var waveClient = context.read<WaveClient>();
    var audio_handler = context.read<WaveClient>().audioHandler;
    return [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          "Now queued",
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ),
      ...audio_handler!.queue.value.map((e) {
        return FutureBuilder(
          future: waveClient.getTrack(int.parse(e.id)),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();
            Track track = snapshot.data as Track;
            return SingleSongTile(
              songId: int.parse(e.id),
              track: track,
              length: Duration(milliseconds: track.length),
              songName: e.title,
              trackNumber: 1,
              showAlbum: true,
              key: ValueKey<int>(int.parse(e.id)),
            );
          },
        );
      }).toList()
    ];
  }

  List<Widget> buildPlayingInformation(
      BuildContext context, WaveAudioHandler audio_handler) {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Text("Now streaming",
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center),
      ),
      SizedBox(
        height: 40,
      ),
      AnimatedSwitcher(
          duration: const Duration(milliseconds: 550),
          child: AlbumCoverCard(
              key: ValueKey(mediaItem.artUri),
              albumId: mediaItem.extras?["albumId"])),
      Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 6,
              child: AnimatedSwitcher(
                key: ValueKey(mediaItem.id),
                duration: const Duration(milliseconds: 350),
                switchInCurve: Curves.easeInOutCubicEmphasized,
                switchOutCurve: Curves.easeInOutCubicEmphasized,
                child: Column(
                  key: ValueKey(mediaItem.id),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextScroll(
                      key: ValueKey(mediaItem.title),
                      delayBefore: Duration(seconds: 2),
                      intervalSpaces: 60,
                      pauseBetween: Duration(seconds: 1),
                      mode: TextScrollMode.endless,
                      velocity: Velocity(pixelsPerSecond: Offset(50, 0)),
                      mediaItem.title,
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontWeight: FontWeight.w500, fontSize: 24),
                    ),
                    Text(
                      mediaItem.artist!!,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.thumb_up_alt_outlined,
                    size: 28,
                    color: Theme.of(context).colorScheme.onSurface,
                  )),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 24),
        child: buildSlider(audio_handler),
      ),
      buildControlsBar(audio_handler),
      SizedBox(height: 90),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  //audio_handler.seekToPrevious();
                },
                icon: Icon(Icons.speaker),
              ),
              Text(
                "This phone",
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          ),
          IconButton(
            onPressed: () {
              setState(() {
                index = 1;
              });
            },
            icon: Icon(MdiIcons.playlistMusic),
          )
        ],
      )
    ];
  }

  Row buildControlsBar(WaveAudioHandler audio_handler) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.shuffle)),
        IconButton.filledTonal(
          style: IconButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          ),
          iconSize: 32,
          onPressed: () {
            //audio_handler.seekToPrevious();
          },
          icon: Icon(
            Icons.skip_previous,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
        StreamBuilder(
          stream: audio_handler.playbackState,
          builder: (context, snapshot) {
            return IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              ),
              onPressed: () {
                if (audio_handler.playbackState.value.playing)
                  audio_handler.pause();
                else
                  audio_handler.play();
              },
              icon: AnimatedIcon(
                icon: AnimatedIcons.play_pause,
                progress: animation,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                size: 48,
              ),
            );
          },
        ),
        IconButton(
          iconSize: 32,
          style: IconButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          ),
          onPressed: () {
            //audio_handler.seekToNext();
          },
          icon: Icon(
            Icons.skip_next,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.repeat,
              color: Theme.of(context).colorScheme.onSurface,
            )),
      ],
    );
  }

  Widget buildSlider(WaveAudioHandler audio_handler) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 2,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 16),
            trackShape: CustomSliderTrackShape(),
            overlayColor:
                Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
            thumbColor: Theme.of(context).colorScheme.onSurface,
            activeTrackColor: Theme.of(context).colorScheme.onSurface,
            inactiveTrackColor:
                Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
          ),
          child: Slider.adaptive(
            value: position.inMilliseconds.toDouble() <
                    trackDuration.inMilliseconds.toDouble()
                ? position.inMilliseconds.toDouble()
                : 176772,
            secondaryTrackValue: bufferedPosition.inMilliseconds.toDouble(),
            secondaryActiveColor:
                Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
            inactiveColor:
                Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
            semanticFormatterCallback: (value) {
              return "Position is at " + value.toString();
            },
            onChanged: (value) {
              audio_handler.seek(Duration(milliseconds: value.toInt()));
            },
            min: 0,
            max: trackDuration.inMilliseconds.toDouble(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${position.inMinutes.toString().padLeft(2, '0')}:${(position.inSeconds % 60).toString().padLeft(2, '0')}",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              "${trackDuration.inMinutes.toString().padLeft(2, '0')}:${(trackDuration.inSeconds % 60).toString().padLeft(2, '0')}",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    positionSubscription.cancel();
    bufferedPositionSubscription.cancel();
    durationSubscription.cancel();
    mediaItemSubscription.cancel();
    playBackSubscription.cancel();
  }
}

class CustomSliderTrackShape extends RoundedRectSliderTrackShape {
  const CustomSliderTrackShape();

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
