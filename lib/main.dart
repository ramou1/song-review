import 'package:flutter/material.dart';
import 'package:song_review/app.dart';
import 'package:song_review/data/catalog.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Catalog.load();
  runApp(const App());
}
