import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:song_review/models/album.dart';
import 'package:song_review/models/song.dart';

/// Catálogo local gerado a partir da [iTunes Search API](https://performance-partners.apple.com/search-api),
/// gratuita e sem chave. As capas vêm das URLs oficiais de artwork.
class Catalog {
  Catalog._();

  static List<Album> albums = const [];

  static List<Song> get songs =>
      albums.expand((album) => album.tracks).toList(growable: false);

  static Future<void> load() async {
    final raw = await rootBundle.loadString('assets/catalog.json');
    final map = jsonDecode(raw) as Map<String, dynamic>;
    final list = map['albums'] as List<dynamic>;
    albums = list
        .map((item) => Album.fromJson(item as Map<String, dynamic>))
        .toList(growable: false);
  }
}
