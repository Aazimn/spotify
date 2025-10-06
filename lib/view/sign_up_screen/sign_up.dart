import 'package:flutter/material.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/core/constants/image_constants.dart';
import 'package:spotify/view/email_signup_screen/email_signup.dart';
import 'package:spotify/view/log_in_screen/log_in.dart';
import 'package:spotify/view/phone_signup_screen/phone_signup.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
            customSignup(
              text: "Continue with email",
              bg: Colors.green,
              icon: Icons.email_outlined,
              textcolor: ColorConstants.black,
              bordercolor: Colors.green,
              iconcolor: ColorConstants.black,
              spacing: 50,
              screens: EmailSignup(),
            ),
            SizedBox(height: 10),
            customSignup(
              icon: Icons.phone_android_sharp,
              text: "Continue with phone number",
              textcolor: ColorConstants.white,
              bordercolor: ColorConstants.grey,
              iconcolor: ColorConstants.white,
              spacing: 30,
              screens: PhoneSignup(),
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
                "Already have an account?",
                style: TextStyle(color: ColorConstants.white),
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
              child: Text(
                "Log in",
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
