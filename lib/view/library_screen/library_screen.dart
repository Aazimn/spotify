import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/core/constants/image_constants.dart';
import 'package:spotify/view/profile_drawer/p_drawer.dart';
import 'package:spotify/view/search_section/search_section.dart';
import 'package:spotify/view/songs_screen/songs_screen.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
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

  String selectedCategory = "All";
  final GlobalKey<ScaffoldState> drawerkey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> allRecents = [
    {
      'title': 'Liked Songs',
      'subtitle': 'Playlist',
      'img': ImageConstants.likedsong,
      'disc': 'All your favorite songs saved in one place.',
      'colors': ColorConstants.blue,
    },
    {
      'title': 'Feel Good',
      'subtitle': 'Playlist',
      'img': ImageConstants.feelGood,
      'disc': 'Upbeat tracks to boost your mood anytime.',
      'colors': ColorConstants.yellow,
    },
    {
      'title': 'Gym Motivation',
      'subtitle': 'Album',
      'img': ImageConstants.gymMotivation,
      'disc': 'High-energy songs to keep your workout strong.',
      'colors': ColorConstants.darkgrey,
    },
    {
      'title': 'Tamil Hits',
      'subtitle': 'Album',
      'img': ImageConstants.tamilSongs,
      'disc': 'The best Tamil songs from top artists and movies.',
      'colors': ColorConstants.orange,
    },
    {
      'title': 'Travel Songs',
      'subtitle': 'Playlist',
      'img': ImageConstants.travelSongs,
      'disc': 'Perfect tunes to make your journeys unforgettable.',
      'colors': ColorConstants.blue,
    },
    {
      'title': 'Raataan Lamiyan',
      'subtitle': 'Artist',
      'img': ImageConstants.raataan,
      'disc': 'Melodious Punjabi hits from Raataan Lambiyan fame.',
      'colors': ColorConstants.p1,
    },
    {
      'title': 'Chand Sifarish',
      'subtitle': 'Artist',
      'img': ImageConstants.chandsifarish,
      'disc': 'Romantic Bollywood classics that never get old.',
      'colors': ColorConstants.p2,
    },
    {
      'title': 'Perilla Rajyath',
      'subtitle': 'Artist',
      'img': ImageConstants.perillarajyath,
      'disc': 'Popular Malayalam indie hits by Perilla Rajyath.',
      'colors': ColorConstants.blue,
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
      key: drawerkey,
      drawer: ProfilrDrawer(drawerkey: drawerkey),
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.black,
        title: Row(
          children: [
            InkWell(
              onTap: drawerkey.currentState?.openDrawer,
              child: CircleAvatar(
                backgroundColor: Colors.pink,
                child: Text(
                  name.isNotEmpty ? name[0].toUpperCase() : "A",
                  style: TextStyle(
                    fontSize: 25,
                    color: ColorConstants.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Text(
              "Your Library",
              style: TextStyle(
                fontSize: 28,
                color: ColorConstants.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchSection(),
                  ),
                );
              },
              child: Icon(Icons.search, color: ColorConstants.white, size: 30),
            ),
            const SizedBox(width: 10),
            Icon(Icons.add, color: ColorConstants.white, size: 40),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔹 Category filter chips
              Row(
                spacing: 10,
                children: [
                  _categoryChip("Playlists"),
                  _categoryChip("Albums"),
                  _categoryChip("Artists"),
                ],
              ),
              const SizedBox(height: 20),

              // 🔹 "Recents" title
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Recents",
                    style: TextStyle(
                      color: ColorConstants.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredRecents.length,
                itemBuilder: (context, index) {
                  final item = filteredRecents[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SongsScreen(
                              text11: item['title']!,
                              title: item['title']!,
                              subtitle: item['disc']!,
                              image: item['img']!,
                              clr: item['colors']!,
                            ),
                          ),
                        );
                      },
                      child: _recents(
                        title: item['title']!,
                        subtitle: item['subtitle']!,
                        img: item['img']!,
                      ),
                    ),
                  );
                },
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
