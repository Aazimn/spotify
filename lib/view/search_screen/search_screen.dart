import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/view/search_section/search_section.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
  final ImagePicker _imagePicker = ImagePicker();
  File? _pickedImage;

  Future<void> pick() async {
    final data = await _imagePicker.pickImage(source: ImageSource.camera);
    if (data != null) {
      setState(() {
        _pickedImage = File(data.path);
      });
    }
  }

 
  final List<Map<String, dynamic>> startBrowsingItems = [
    {"title": "Music", "color": ColorConstants.pink},
    {"title": "Podcasts", "color": ColorConstants.darkgreen},
    {"title": "Live Events", "color": ColorConstants.purple},
    {"title": "Home of Pop", "color": ColorConstants.darkblue},
  ];

  final List<Map<String, dynamic>> browsingAllItems = [
    {
      "title": "Podcasts Charts",
      "color": const Color.fromARGB(255, 98, 71, 51),
    },
    {
      "title": "Business &\nTechnology",
      "color": const Color.fromARGB(255, 103, 23, 62),
    },
    {"title": "Discover", "color": const Color.fromARGB(255, 36, 88, 46)},
    {"title": "Radio", "color": const Color.fromARGB(255, 6, 39, 53)},
    {"title": "Malayalam", "color": const Color.fromARGB(255, 111, 103, 198)},
    {"title": "Hindi", "color": const Color.fromARGB(255, 162, 162, 48)},
    {"title": "Punjabi", "color": const Color.fromARGB(255, 143, 81, 32)},
    {"title": "Tamil", "color": const Color.fromARGB(255, 96, 59, 156)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.black,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                name.isNotEmpty ? name[0].toUpperCase() : "A",
                style: TextStyle(
                  fontSize: 25,
                  color: ColorConstants.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              "Search",
              style: TextStyle(
                fontSize: 30,
                color: ColorConstants.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: pick,
              child: Icon(
                Icons.camera_alt_outlined,
                color: ColorConstants.white,
                size: 35,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchSection(),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorConstants.white,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: const [
                      Icon(Icons.search),
                      SizedBox(width: 10),
                      Text(
                        "What do you want to listen?",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "Start browsing",
                style: TextStyle(
                  color: ColorConstants.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: startBrowsingItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 2, 
                ),
                itemBuilder: (context, index) {
                  final item = startBrowsingItems[index];
                  return _buildBrowsingCard(item["title"], item["color"]);
                },
              ),

              const SizedBox(height: 30),

              
              Text(
                "Browsing all",
                style: TextStyle(
                  color: ColorConstants.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: browsingAllItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1.4, 
                ),
                itemBuilder: (context, index) {
                  final item = browsingAllItems[index];
                  return _buildBrowsingCard(item["title"], item["color"]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

 
  Widget _buildBrowsingCard(String title, Color bgColor) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: TextStyle(
            color: ColorConstants.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
