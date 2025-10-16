import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/core/constants/image_constants.dart';
import 'package:spotify/view/dashbord/dashboard.dart';
import 'package:spotify/view/sign_up_screen/sign_up.dart';
import 'package:spotify/view/start_page/start_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checklogin();
  }

  Future<void> checklogin() async {
    final pref = await SharedPreferences.getInstance();
    Future.delayed(Duration(seconds: 3), () async {
      if (await pref.getString("email") != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return Dashboard();
            },
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return StartPage();
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      body: Center(
        child: CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage(ImageConstants.logo),
        ),
      ),
    );
  }
}
