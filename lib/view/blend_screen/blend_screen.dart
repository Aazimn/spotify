import 'package:flutter/material.dart';
import 'package:spotify/core/constants/color_constants.dart';

class BlendScreen extends StatelessWidget {
  const BlendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        backgroundColor: ColorConstants.signUpTextfield,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            color: ColorConstants.white,
            size: 30,
          ),
        ),
        title: Text(
          "Create a Blend",
          style: TextStyle(
            color: ColorConstants.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          children: [
            SizedBox(height: 80),
            Stack(
              alignment: Alignment.topRight,
              children: [
                SizedBox(width: 160),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 101, 100, 100),
                    borderRadius: BorderRadius.circular(75),
                  ),
                  child: Center(
                    child: Icon(Icons.add, color: Colors.white, size: 60),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Colors.black, width: 4),
                        color: const Color.fromARGB(255, 101, 100, 100),
                        borderRadius: BorderRadius.circular(85),
                      ),
                      child: Center(
                        child: Text(
                          "A",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Invite friends",
              style: TextStyle(
                color: ColorConstants.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "to Blend",
              style: TextStyle(
                color: ColorConstants.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Invite up to 10 friends to a Blend, a shared playlist\nthat gives you social recommendations based on",
              style: TextStyle(
                color: ColorConstants.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "all of your music tastes.",
              style: TextStyle(
                color: ColorConstants.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                "Note: People in this Blend will be able to add their friends. We may also create other playlists that include social recommendations. People in social recommendations playlists will be able to see your profile picture and username. Learn more about these playlists and information they include",
                style: TextStyle(
                  color: ColorConstants.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40),
            Container(
              height: 45,
              width: 110,
              decoration: BoxDecoration(
                color: ColorConstants.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  "Invite",
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorConstants.black,
                    fontWeight: FontWeight.w700,
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
