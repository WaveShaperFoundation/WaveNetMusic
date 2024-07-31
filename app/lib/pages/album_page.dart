import 'package:app/services/audio_handler.dart';
import 'package:app/services/generated/wavenet.pb.dart';
import 'package:app/services/waveclient.dart';
import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class AlbumDetailPage extends StatefulWidget {
  final int albumId;
  final String? albumName;
  final String? blurhash;

  const AlbumDetailPage({super.key, required this.albumId, this.albumName, this.blurhash});

  @override
  State<AlbumDetailPage> createState() => _AlbumDetailPageState();
}

class _AlbumDetailPageState extends State<AlbumDetailPage> {
  List<Track> tracks = [];
  AlbumDetails? album;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var request = GetAlbumRequest(id: widget.albumId);
    context
        .read<WaveClient>()
        .libraryClient
        .getAlbum(request)
        .then((albumResult) {
      setState(() {
        this.album = albumResult;
      });
    });
    context
        .read<WaveClient>()
        .libraryClient
        .getAlbumTracks(request)
        .then((tracksResult) {
      setState(() {
        this.tracks.clear();
        this.tracks.addAll(tracksResult.tracks);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var albumName = widget.albumName ?? "Album Name";
    if (album != null) {
      albumName = album!.name;
    }
    print("http://192.168.0.50:3000/cover?id=${widget.albumId}");
    return Scaffold(
      appBar: AppBar(
        title: Text(albumName),
        centerTitle: true,
        elevation: 5,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.play_arrow),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: AspectRatio(
              aspectRatio: 1,
              child: Card(
                elevation: 10,
                child: Hero(
                  tag: "album-${widget.albumId}",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: OctoImage(
                      fadeInDuration: Duration(milliseconds: 250),
                      fit: BoxFit.cover,
                      fadeInCurve: Curves.easeIn,
                      fadeOutCurve: Curves.easeOut,
                      fadeOutDuration: Duration(milliseconds: 550),
                      errorBuilder: (context, error, stackTrace) {
                        return Image(
                          key: Key("album-${widget.albumId}"),
                          image: BlurHashImage(album!.blurhash),
                          fit: BoxFit.cover,
                        );
                      },
                      image: CachedNetworkImageProvider(
                          cacheKey: album?.id.toString(),
                          "http://192.168.0.50:3000/cover?id=${widget.albumId}"),
                      placeholderBuilder: (context) {
                        return Image(
                          key: Key("album-${widget.albumId}"),
                          image: BlurHashImage(widget.blurhash!),
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          ...buildTrackTiles()
        ],
      ),
    );
  }

  List<Widget> buildTrackTiles() {
    int index = 1;
    return tracks.map<Widget>((e) {
      Duration duration = Duration(seconds: e.length);
      //return TrackListTile(track: e, index: index++,);
      return ListTile(
        title: Text(
          "$index. ${e.name}",
          style: TextStyle(fontSize: 18),
        ),
        onTap: () {
          int trackId = e.id;
          String url = "http://192.168.0.50:3000/song?id=$trackId";
          print("Albumname is " + e.album.name);

          var waveAudioHandler = context.read<WaveAudioHandler>();
          waveAudioHandler.playMediaItem(MediaItem(
            id: url,
            title: e.name,
            genre: "Dubstep",
            artist: album?.artists.first.name ?? "No artist name found",
            duration: Duration(seconds: e.length),
            album: widget.albumName,
            artUri: Uri.parse(
                "http://192.168.0.50:3000/cover?id=${widget.albumId}"),
          ));

          waveAudioHandler.play();
        },
        trailing: Text(
          "${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ),
      );
    }).toList();
  }
}
