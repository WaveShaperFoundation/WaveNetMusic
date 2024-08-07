import 'package:app/services/generated/wavenet.pb.dart';
import 'package:app/services/waveclient.dart';
import 'package:app/widgets/album_cover_card.dart';
import 'package:app/widgets/album_song_tile.dart';
import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class AlbumDetailPage extends StatefulWidget {
  final int albumId;
  final String? albumName;
  final String? blurhash;

  const AlbumDetailPage(
      {super.key, required this.albumId, this.albumName, this.blurhash});

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
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return buildDesktop();
        } else {
          return buildMobile();
        }
      },
    );
  }

  Widget buildDesktop() {
    var waveclient = context.read<WaveClient>();
    var albumName = widget.albumName ?? "Album Name";
    if (album != null) {
      albumName = album!.name;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Album Name"),
        centerTitle: true,
        elevation: 5,
      ),
      body: ListView.custom(
        childrenDelegate: SliverChildListDelegate(
          [
            SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 48.0),
                  child: SizedBox(
                    width: 300,
                    child: AlbumCoverCard(
                      albumId: widget.albumId,
                      blurHash: widget.blurhash,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedOpacity(
                          curve: Curves.easeInOutCubicEmphasized,
                          opacity: album?.artists != null ? 1 : 0,
                          duration: Duration(milliseconds: 400),
                          child: Text(
                            albumName,
                            style: TextStyle(
                                fontSize: 64, fontWeight: FontWeight.w500),
                          )),
                      AnimatedOpacity(
                          curve: Curves.easeInOutCubicEmphasized,
                          opacity: album?.artists != null ? 1 : 0,
                          duration: Duration(milliseconds: 700),
                          child: Text(
                            album?.artists != null
                                ? (album!.artists.map((e) => e.name).join(", "))
                                : "loading",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w500),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            ...buildSongTileList()
          ],
        ),
      ),
    );
  }

  List<Widget> buildSongTileList() {
    var waveclient = context.read<WaveClient>();
    var index = -1;
    return tracks.map<Widget>((track) {
      index++;
      return AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 375),
        child: FadeInAnimation(
          curve: Curves.easeInOutCubicEmphasized,
          duration: const Duration(milliseconds: 375),
          child: SlideAnimation(
            curve: Curves.easeInOutCubicEmphasized,
            duration: Durations.medium3,
            verticalOffset: 5,
            child: SingleSongTile(
              key: Key("track-${track.id}"),
              track: track,
              songId: track.id,
              trackNumber: index + 1,
              songName: track.name,
              length: Duration(seconds: track.length),
              onTap: () {
                waveclient.playTrack(track.id);
              },
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget buildMobile() {
    var albumName = widget.albumName ?? "";
    if (album != null) {
      albumName = album!.name;
    }
    print("Albu,m name is now " + albumName);
    var waveclient = context.read<WaveClient>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          albumName,
          key: ValueKey(albumName),
        ),
        centerTitle: true,
        elevation: 5,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
                borderOnForeground: true,
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
                        return Icon(Icons.error);
                      },
                      image: waveclient.getAlbumCover(widget.albumId),
                      placeholderBuilder: widget.blurhash != null
                          ? (context) {
                              return Image(
                                key: Key("album-${widget.albumId}"),
                                image: BlurHashImage(widget.blurhash!),
                                fit: BoxFit.fill,
                              );
                            }
                          : null,
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
    var waveclient = context.read<WaveClient>();
    return tracks.map<Widget>((e) {
      Duration duration = Duration(seconds: e.length);
      //return TrackListTile(track: e, index: index++,);

      return SingleSongTile(
          key: Key("track-${e.id}"),
          songId: e.id,
          trackNumber: index++,
          songName: e.name,
          length: Duration(seconds: e.length),
          track: e,
          onTap: () {
            waveclient.playTrack(e.id);
          });
    }).toList();
  }
}
