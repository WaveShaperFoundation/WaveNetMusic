import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/now_playing_page.dart';
import '../services/audio_handler.dart';
import 'package:bottom_sheet/bottom_sheet.dart';

class PlayerIsland extends StatefulWidget {
  const PlayerIsland({super.key});

  @override
  State<PlayerIsland> createState() => _PlayerIslandState();
}

class _PlayerIslandState extends State<PlayerIsland> {
  @override
  Widget build(BuildContext context) {
    var audioHandler = context.read<WaveAudioHandler>();
    return StreamBuilder(
        stream: audioHandler.mediaItem.stream,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                showFlexibleBottomSheet(
                  minHeight: 0,
                  initHeight: 1,
                  maxHeight: 1,
                  anchors: [0,1],
                  isCollapsible: true,
                  context: context,
                  isSafeArea: true,
                  builder: (context, scrollController, bottomSheetOffset) {
                    return NowPlayingPage(scrollController: scrollController,);
                  },
                  isExpand: true,
                );
                return;

              },
              child: Card(
                child: Row(
                  children: [
                    audioHandler.mediaItem.value?.artUri != null
                        ? Image(
                            height: 60,
                            isAntiAlias: true,
                            filterQuality: FilterQuality.high,
                            image: CachedNetworkImageProvider(
                                (audioHandler.mediaItem.value?.artUri ??
                                        "No User")
                                    .toString()))
                        : Container(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              (audioHandler.mediaItem.value?.title ??
                                  "No Title"),
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              (audioHandler.mediaItem.value?.artist ??
                                  "No Artist"),
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          if (audioHandler.playbackState.value.playing) {
                            audioHandler.pause();
                          } else {
                            audioHandler.play();
                          }
                          setState(() {});
                        },
                        icon: Icon(
                          audioHandler.playbackState.value.playing
                              ? Icons.pause
                              : Icons.play_arrow,
                          size: 32,
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
