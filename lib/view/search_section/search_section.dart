import 'package:flutter/material.dart';

import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/core/constants/image_constants.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  TextEditingController searchctrl = TextEditingController();
  List<String> images = [
    ImageConstants.raataan,
    ImageConstants.haule,
    ImageConstants.chandsifarish,
    ImageConstants.perillarajyath,
    ImageConstants.hridhayavum,
    ImageConstants.charliesong,
    ImageConstants.likedsong,
    ImageConstants.feelGood,
    ImageConstants.gymMotivation,
    ImageConstants.tamilSongs,
    ImageConstants.travelSongs,
  ];
  List<String> songTitle = [
    "Rataan Lambiyan",
    "Haule Haule",
    "Chand Sifarish",
    "Perilla Raajyathe",
    "Hridhayavum",
    "Our Kari Mukilinu",
    "Liked Songs",
    "Feel Good",
    "Gym Motivation",
    "Tamil Hits",
    "Travel Songs",
  ];
  List<String> subTitle = [
    "song-Tanishk Bagchi",
    "song-Salim Sulaiman",
    "Song-Jatin Lalit",
    "Song-Ouseppachan",
    "Song-Vineeth Sreenivasan",
    "Song-Gopi Sundar",
    "Playlist",
    "Playlist",
    "Album",
    "Album",
    "Playlist",
  ];

  List<String> copytitle = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    copytitle.addAll(songTitle);
  }

  void search(String input) {
    copytitle.cast();
    copytitle = songTitle.where((items) {
      return items.toLowerCase().contains(input.toLowerCase().trim());
    }).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 51, 50, 50),
        title: SizedBox(
          height: 45,
          child: TextField(
            style: TextStyle(color: ColorConstants.white),
            onChanged: (value) {
              search(value);
            },
            controller: searchctrl,
            decoration: InputDecoration(
              hoverColor: ColorConstants.white,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: ColorConstants.search,

              hintText: "What do you want to listen to?",

              hintStyle: TextStyle(fontSize: 17, color: ColorConstants.grey),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: ColorConstants.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            copytitle.length == 0
                ? Text(
                    "No song found",
                    style: TextStyle(color: ColorConstants.white),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Recent searches",
                          style: TextStyle(
                            fontSize: 25,
                            color: ColorConstants.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
            SizedBox(height: 10),
            ListView.builder(
              itemCount: copytitle.length,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                final originalIndex = songTitle.indexOf(copytitle[index]);
                return ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(images[originalIndex]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    copytitle[index],
                    style: TextStyle(fontSize: 20, color: ColorConstants.white),
                  ),
                  subtitle: Text(
                    subTitle[originalIndex],
                    style: TextStyle(fontSize: 20, color: ColorConstants.white),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      setState(() {
                        final removedSong = copytitle[index];
                        copytitle.removeAt(index);
                        songTitle.remove(removedSong);
                        subTitle.removeAt(index);
                        images.removeAt(index);
                      });
                    },
                    child: Icon(Icons.close),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
