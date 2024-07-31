class WaveArtist {
  final int id;
  final String name;

  WaveArtist({required this.id, required this.name});
}

class WaveAlbum {
  final int id;
  final String name;
  final List<WaveArtist> artist;

  WaveAlbum({required this.id, required this.name, required this.artist});
}

class WaveTrack {
  final int id;
  final String name;
  final int length;
  final WaveAlbum album;

  WaveTrack( {required this.id,required this.length, required this.name, required this.album});

}

class WavePlaylist {
  final int id;
  final String title;
  final String description;
  final String coverSource;
  final DateTime createdAt;

  WavePlaylist({required this.id, required this.title, required this.description, required this.coverSource, required this.createdAt}){

  }
}
