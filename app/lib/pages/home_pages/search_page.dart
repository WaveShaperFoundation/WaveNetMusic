import "dart:async";

import "package:app/models/database/app_database.dart";
import "package:app/services/generated/wavenet.pb.dart";
import "package:app/widgets/album_song_tile.dart";
import "package:audio_service/audio_service.dart";
import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:octo_image/octo_image.dart";
import "package:provider/provider.dart";

import "../../services/audio_handler.dart";
import "../../services/waveclient.dart";

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Track> tracks = [];
  List<Widget> historyWidgets = [];

  @override
  void initState() {
    super.initState();
    buildSearchHistory().then((value) {
      setState(() {
        historyWidgets = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> showWidgets = [];
    if (_searchController.text.isEmpty) {
      showWidgets = historyWidgets;
    } else {
      showWidgets = tracks.map((track) {
        print(track.artists);
        return SingleSongTile(
          songId: track.id,
          trackNumber: 0,
          songName: track.name,
          length: Duration(seconds: track.length),
          track: track,
          showAlbum: true,
          onTap: () {
            addToSearchHistory(track.id);
          },
        );
      }).toList();
    }

    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: debouncedSearch,
          controller: _searchController,
          decoration: InputDecoration(
            hintText: "Search WaveNet library",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      ...showWidgets,
    ]);
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

  void addToSearchHistory(int id) async {
    var appDatabase = context.read<AppDatabase>();
    var newId = await appDatabase.into(appDatabase.searchHistoryEntry).insert(
          SearchHistoryEntryCompanion.insert(
            entryId: id,
            type: SearchHistory.TRACK,
            query: _searchController.text,
            timestamp: DateTime.now(),
          ),
        );
    print(newId);
  }

  Future<List<Widget>> buildSearchHistory() async {
    var appDatabase = context.read<AppDatabase>();
    var data = await appDatabase.select(appDatabase.searchHistoryEntry).get();
    data.sort((a, b) {
      return a.timestamp.compareTo(b.timestamp);
    });
    return data.where((element) {
      return element.type == SearchHistory.TRACK;
    }).map((e) {
      return FutureBuilder<Track>(
        future: context.read<WaveClient>().getTrack(e.entryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text("Error loading track");
          }
          return SingleSongTile(
              songId: e.entryId,
              trackNumber: e.entryId,
              songName: snapshot.data!.name,
              length: Duration(seconds: snapshot.data!.length),
              track: snapshot.data!!,
              showAlbum: true);
        },
      );
    }).toList();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
