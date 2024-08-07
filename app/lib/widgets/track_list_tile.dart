import 'package:app/services/generated/wavenet.pb.dart';
import 'package:app/services/waveclient.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../services/audio_handler.dart';

class TrackListTile extends StatefulWidget {
  final Track track;
  final int index;

  const TrackListTile({super.key, required this.track, required this.index});

  @override
  State<TrackListTile> createState() => _TrackListTileState();
}

class _TrackListTileState extends State<TrackListTile> {
  @override
  Widget build(BuildContext context) {
    Widget leadingTitle = Text(
      "${widget.index}",
      style: Theme.of(context).textTheme.bodyLarge,
      textAlign: TextAlign.center,
    );
    WaveAudioHandler audioHandler = context.read<WaveAudioHandler>();

    if (widget.index == 2) {
      leadingTitle = Icon(MdiIcons.play, size: 18);
    }

    return ListTile(
      leading: leadingTitle,
      title: Text(
        widget.track.name,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  void onTap() {
    var waveclient = context.read<WaveClient>();
    waveclient.playTrack(widget.track.id);
  }
}
