import 'package:song_review/models/song.dart';

class Album {
  const Album({
    required this.id,
    required this.title,
    required this.artist,
    required this.year,
    required this.genre,
    required this.rating,
    required this.coverColor,
    required this.tracks,
    this.tagline = '',
  });

  final String id;
  final String title;
  final String artist;
  final int year;
  final String genre;
  final double rating;
  final int coverColor;
  final List<Song> tracks;
  final String tagline;
}
