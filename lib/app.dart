import 'package:flutter/material.dart';
import 'package:song_review/design_system/design_system.dart';
import 'package:song_review/screens/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Song Review',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.build(),
      home: const SplashPage(),
    );
  }
}
