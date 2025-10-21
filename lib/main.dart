import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/view/a.dart';
import 'package:spotify/view/blend_screen/blend_screen.dart';
import 'package:spotify/view/choose_podcast_screen/choose_podcast.dart';
import 'package:spotify/view/dashbord/dashboard.dart';
import 'package:spotify/view/global_widgets/audio_controller.dart';
import 'package:spotify/view/home_screen/home_screen.dart';
import 'package:spotify/view/library_screen/library_screen.dart';
import 'package:spotify/view/name_create_screen/name_create.dart';
import 'package:spotify/view/otp_screen/otp_screen.dart';
import 'package:spotify/view/phone_login_screen/phone_login.dart';
import 'package:spotify/view/podcasts_screen/podcasts.dart';
import 'package:spotify/view/search_screen/search_screen.dart';
import 'package:spotify/view/settings_screen/settings.dart';
import 'package:spotify/view/songs_screen/songs_screen.dart';
import 'package:spotify/view/splash_screen/splash_screen.dart';
import 'package:spotify/view/start_page/start_page.dart';
import 'package:spotify/view/whats_new_screen/whats_new.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AudioController(),
      child: const Spotify(),
    ),
  );
}

// void main() {
//   runApp(Spotify());
// }

class Spotify extends StatelessWidget {
  const Spotify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
