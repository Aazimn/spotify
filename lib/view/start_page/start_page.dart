import 'package:flutter/material.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/core/constants/image_constants.dart';
import 'package:spotify/view/log_in_screen/log_in.dart';
import 'package:spotify/view/sign_up_screen/sign_up.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              backgroundColor: ColorConstants.black,
              child: Image(image: AssetImage(ImageConstants.logoWhite)),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                "Millions on Songs.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: ColorConstants.white,
                ),
              ),
            ),
            Center(
              child: Text(
                "Free on Spotify.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: ColorConstants.white,
                ),
              ),
            ),
            SizedBox(height: 200),
            Container(
              height: 49,
              width: 337,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(45),
              ),
              child: Center(
                child: InkWell(
                  child: Text(
                    "Sign up for free",
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorConstants.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogIn()),
                );
              },
              child: Container(
                height: 49,
                width: 337,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  border: BoxBorder.all(color: ColorConstants.grey),
                ),
                child: Center(
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
