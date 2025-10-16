import 'package:flutter/material.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/view/profile_screen/profile_screen.dart';
import 'package:spotify/view/recent_screen/recent_screen.dart';
import 'package:spotify/view/settings_screen/settings.dart';
import 'package:spotify/view/sign_up_screen/sign_up.dart';
import 'package:spotify/view/whats_new_screen/whats_new.dart';

class ProfilrDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> drawerkey;
  const ProfilrDrawer({super.key, required this.drawerkey});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorConstants.signUpTextfield,
      width: 340,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      backgroundColor: ColorConstants.pink,
                      child: Text(
                        "A",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Aazim",
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
              Divider(height: 30, color: const Color.fromARGB(255, 75, 73, 73)),
              const SizedBox(height: 5),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: _drawerItem(Icons.add, "Add account"),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WhatsNew()),
                  );
                },
                child: _drawerItem(Icons.flash_on_outlined, "What's new"),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RecentScreen()),
                  );
                },
                child: _drawerItem(Icons.history, "Recents"),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
                child: _drawerItem(
                  Icons.settings_outlined,
                  "Settings and privacy",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _drawerItem(IconData icon, String title) {
  return Row(
    children: [
      Icon(icon, color: Colors.white, size: 25),
      const SizedBox(width: 15),
      Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
    ],
  );
}
