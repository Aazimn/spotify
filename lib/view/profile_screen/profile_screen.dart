import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify/core/constants/color_constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.bottomCenter,
            end: AlignmentGeometry.topCenter,
            colors: [
              Color(0xFF000000),
              Color(0xFF1C1C1C),
              Color(0xFF2E2E2E),
              Color(0xFF3A3A3A),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: ColorConstants.white),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: ColorConstants.p1,
                    child: Text(
                      name.isNotEmpty ? name[0].toUpperCase() : "A",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
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
                      Row(
                        spacing: 5,
                        children: [
                          Text(
                            "0",
                            style: TextStyle(
                              color: ColorConstants.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "followers",
                            style: TextStyle(
                              color: ColorConstants.grey,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "3",
                            style: TextStyle(
                              color: ColorConstants.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "following",
                            style: TextStyle(
                              color: ColorConstants.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                spacing: 25,
                children: [
                  Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: BoxBorder.all(color: ColorConstants.grey),
                    ),
                    child: Center(
                      child: Text(
                        "Edit",
                        style: TextStyle(
                          color: ColorConstants.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Icon(Icons.ios_share, color: ColorConstants.grey, size: 30),
                  Icon(Icons.more_horiz, color: ColorConstants.grey, size: 30),
                ],
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No recent activity.",
                    style: TextStyle(color: ColorConstants.white, fontSize: 25),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Check out some new music now",
                    style: TextStyle(color: ColorConstants.grey, fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
