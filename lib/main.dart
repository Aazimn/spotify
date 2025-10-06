import 'package:flutter/material.dart';
import 'package:spotify/view/home_screen/home_screen.dart';
import 'package:spotify/view/splash_screen/splash_screen.dart';

void main() {
  runApp(Spotify());
}

class Spotify extends StatelessWidget {
  const Spotify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
