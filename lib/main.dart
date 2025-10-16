import 'package:flutter/material.dart';
import 'package:spotify/view/blend_screen/blend_screen.dart';
import 'package:spotify/view/choose_podcast_screen/choose_podcast.dart';
import 'package:spotify/view/dashbord/dashboard.dart';
import 'package:spotify/view/settings_screen/settings.dart';
import 'package:spotify/view/splash_screen/splash_screen.dart';
import 'package:spotify/view/whats_new_screen/whats_new.dart';

void main() {
  runApp(Spotify());
}

class Spotify extends StatelessWidget {
  const Spotify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Dashboard());
  }
}
