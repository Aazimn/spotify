import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/view/profile_screen/profile_screen.dart';
import 'package:spotify/view/start_page/start_page.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String name = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  Future<void> getdata() async {
    final pref = await SharedPreferences.getInstance();
    name = await pref.getString("Name") ?? "Not available";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.signUpTextfield,
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
        centerTitle: true,
        title: Text("Settings", style: TextStyle(color: ColorConstants.white)),
      ),
      backgroundColor: Colors.black12,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: ColorConstants.signUpTextfield,
                    child: Icon(
                      Icons.person_2_outlined,
                      color: ColorConstants.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "View profile",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              spacing: 20,
              children: [
                settings(text: 'Account'),
                settings(text: 'Data-saving and offline'),
                settings(text: 'Playback'),
                settings(text: 'Content and display'),
                settings(text: 'Privacy and social'),
                settings(text: 'Media quality'),
                settings(text: 'Notification'),
                settings(text: 'Apps and devices'),
                settings(text: 'Advertisement'),
                settings(text: 'About'),
              ],
            ),
            SizedBox(height: 30),
            Container(
              height: 45,
              width: 110,
              decoration: BoxDecoration(
                color: ColorConstants.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: InkWell(
                  onTap: () async {
                    final pref = await SharedPreferences.getInstance();
                    pref.clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => StartPage(),
                      ),
                    );
                  },
                  child: InkWell(
                    onTap: () async {
                      final pref = await SharedPreferences.getInstance();
                      pref.clear();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => StartPage()),
                      );
                    },
                    child: Text(
                      "Log out",
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorConstants.black,
                        fontWeight: FontWeight.w700,
                      ),
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

  Row settings({required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextStyle(color: ColorConstants.white, fontSize: 18)),
        Icon(Icons.keyboard_arrow_right, color: ColorConstants.white, size: 30),
      ],
    );
  }
}
