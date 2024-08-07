import 'package:app/widgets/album_cover_card.dart';
import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

class AlbumCoverTitlePreview extends StatelessWidget {
  final int albumId;
  final String? blurHash;
  final String title;

  const AlbumCoverTitlePreview(
      {super.key, required this.albumId, this.blurHash, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: AlbumCoverCard(
              albumId: albumId,
              blurHash: blurHash,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: TextScroll(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            intervalSpaces: 50,
            velocity: Velocity(pixelsPerSecond: Offset(40, 50)),
            fadedBorderWidth: 0.05,
            fadeBorderVisibility: FadeBorderVisibility.auto,
            fadedBorder: true,
            fadeBorderSide: FadeBorderSide.both,
            textAlign: TextAlign.center,
            mode: TextScrollMode.endless,
          ),
        )
      ],
    );
  }
}
