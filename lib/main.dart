import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/view/global_classes/audio_controller.dart';
import 'package:spotify/view/splash_screen/splash_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AudioController(),
      child: const Spotify(),
    ),
  );
}

class Spotify extends StatelessWidget {
  const Spotify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
