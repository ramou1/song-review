class Song {
  const Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.year,
    required this.genre,
    required this.rating,
    required this.artworkUrl,
    this.trackNumber = 1,
  });

  final String id;
  final String title;
  final String artist;
  final String album;
  final int year;
  final String genre;
  final double rating;
  final String artworkUrl;
  final int trackNumber;

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String,
      album: json['album'] as String,
      year: json['year'] as int,
      genre: json['genre'] as String? ?? '',
      rating: (json['rating'] as num).toDouble(),
      artworkUrl: json['artworkUrl'] as String? ?? '',
      trackNumber: json['trackNumber'] as int? ?? 1,
    );
  }
}
