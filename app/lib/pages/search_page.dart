import "dart:async";

import "package:app/services/generated/wavenet.pb.dart";
import "package:audio_service/audio_service.dart";
import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:octo_image/octo_image.dart";
import "package:provider/provider.dart";

import "../services/audio_handler.dart";
import "../services/waveclient.dart";

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List<Track> tracks = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: debouncedSearch,
            decoration: InputDecoration(
              hintText: "Search WaveNet library",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        ...tracks.map((track) {
          print(track.artists);
          return ListTile(
            leading: OctoImage(
              image: CachedNetworkImageProvider("http://192.168.0.50:3000/cover?id=${track.album.id}"),
            ),
            title: Text(track.name),
            subtitle: Text(track.artists.map((e)=>e.name).join(", ")),
            onTap: () {
              var waveClient = context.read<WaveClient>();
              var request = GetTrackRequest(id: track.id);
              waveClient.libraryClient.getTrack(request).then((Track track) {
                String url = "http://192.168.0.50:3000/song?id=${track.id}";
                var waveAudioHandler = context.read<WaveAudioHandler>();
                waveAudioHandler.playMediaItem(MediaItem(
                  id: url,
                  title: track.name,
                  genre: "Dubstep",
                  artist: track.album?.artists.first.name ?? "No artist name found",
                  duration: Duration(seconds: track.length),
                  album: track.album.name,
                  artUri: Uri.parse(
                      "http://192.168.0.50:3000/cover?id=${track.album.id}"),
                ));

                waveAudioHandler.play();
              }).catchError((error) {
                print(error);
              });
            },
          );
        }),
      ]
    );
  }

  Timer? _debounce;
  void debouncedSearch(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1), () {
      var waveClient = context.read<WaveClient>();
      var request = SearchQueryRequest(query: query);
      waveClient.libraryClient.searchQuery(request).then((result) {
        setState(() {
          this.tracks.clear();
          this.tracks.addAll(result.tracks);
        });
      }).catchError((error) {
        print(error);
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
