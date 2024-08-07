import 'package:app/services/waveclient.dart';
import 'package:app/widgets/album_cover_card.dart';
import 'package:app/widgets/album_song_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../services/audio_handler.dart';
import '../services/generated/wavenet.pb.dart';

class SidePanel extends StatefulWidget {
  const SidePanel({super.key});

  @override
  State<SidePanel> createState() => _SidePanelState();
}

class _SidePanelState extends State<SidePanel> {
  @override
  Widget build(BuildContext context) {
    var waveclient = context.read<WaveClient>();
    var waveAudioHandle = waveclient.audioHandler;
    var queueStream = waveAudioHandle?.queue;
    return StreamBuilder(
      stream: queueStream,
      initialData: queueStream?.value,
      builder: (context, snapshotMediaItem) {
        return ListView(
          children: snapshotMediaItem.data!.map((mediaItem) {
              return FutureBuilder<Track>(
                future: waveclient.getTrack(int.parse(mediaItem.id)),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const ListTile(
                      title: Text("Loading..."),
                    );
                  }
                  return SingleSongTile(
                    songId: int.parse(mediaItem.id),
                    trackNumber: int.parse(mediaItem.id),
                    songName: mediaItem.title,
                    length: mediaItem.duration!,
                    showAlbum: true,
                    track: snapshot.data!,
                    onTap: () {
                      waveAudioHandle?.skipToQueueItem(snapshotMediaItem.data!.indexOf(mediaItem));
                    },
                  );
                },
              );
            },
          ).toList(),
        );
      },
    );
  }
}
