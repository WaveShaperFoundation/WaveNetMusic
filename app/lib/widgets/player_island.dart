import 'package:app/services/waveclient.dart';
import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_scroll/text_scroll.dart';
import '../pages/now_playing_page.dart';
import 'package:bottom_sheet/bottom_sheet.dart';

class PlayerIsland extends StatefulWidget {
  const PlayerIsland({super.key});

  @override
  State<PlayerIsland> createState() => _PlayerIslandState();
}

class _PlayerIslandState extends State<PlayerIsland>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      value: 1.0,
      vsync: this,
    );

    var audioHandler = context.read<WaveClient>().audioHandler;
    if (audioHandler != null) {
      if (audioHandler.playbackState.value.playing) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      audioHandler.playbackState.stream.listen((playbackState) {
        if (playbackState.playing) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var waveclient = context.read<WaveClient>();
    var audioHandler = context.read<WaveClient>().audioHandler;
    if (audioHandler == null) return Container();

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
          onTap: () {
            showFlexibleBottomSheet(
              minHeight: 0,
              initHeight: 1,
              maxHeight: 1,
              anchors: [0, 1],
              isCollapsible: true,
              context: context,
              isSafeArea: true,
              builder: (context, scrollController, bottomSheetOffset) {
                return NowPlayingPage(
                  scrollController: scrollController,
                );
              },
              isExpand: true,
            );
            return;
          },
          child: Card(
              elevation: 10,
              borderOnForeground: true,
              semanticContainer: true,
              clipBehavior: Clip.antiAlias,
              color: Theme.of(context).colorScheme.secondaryContainer,
              child: StreamBuilder<MediaItem?>(
                  stream: audioHandler.mediaItem.stream,
                  builder: (context, snapshot) {
                    return Row(
                      children: [
                        audioHandler.mediaItem.value?.artUri != null
                            ? Image(
                                height: Theme.of(context)
                                        .floatingActionButtonTheme
                                        .smallSizeConstraints
                                        ?.maxHeight ??
                                    60,
                                isAntiAlias: true,
                                filterQuality: FilterQuality.high,
                                image: waveclient.getAlbumCover(audioHandler
                                    .mediaItem.value!.extras!["albumId"]),
                              )
                            : SizedBox(
                                height: Theme.of(context)
                                        .floatingActionButtonTheme
                                        .smallSizeConstraints
                                        ?.maxHeight ??
                                    60,
                              ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextScroll(
                                  delayBefore: Duration(seconds: 2),
                                  intervalSpaces: 10,
                                  pauseBetween: Duration(seconds: 1),
                                  mode: TextScrollMode.endless,
                                  velocity: Velocity(pixelsPerSecond: Offset(50, 0)),
                                  (audioHandler.mediaItem.value?.title ??
                                      "No Title"),
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                                  ),
                                ),
                                TextScroll(
                                  delayBefore: Duration(seconds: 2),
                                  intervalSpaces: 60,
                                  pauseBetween: Duration(seconds: 1),
                                  mode: TextScrollMode.endless,
                                  velocity: Velocity(pixelsPerSecond: Offset(50, 0)),
                                  (audioHandler.mediaItem.value?.artist ??
                                      "No Artist"),
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: IconButton(
                              onPressed: () {
                                if (audioHandler.playbackState.value.playing) {
                                  audioHandler.pause();
                                } else {
                                  audioHandler.play();
                                }
                                setState(() {});
                              },
                              icon: AnimatedIcon(
                                icon: AnimatedIcons.play_pause,
                                progress: _controller,
                                size: 32,
                              )),
                        )
                      ],
                    );
                  }))),
    );
  }
}
