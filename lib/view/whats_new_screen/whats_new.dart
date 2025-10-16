import 'package:flutter/material.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/core/constants/image_constants.dart';

class WhatsNew extends StatefulWidget {
  const WhatsNew({super.key});

  @override
  State<WhatsNew> createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        backgroundColor: ColorConstants.black,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            color: ColorConstants.white,
            size: 40,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What's New",
                style: TextStyle(
                  color: ColorConstants.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "The latest releases from artists,podcasts,and shows\nyou follow",
                style: TextStyle(color: ColorConstants.grey, fontSize: 13),
              ),
              SizedBox(height: 20),
              Container(
                height: 35,
                width: 70,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 80, 77, 77),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Music",
                    style: TextStyle(fontSize: 15, color: ColorConstants.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Earlier",
                style: TextStyle(
                  color: ColorConstants.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Column(
                spacing: 10,
                children: [
                  earlier(
                    days: '6 days ago',
                    song: 'Aaraadhike',
                    artist: 'Sooraj Santhosh,Madhuvanthi\nNarayanan',
                    img: ImageConstants.ambili,
                  ),
                  Divider(color: ColorConstants.signUpTextfield, thickness: 0),
                  earlier(
                    days: 'Oct 2',
                    song: 'Kai Thudithaalam',
                    artist: 'Benny Ignatius,Afsal',
                    img: ImageConstants.kalyanaRaman,
                  ),
                  Divider(color: ColorConstants.signUpTextfield, thickness: 0),
                  earlier(
                    days: 'Sep 30',
                    song: 'Unnai Kaanadhu Naan',
                    artist: 'Shanker Ehsaan Loy,Kamal Haasan',
                    img: ImageConstants.vishwaroopam,
                  ),
                  Divider(color: ColorConstants.signUpTextfield, thickness: 0),
                  earlier(
                    days: 'Sep 30',
                    song: 'Pranayanila',
                    artist: 'Deepak Dev,Shaan Rahman',
                    img: ImageConstants.tejaBhai,
                  ),
                  Divider(color: ColorConstants.signUpTextfield, thickness: 0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row earlier({
    required String days,
    required String song,
    required String artist,
    required String img,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Single",
              style: TextStyle(color: ColorConstants.grey, fontSize: 13),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Icon(
                  Icons.add_circle_outline,
                  color: ColorConstants.grey,
                  size: 30,
                ),
                SizedBox(width: 35),
                Icon(Icons.more_horiz, color: ColorConstants.grey, size: 30),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                days,
                style: TextStyle(color: ColorConstants.grey, fontSize: 13),
              ),
              Text(
                song,
                style: TextStyle(color: ColorConstants.white, fontSize: 19),
              ),
              Text(
                artist,
                style: TextStyle(color: ColorConstants.grey, fontSize: 14),
              ),
              SizedBox(height: 35),
              Row(
                children: [
                  SizedBox(width: 190),
                  Icon(
                    Icons.play_circle,
                    color: ColorConstants.white,
                    size: 40,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
