import 'package:song_review/models/song.dart';

class Album {
  const Album({
    required this.id,
    required this.title,
    required this.artist,
    required this.year,
    required this.genre,
    required this.rating,
    required this.artworkUrl,
    required this.tracks,
  });

  final String id;
  final String title;
  final String artist;
  final int year;
  final String genre;
  final double rating;
  final String artworkUrl;
  final List<Song> tracks;

  factory Album.fromJson(Map<String, dynamic> json) {
    final tracks = (json['tracks'] as List<dynamic>)
        .map((item) => Song.fromJson(item as Map<String, dynamic>))
        .toList();

    return Album(
      id: json['id'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String,
      year: json['year'] as int,
      genre: json['genre'] as String? ?? '',
      rating: (json['rating'] as num).toDouble(),
      artworkUrl: json['artworkUrl'] as String? ?? '',
      tracks: tracks,
    );
  }
}
