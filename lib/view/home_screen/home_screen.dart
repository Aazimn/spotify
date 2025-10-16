import 'package:flutter/material.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/core/constants/image_constants.dart';
import 'package:spotify/view/profile_drawer/p_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "";
  final GlobalKey<ScaffoldState> drawerkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double playlistBoxHeight = size.height * 0.07;
    final double playlistBoxWidth = size.width * 0.43;
    return Scaffold(
      key: drawerkey,
      drawer: ProfilrDrawer(drawerkey: drawerkey),
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.black,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  drawerkey.currentState?.openDrawer();
                },
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: ColorConstants.pink,
                  child: Text(
                    "A",
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorConstants.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: size.width * 0.04),
              _categoryChip("All", 50),
              SizedBox(width: size.width * 0.03),
              _categoryChip("Music", 70),
              SizedBox(width: size.width * 0.03),
              _categoryChip("Padcastss", 90),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      recentPlaylist(
                        img: AssetImage(ImageConstants.likedsong),
                        text: 'Liked Songs',
                        height: playlistBoxHeight,
                        width: playlistBoxWidth,
                      ),
                      SizedBox(width: 10),
                      recentPlaylist(
                        img: AssetImage(ImageConstants.feelGood),
                        text: 'Feel good',
                        height: playlistBoxHeight,
                        width: playlistBoxWidth,
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
                        height: playlistBoxHeight,
                        width: playlistBoxWidth,
                      ),
                      SizedBox(width: 10),
                      recentPlaylist(
                        img: AssetImage(ImageConstants.tamilSongs),
                        text: 'Tamil Songs',
                        height: playlistBoxHeight,
                        width: playlistBoxWidth,
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
                        height: playlistBoxHeight,
                        width: playlistBoxWidth,
                      ),
                      SizedBox(width: 10),
                      recentPlaylist(
                        img: AssetImage(ImageConstants.travelSongs),
                        text: 'Travel Songs',
                        height: playlistBoxHeight,
                        width: playlistBoxWidth,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      recentPlaylist(
                        img: AssetImage(ImageConstants.hindiSongs),
                        text: 'Hindi Songs',
                        height: playlistBoxHeight,
                        width: playlistBoxWidth,
                      ),
                      SizedBox(width: 10),
                      recentPlaylist(
                        img: AssetImage(ImageConstants.topHitSongs),
                        text: 'Top Hit Songs',
                        height: playlistBoxHeight,
                        width: playlistBoxWidth,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Your top mixes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _topmixes(
                      img: AssetImage(ImageConstants.dabzeeTopMixes),
                      text: "Dabzee, NirajMadhav\nAnd more ",
                    ),
                    _topmixes(
                      img: AssetImage(ImageConstants.govindhTopMixes),
                      text: "Govind Vasantha,\nKaliash Kher",
                    ),
                    _topmixes(
                      img: AssetImage(ImageConstants.rajatTopMixes),
                      text: 'Najim Arshad and \nOuseppachan',
                    ),

                    _topmixes(
                      img: AssetImage(ImageConstants.ravalTopMixes),
                      text: "Darshan Raval,A.r.\nRahman",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Albums Featuring songs you like",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _Albumfeatures(
                      img: AssetImage(ImageConstants.kalyanaRaman),
                      text: "kalyana Raman",
                      subtext: 'Berny-Ignatius',
                    ),
                    _Albumfeatures(
                      img: AssetImage(ImageConstants.ambili),
                      text: "Ambili",
                      subtext: 'Vishnu Vijay',
                    ),
                    _Albumfeatures(
                      img: AssetImage(ImageConstants.tejaBhai),
                      text: 'Teja Bhai and Family',
                      subtext: 'Abu Murali',
                    ),

                    _Albumfeatures(
                      img: AssetImage(ImageConstants.vishwaroopam),
                      text: "Vishwaroopam",
                      subtext: 'Shanker-Ehsaan',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Recents",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _recent(
                      img: AssetImage(ImageConstants.likedsong),
                      text: "Liked Songs",
                      subtext: 'Playlist',
                    ),
                    _recent(
                      img: AssetImage(ImageConstants.feelGood),
                      text: "Feel good",
                      subtext: 'Playlist - Mithun',
                    ),
                    _recent(
                      img: AssetImage(ImageConstants.gymMotivation),
                      text: 'Gym Motivation',
                      subtext: 'Album',
                    ),

                    _recent(
                      img: AssetImage(ImageConstants.tamilSongs),
                      text: "Tamil Hits",
                      subtext: 'Album',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _topmixes({required AssetImage img, required String text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(image: img, fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: 10),
        Text(text, style: TextStyle(color: ColorConstants.grey)),
      ],
    );
  }

  Column _Albumfeatures({
    required AssetImage img,
    required String text,
    required String subtext,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(image: img, fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: 10),
        Text(text, style: TextStyle(color: ColorConstants.white, fontSize: 18)),
        Text(
          subtext,
          style: TextStyle(color: ColorConstants.grey, fontSize: 14),
        ),
      ],
    );
  }

  Column _recent({
    required AssetImage img,
    required String text,
    required String subtext,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(image: img, fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: 10),
        Text(text, style: TextStyle(color: ColorConstants.white, fontSize: 18)),
        Text(
          subtext,
          style: TextStyle(color: ColorConstants.grey, fontSize: 14),
        ),
      ],
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
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromARGB(255, 80, 77, 77),
      ),
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(5),
            child: Image(height: 70, width: 60, image: img, fit: BoxFit.cover),
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

  Widget _categoryChip(String label, double width) {
    bool isSelected = selectedCategory == label;
    return InkWell(
      onTap: () {
        setState(() {
          selectedCategory = label;
        });
      },
      child: Container(
        height: 35,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: isSelected ? Colors.green : ColorConstants.signUpTextfield,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: ColorConstants.white,
              fontSize: 15,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
