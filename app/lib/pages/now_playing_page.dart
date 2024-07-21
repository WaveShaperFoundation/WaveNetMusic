import 'package:cached_network_image/cached_network_image.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import '../services/audio_handler.dart';

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

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    )..forward();
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);

    _updatePaletteGenerator();
    var audio_handler = context.read<WaveAudioHandler>();
    audio_handler.playbackState.value.playing
        ? controller.forward()
        : controller.reverse();
    audio_handler.playbackState.stream.listen((event) {
      if (event.playing)
        controller.forward();
      else
        controller.reverse();
    });
  }

  Future<void> _updatePaletteGenerator() async {
    var audio_handler = context.read<WaveAudioHandler>();
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(audio_handler.mediaItem.value!.artUri!.toString()),
      maximumColorCount: 20,
    );



    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var audio_handler = context.read<WaveAudioHandler>();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(28),
          controller: widget.scrollController,
          children: [
            SizedBox(
              height: 70,
            ),
            Card(
              elevation: 10,
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: CachedNetworkImageProvider(
                        audio_handler.mediaItem.value!.artUri!.toString()),
                  ),
                ),
              ),
            ),
            SizedBox(height: 48),
            Text(
              audio_handler.mediaItem.value!.title!,
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            Text(
              audio_handler.mediaItem.value!.artist!,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Padding(
              padding: const EdgeInsets.only(top:12.0,bottom: 24),
              child: StreamBuilder<Object>(
                  stream: audio_handler.playbackState.stream,
                  builder: (context, snapshot) {
                    return Slider(

                        value: audio_handler
                                  .playbackState.value.position.inMilliseconds
                                  .toDouble() >
                              audio_handler
                                  .mediaItem.value!.duration!.inMilliseconds
                                  .toDouble()
                          ? audio_handler
                              .mediaItem.value!.duration!.inMilliseconds
                              .toDouble()
                          : 0,
                      onChanged: (value) {
                        audio_handler.seek(Duration(milliseconds: value.toInt()));
                      },
                      min: 0,
                      max: audio_handler.mediaItem.value!.duration!.inMilliseconds
                              .toDouble() +
                          1,
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    //audio_handler.seekToPrevious();
                  },
                  icon: Icon(Icons.skip_previous),
                ),
                StreamBuilder(
                  stream: audio_handler.playbackState,
                  builder: (context, snapshot) {
                    return IconButton.filled(
                      color: Theme.of(context).colorScheme.onSurface,
                      onPressed: () {
                        if (audio_handler.playbackState.value.playing)
                          audio_handler.pause();
                        else
                          audio_handler.play();
                      },
                      icon: AnimatedIcon(
                        icon: AnimatedIcons.play_pause,
                        progress: animation,
                        color: Theme.of(context).colorScheme.surface,
                        size: 48,
                      ),
                    );
                  },
                ),
                IconButton(
                  onPressed: () {
                    //audio_handler.seekToNext();
                  },
                  icon: Icon(Icons.skip_next),
                ),
              ],
            ),
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
                    Text("This phone", style: Theme.of(context).textTheme.labelMedium,)
                  ],
                ),
                IconButton(
                  onPressed:(){

                  },
                  icon: Icon(MdiIcons.playlistMusic),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
