import 'package:app/services/waveclient.dart';
import 'package:app/widgets/album_song_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

import '../services/generated/wavenet.pb.dart';

class PlaylistDetailPage extends StatefulWidget {
  final int playlistId;
  final String? playlistTitle;
  final String? playlistDescription;

  const PlaylistDetailPage(
      {super.key,
      required this.playlistId,
      this.playlistTitle,
      this.playlistDescription});

  @override
  State<PlaylistDetailPage> createState() => _PlaylistDetailPageState();
}

class _PlaylistDetailPageState extends State<PlaylistDetailPage> {
  String? _playlistTitle = "";
  String? _playlistDescription = "";
  List<PlaylistTrack> _playlistTracks = [];

  @override
  void initState() {
    super.initState();
    _playlistTitle = widget.playlistTitle;
    _playlistDescription = widget.playlistDescription;
    var waveclient = context.read<WaveClient>();
    waveclient.getPlaylistDetails(widget.playlistId).then((value) {
      setState(() {
        _playlistTitle = value.title;
        _playlistDescription = value.description;
        _playlistTracks.addAll(value.tracks);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.playlistTitle ?? "Playlist"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.playlist_add_rounded),
      ),
      body: ListView(
        children: [
          ..._playlistTracks.map(
            (e) {
              return SingleSongTile(
                  songId: e.track.id,
                  trackNumber: e.position,
                  songName: e.track.name,
                  showAlbum: true,
                  length: Duration(seconds: e.track.length),
                  track: e.track);
              return ListTile(
                title: Text(e.track.name),
                subtitle: Text(e.track.artists.join(",")),
                leading: OctoImage(
                  image: context
                      .read<WaveClient>()
                      .getAlbumCoverByTrack(e.track.album.id),
                  placeholderBuilder: (context) {
                    return Image(
                      image: BlurHashImage(
                        e.track.album.blurhash ?? "",
                      ),
                      fit: BoxFit.cover,
                    );
                  },
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}
