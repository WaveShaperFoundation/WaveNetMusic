import 'package:app/pages/album_page.dart';
import 'package:app/services/waveclient.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

import '../services/generated/wavenet.pb.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
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
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 1,
        ),
        children: [
          ...albums.map((album) {
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
              child: Hero(
                key: Key("album-${album.id}"),
                tag: "album-${album.id}",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: OctoImage(
                    fadeInDuration: Duration(milliseconds: 250),
                    fit: BoxFit.cover,
                    fadeInCurve: Curves.easeIn,
                    fadeOutCurve: Curves.easeOut,
                    fadeOutDuration: Duration(milliseconds: 550),
                    errorBuilder: (context, error, stackTrace) {
                      return Image(
                        key: Key("album-${album.id}"),
                        image: BlurHashImage(album.blurhash),
                        fit: BoxFit.cover,
                      );
                    },
                    image: CachedNetworkImageProvider(

                        cacheKey: album.id.toString(),
                        "http://192.168.0.50:3000/cover?id=${album.id}"),
                    placeholderBuilder: (context) {
                      return Image(
                        key: Key("album-${album.id}"),
                        image: BlurHashImage(album.blurhash),
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );

    return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (context, index) {
        var album = albums[index];
        return ListTile(
          title: Hero(
            tag: "album-${album.id}",
            child: Text(album.name),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return AlbumDetailPage(albumId: album.id);
              },
            ));
          },
        );
      },
    );
  }
}
