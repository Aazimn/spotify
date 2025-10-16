import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spotify/core/constants/color_constants.dart';

import 'package:spotify/view/search_section/search_section.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ImagePicker imagePicker = ImagePicker();
  File? _pickedimage;
  Future<void> pick() async {
    var data = await imagePicker.pickImage(source: ImageSource.camera);
    if (data != null) {
      setState(() {
        _pickedimage = File(data.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
            SizedBox(width: 10),
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
              onTap: () {
                pick();
              },
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
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchSection()),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorConstants.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 10),
                        Text(
                          "What do you want to listen?",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Start browsing",
                    style: TextStyle(
                      color: ColorConstants.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  _startbrowing("Music", ColorConstants.pink, 80),
                  SizedBox(width: 20),
                  _startbrowing("Podcasts", ColorConstants.darkgreen, 80),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  _startbrowing("Live Events", ColorConstants.purple, 80),
                  SizedBox(width: 20),
                  _startbrowing("Home of Pop", ColorConstants.darkblue, 80),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Browsing all",
                    style: TextStyle(
                      color: ColorConstants.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  _startbrowing(
                    "Podcasts Charts",
                    const Color.fromARGB(255, 98, 71, 51),
                    120,
                  ),
                  SizedBox(width: 20),
                  _startbrowing(
                    "Business &\nTechnology",
                    const Color.fromARGB(255, 103, 23, 62),
                    120,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  _startbrowing(
                    "Discover",
                    const Color.fromARGB(255, 36, 88, 46),
                    120,
                  ),
                  SizedBox(width: 20),
                  _startbrowing(
                    "Radio",
                    const Color.fromARGB(255, 6, 39, 53),
                    120,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  _startbrowing(
                    "Malayalam",
                    const Color.fromARGB(255, 111, 103, 198),
                    120,
                  ),
                  SizedBox(width: 20),
                  _startbrowing(
                    "Hindi",
                    const Color.fromARGB(255, 162, 162, 48),
                    120,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  _startbrowing(
                    "punjabi",
                    const Color.fromARGB(255, 143, 81, 32),
                    120,
                  ),
                  SizedBox(width: 20),
                  _startbrowing(
                    "Tamil",
                    const Color.fromARGB(255, 96, 59, 156),
                    120,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _startbrowing(String text, Color bg, double height) {
    return Container(
      height: height,
      width: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bg,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                color: ColorConstants.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
