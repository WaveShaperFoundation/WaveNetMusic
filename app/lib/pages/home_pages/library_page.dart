import 'package:app/pages/album_page.dart';
import 'package:app/services/waveclient.dart';
import 'package:app/widgets/album_cover_card.dart';
import 'package:app/widgets/album_cover_title_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import '../../services/generated/wavenet.pb.dart';

enum LibraryViewType { Cover, DenseCover, Lists }

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with AutomaticKeepAliveClientMixin {
  List<Album> albums = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<WaveClient>()
        .libraryClient
        .getAlbums(Empty())
        .then((albums) => {
              setState(() {
                this.albums.clear();
                this.albums.addAll(albums.albums);
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.custom(
          cacheExtent: 99999999,
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              crossAxisSpacing: 10,
              childAspectRatio: 0.8),
          childrenDelegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              if (constraints.minWidth > 600) {
                return AnimationConfiguration.staggeredGrid(
                  columnCount: 5,
                  position: index,
                  child: buildAlbumCard(context, index),
                );
              } else {
                return AnimationConfiguration.staggeredGrid(
                  columnCount: 2,
                  position: index,
                  child: buildAlbumCard(context, index),
                );
              }
            },
            childCount: albums.length,
          ),
        );
      },
    );
  }

  Widget buildAlbumCard(BuildContext context, int index) {
    var album = albums[index];
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return AlbumDetailPage(albumId: albums[index].id);
          },
        ));
      },
      child: FadeInAnimation(
        key: ValueKey("album-faded-${albums[index].id}"),
        curve: Curves.easeInOutCubicEmphasized,
        duration: const Duration(milliseconds: 900),
        child: SlideAnimation(
          key: ValueKey("album-slided-${albums[index].id}"),
          verticalOffset: 5.0,
          child: AlbumCoverTitlePreview(
            key: ValueKey("album-preview-${album.id}"),
            albumId: album.id,
            title: album.name,
            blurHash: album.blurhash,
          ),
        ),
      ),
    );
  }

  List<Widget> buildAlbumWidgets() {
    return albums.map((album) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return AlbumDetailPage(
                albumId: album.id,
                albumName: album.name,
                blurhash: album.blurhash,
              );
            },
          ));
        },
        child: AnimationConfiguration.staggeredGrid(
          columnCount: 6,
          position: albums.indexOf(album),
          child: FadeInAnimation(
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 300),
            child: SlideAnimation(
              verticalOffset: 5.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AlbumCoverCard(
                    key: ValueKey("album-imaged-${album.id}"),
                    albumId: album.id,
                    blurHash: album.blurhash,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      album.name,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
