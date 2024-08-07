import 'package:app/services/audio_handler.dart';
import 'package:app/services/waveclient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../services/generated/wavenet.pb.dart';

class SingleSongTile extends StatefulWidget {
  final int songId;
  final int trackNumber;
  final String songName;
  final Duration length;
  final VoidCallback? onTap;

  final Track track;

  final bool showAlbum;

  const SingleSongTile(
      {super.key,
      required this.songId,
      required this.trackNumber,
      required this.songName,
      required this.length,
      required this.track,
      this.showAlbum = false,
      this.onTap});

  @override
  State<SingleSongTile> createState() => _SingleSongTileState();
}

class _SingleSongTileState extends State<SingleSongTile> {
  //Temporary artist string fetching
  String artistString = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var waveClient = context.read<WaveClient>().getTrack(widget.track.id).then(
      (value) {
        if (mounted) {
          setState(() {
            artistString = value.artists.map((e) => e.name).join(", ");
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var waveClient = context.read<WaveClient>();

    var leading;
    if (widget.showAlbum) {
      leading = OctoImage(
        height: 50,
        width: 50,
        image: waveClient.getAlbumCover(widget.track.album.id),
        placeholderBuilder: (context) {
          return BlurHash(hash: widget.track.album.blurhash);
        },
        errorBuilder: (context, error, stackTrace) {
          print("Error loading album cover: ${widget.track.album.name}");
          return const Icon(Icons.error);
        },
      );
    } else {
      leading = Text(
        widget.trackNumber.toString(),
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      );
    }

    return ListenableBuilder(
      listenable: waveClient.audioHandler!!,
      builder: (context, child) {
        return Slidable(
          startActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                autoClose: true,
                onPressed: (context) {
                  waveClient.addTrackToQueue(widget.songId);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Added ${widget.songName} to queue"),
                  ));
                },
                icon: Icons.add,
                label: "Add to queue",
              ),
            ],
          ),
          key: ValueKey("song-${widget.songId}"),
          child: ListTile(
            onLongPress: () {
              waveClient.addTrackToQueue(widget.songId);
            },
            onTap: () {
              waveClient.playTrack(widget.songId);
              widget.onTap?.call();
            },
            title: Text(
              widget.songName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: artistString.isNotEmpty ? 1 : 0,
              child: Text(
                key: ValueKey("artist-$artistString"),
                artistString,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            leading: leading,
            trailing:
                (waveClient.audioHandler!!).currentPlayingId == widget.songId
                    ? const Icon(Icons.play_arrow_rounded)
                    : null,
          ),
        );
      },
    );
  }
}
