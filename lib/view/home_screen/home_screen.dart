import 'package:flutter/material.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/core/constants/image_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(backgroundColor: ColorConstants.black),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text(
                      "B",
                      style: TextStyle(
                        fontSize: 25,
                        color: ColorConstants.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  height: 40,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "All",
                      style: TextStyle(
                        fontSize: 17,
                        color: ColorConstants.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 80, 77, 77),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Music",
                      style: TextStyle(
                        fontSize: 17,
                        color: ColorConstants.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 80, 77, 77),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Podcasts",
                      style: TextStyle(
                        fontSize: 17,
                        color: ColorConstants.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    recentPlaylist(
                      img: AssetImage(ImageConstants.likedsong),
                      text: 'Liked Songs',
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(width: 10),
                    recentPlaylist(
                      img: AssetImage(ImageConstants.feelGood),
                      text: 'Feel good',
                      height: 60,
                      width: 60,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    recentPlaylist(
                      img: AssetImage(ImageConstants.gymMotivation),
                      text: 'GYM \nMOtivation',
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(width: 10),
                    recentPlaylist(
                      img: AssetImage(ImageConstants.tamilSongs),
                      text: 'Tamil Songs',
                      height: 60,
                      width: 60,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    recentPlaylist(
                      img: AssetImage(ImageConstants.malayalamSongs),
                      text: 'Malayalam \nSongs',
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(width: 10),
                    recentPlaylist(
                      img: AssetImage(ImageConstants.ariana),
                      text: 'Travel Songs',
                      height: 60,
                      width: 60,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    recentPlaylist(
                      img: AssetImage(ImageConstants.ariana),
                      text: 'Hindi Songs',
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(width: 10),
                    recentPlaylist(
                      img: AssetImage(ImageConstants.ariana),
                      text: 'Top Hit Songs',
                      height: 60,
                      width: 60,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container recentPlaylist({
    required AssetImage img,
    required String text,
    required double height,
    required double width,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 80, 77, 77),
      ),
      width: 170,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: Image(
              height: height,
              width: width,
              image: img,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: ColorConstants.white,
            ),
          ),
        ],
      ),
    );
  }
}
