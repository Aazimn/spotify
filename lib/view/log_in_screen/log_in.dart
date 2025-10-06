import 'package:flutter/material.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/core/constants/image_constants.dart';
import 'package:spotify/view/email_login_screen/email_login.dart';
import 'package:spotify/view/phone_login_screen/phone_login.dart';
import 'package:spotify/view/sign_up_screen/sign_up.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: ColorConstants.black,
              child: Image(image: AssetImage(ImageConstants.logoWhite)),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                "Log in to Spotify",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: ColorConstants.white,
                ),
              ),
            ),
            SizedBox(height: 150),
            customSignup(
              text: "Continue with email",
              bg: Colors.green,
              icon: Icons.email_outlined,
              textcolor: ColorConstants.black,
              bordercolor: Colors.green,
              iconcolor: ColorConstants.black,
              spacing: 50,
              screens: EmailLogin(),
            ),
            SizedBox(height: 10),
            customSignup(
              icon: Icons.phone_android_sharp,
              text: "Continue with phone number",
              textcolor: ColorConstants.white,
              bordercolor: ColorConstants.grey,
              iconcolor: ColorConstants.white,
              spacing: 30,
              screens: PhoneLogin(),
            ),
            SizedBox(height: 10),
            Container(
              height: 49,
              width: 337,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                border: BoxBorder.all(color: ColorConstants.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  spacing: 50,
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage(ImageConstants.google),
                      backgroundColor: Colors.transparent,
                    ),
                    Text(
                      "Continue with Google",
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorConstants.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                "Don't have an account?",
                style: TextStyle(color: ColorConstants.white),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              child: Text(
                "Sign up",
                style: TextStyle(color: ColorConstants.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customSignup({
    Color? bg,
    required IconData icon,
    required String text,
    required Color textcolor,
    required Color bordercolor,
    required Color iconcolor,
    required double spacing,
    required Widget screens,
  }) {
    return InkWell(
      child: Container(
        height: 49,
        width: 337,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(45),
          border: BoxBorder.all(color: bordercolor),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            spacing: spacing,
            children: [
              Icon(icon, color: iconcolor),
              Text(text, style: TextStyle(fontSize: 16, color: textcolor)),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screens),
        );
      },
    );
  }
}
