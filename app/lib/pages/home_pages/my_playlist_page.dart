import 'package:app/models/library_models.dart';
import 'package:app/pages/playlist_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/waveclient.dart';

class MyPlaylistPage extends StatefulWidget {
  const MyPlaylistPage({super.key});

  @override
  State<MyPlaylistPage> createState() => _MyPlaylistPageState();
}

class _MyPlaylistPageState extends State<MyPlaylistPage> {

  List<WavePlaylist> _playlists = [];

  @override
  void initState() {
    var waveclient = context.read<WaveClient>();
    waveclient.getMyPlaylists().then((value) {
      setState(() {
        _playlists = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _playlists.map((e) {
        return ListTile(
          title: Text(e.title),
          subtitle: e.description.isNotEmpty?Text(e.description):null,
          leading: const Icon(Icons.playlist_play_rounded),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PlaylistDetailPage(playlistId: e.id, playlistTitle: e.title, playlistDescription: e.description);
            },));
          }
        );
      },).toList(),
    );
  }
}
