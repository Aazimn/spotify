import 'package:flutter/material.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/core/constants/image_constants.dart';
import 'package:spotify/view/song_payer_screen/song_player.dart';

class RecentScreen extends StatefulWidget {
  const RecentScreen({super.key});

  @override
  State<RecentScreen> createState() => _RecentScreenState();
}

class _RecentScreenState extends State<RecentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: ColorConstants.white),
        ),
        centerTitle: true,
        title: Text("Recents", style: TextStyle(color: ColorConstants.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                    color: ColorConstants.search,
                    borderRadius: BorderRadius.circular(15),
                    border: BoxBorder.all(color: ColorConstants.grey),
                  ),
                  child: Center(
                    child: Text(
                      "Music",
                      style: TextStyle(
                        color: ColorConstants.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Today",
                  style: TextStyle(
                    color: ColorConstants.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SongPlayerScreen()),
                );
              },
              child: _recents(
                title: "Liked Songs",
                subtitle: "8 songs played",
                img: ImageConstants.likedsong,
                size: 95,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Yesterday",
                  style: TextStyle(
                    color: ColorConstants.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            _recents(
              title: "Perilla Rajyath",
              subtitle: "Artist",
              img: ImageConstants.perillarajyath,
              size: 80,
            ),
          ],
        ),
      ),
    );
  }
}

Row _recents({
  required String title,
  required String subtitle,
  required String img,
  required double size,
}) {
  return Row(
    children: [
      SizedBox(
        height: 80,
        width: 80,
        child: Image.asset(img, fit: BoxFit.cover),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: ColorConstants.white, fontSize: 20),
            ),
            Text(
              subtitle,
              style: TextStyle(color: ColorConstants.grey, fontSize: 15),
            ),
          ],
        ),
      ),
      SizedBox(width: size),
      Icon(Icons.arrow_circle_down, color: ColorConstants.white),
    ],
  );
}
