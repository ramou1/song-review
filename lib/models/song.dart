class Song {
  const Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.year,
    required this.genre,
    required this.rating,
    required this.coverColor,
  });

  final String id;
  final String title;
  final String artist;
  final String album;
  final int year;
  final String genre;
  final double rating;
  final int coverColor;
}
