import 'package:flutter/material.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/core/constants/image_constants.dart';
import 'package:spotify/view/search_section/search_section.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  String selectedCategory = "All"; // default

  // All recents
  final List<Map<String, String>> allRecents = [
    {
      'title': 'Liked Songs',
      'subtitle': 'Playlist',
      'img': ImageConstants.likedsong,
    },
    {
      'title': 'Feel Good',
      'subtitle': 'Playlist',
      'img': ImageConstants.feelGood,
    },
    {
      'title': 'Gym Motivation',
      'subtitle': 'Album',
      'img': ImageConstants.gymMotivation,
    },
    {
      'title': 'Tamil Hits',
      'subtitle': 'Album',
      'img': ImageConstants.tamilSongs,
    },
    {
      'title': 'Travel Songs',
      'subtitle': 'Playlist',
      'img': ImageConstants.travelSongs,
    },
    {
      'title': 'Raataan Lamiyan',
      'subtitle': 'Artist',
      'img': ImageConstants.raataan,
    },
    {
      'title': 'Chand Sifarish',
      'subtitle': 'Artist',
      'img': ImageConstants.chandsifarish,
    },
    {
      'title': 'Perilla Rajyath',
      'subtitle': 'Artist',
      'img': ImageConstants.perillarajyath,
    },
  ];
  @override
  Widget build(BuildContext context) {
    final filteredRecents = selectedCategory == "All"
        ? allRecents
        : allRecents
              .where(
                (item) =>
                    item['subtitle'] ==
                    selectedCategory.substring(0, selectedCategory.length - 1),
              )
              .toList();
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.black,
        title: Row(
          children: [
            InkWell(
              child: CircleAvatar(
                backgroundColor: Colors.pink,
                child: Text(
                  "A",
                  style: TextStyle(
                    fontSize: 25,
                    color: ColorConstants.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 15),
            Text(
              "Your Library",
              style: TextStyle(
                fontSize: 28,
                color: ColorConstants.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 70),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchSection()),
                );
              },
              child: Icon(Icons.search, color: ColorConstants.white, size: 30),
            ),
            SizedBox(width: 10),
            Icon(Icons.add, color: ColorConstants.white, size: 40),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                spacing: 10,
                children: [
                  _categoryChip("Playlists"),
                  _categoryChip("Albums"),
                  _categoryChip("Artists"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Recents",
                    style: TextStyle(color: ColorConstants.white, fontSize: 18),
                  ),
                ],
              ),

              SizedBox(height: 20),
              for (var item in filteredRecents)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _recents(
                    title: item['title']!,
                    subtitle: item['subtitle']!,
                    img: item['img']!,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryChip(String label) {
    bool isSelected = selectedCategory == label;
    return InkWell(
      onTap: () {
        setState(() {
          selectedCategory = label;
        });
      },
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isSelected ? Colors.green : ColorConstants.signUpTextfield,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: ColorConstants.white,
              fontSize: 18,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Row _recents({
    required String title,
    required String subtitle,
    required String img,
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
      ],
    );
  }
}
