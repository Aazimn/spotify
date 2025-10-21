import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/core/constants/image_constants.dart';
import 'package:spotify/view/a.dart';
import 'package:spotify/view/blend_screen/blend_screen.dart';
import 'package:spotify/view/global_widgets/mini_player.dart';
import 'package:spotify/view/profile_drawer/p_drawer.dart';
import 'package:spotify/view/home_screen/home_screen.dart';
import 'package:spotify/view/library_screen/library_screen.dart';
import 'package:spotify/view/premium_screen/premium_screen.dart';
import 'package:spotify/view/profile_screen/profile_screen.dart';
import 'package:spotify/view/search_screen/search_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController ctrl = TextEditingController();
  TextEditingController ctrl2 = TextEditingController();
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();

  static const List<Widget> screens = <Widget>[
    HomeScreen(),
    SearchScreen(),
    LibraryScreen(),
    PremiumScreen(),
    PremiumScreen(),
  ];

  void _showMenu() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 85, left: 20, right: 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorConstants.signUpTextfield,
            ),
            height: 300,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                spacing: 20,
                children: [
                  InkWell(
                    child: customCraete(
                      title: 'Playlist',
                      subTitle: 'Create a playlist with songs or episodes',
                      icn: PhosphorIcon(PhosphorIcons.musicNotesSimple()),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: AlignmentGeometry.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  ColorConstants.grey,
                                  const Color.fromARGB(255, 56, 56, 56),
                                ],
                              ),
                            ),
                            height: 780,
                            width: double.infinity,

                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.close,
                                        color: ColorConstants.white,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 50),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Give your playlist a name",
                                      style: TextStyle(
                                        color: ColorConstants.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                                TextField(
                                  style: TextStyle(
                                    color: ColorConstants.white,
                                    fontSize: 50,
                                  ),

                                  cursorColor: ColorConstants.green,
                                  controller: ctrl,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ColorConstants.green,
                                    hintText: "  My playlist #3",
                                    hintStyle: TextStyle(
                                      color: ColorConstants.white,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      ColorConstants.green,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "create",
                                    style: TextStyle(
                                      color: ColorConstants.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                  InkWell(
                    child: customCraete(
                      title: 'Collaborative playlist',
                      subTitle: 'Create a playlist together with friends',
                      icn: Icon(Icons.groups_3),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: AlignmentGeometry.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  ColorConstants.grey,
                                  const Color.fromARGB(255, 56, 56, 56),
                                ],
                              ),
                            ),
                            height: 780,
                            width: double.infinity,

                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.close,
                                        color: ColorConstants.white,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 50),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Name your collaborative playlist",
                                      style: TextStyle(
                                        color: ColorConstants.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                                TextField(
                                  style: TextStyle(
                                    color: ColorConstants.white,
                                    fontSize: 50,
                                  ),

                                  cursorColor: ColorConstants.green,
                                  controller: ctrl2,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ColorConstants.green,
                                    hintText: "  My playlist #3",
                                    hintStyle: TextStyle(
                                      color: ColorConstants.white,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      ColorConstants.green,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "create",
                                    style: TextStyle(
                                      color: ColorConstants.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => BlendScreen(),
                        ),
                      );
                    },
                    child: customCraete(
                      title: 'Blend',
                      subTitle: 'Combaine your friends tastes into a playlist',
                      icn: Icon(Icons.join_full),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Row customCraete({
    required String title,
    required String subTitle,
    required Icon icn,
  }) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: ColorConstants.grey,
          ),
          child: icn,
        ),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: ColorConstants.white, fontSize: 20),
            ),
            Text(
              subTitle,
              style: TextStyle(color: ColorConstants.grey, fontSize: 11),
            ),
          ],
        ),
      ],
    );
  }

  int num = 0;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorConstants.black,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          currentIndex: num,
          onTap: (value) {
            num = value;
            if (value == 4) {
              _showMenu();
            }
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_add),
              label: "Your Library",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Premium"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Create"),
          ],
        ),
        body: Stack(children: [screens[num],  MiniPlayer()]),
      ),
    );
  }
}
