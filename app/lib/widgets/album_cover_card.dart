import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

import '../services/waveclient.dart';

class AlbumCoverCard extends StatelessWidget {
  final int albumId;
  final String? blurHash;

  const AlbumCoverCard({super.key, required this.albumId, this.blurHash});

  @override
  Widget build(BuildContext context) {
    var waveclient = context.read<WaveClient>();

    return Hero(
        tag: "album-${albumId}",
        child: Card(
          color: Theme.of(context).colorScheme.primaryContainer,
          clipBehavior: Clip.antiAlias,
          elevation: 6,
          child: OctoImage(
            key: ValueKey("albumimage-$albumId"),
            fadeInDuration: const Duration(milliseconds: 250),
            fit: BoxFit.cover,
            fadeInCurve: Curves.easeIn,
            fadeOutCurve: Curves.easeOut,
            fadeOutDuration: const Duration(milliseconds: 250),
            filterQuality: FilterQuality.high,
            errorBuilder: (context, error, stackTrace) {
              List<Widget> stack = [];
              if (blurHash != null) {
                stack.add(BlurHash(
                  hash: blurHash!,
                ));
              }
              stack.add(const Icon(
                Icons.broken_image_rounded,
                size: 48,
              ));
              return Stack(
                alignment: Alignment.center,
                children: stack,
              );
            },
            image: waveclient.getAlbumCover(albumId),
            gaplessPlayback: true,
            placeholderBuilder: blurHash != null
                ? (context) {
                    return Image(
                      image: BlurHashImage(blurHash!!),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    );
                  }
                : null,
          ),
        ));
  }
}
