import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/core/constants/image_constants.dart';
import 'package:spotify/view/profile_drawer/p_drawer.dart';
import 'package:spotify/view/songs_screen/songs_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  final List<Map<String, dynamic>> recentPlaylists = [
    {
      'img': ImageConstants.likedsong,
      'text': 'Liked Songs',
      "subtext": "Your favorite tracks all in one place.",
      "colors": ColorConstants.blue,
    },
    {
      'img': ImageConstants.feelGood,
      'text': 'Feel Good',
      "subtext":
          "Uplifting Malayalam and Tamil songs to boost your mood. Enjoy!!",
      "colors": ColorConstants.yellow,
    },
    {
      'img': ImageConstants.gymMotivation,
      'text': 'GYM Motivation',
      "subtext": "High-energy beats to power through your workouts.",
      "colors": ColorConstants.darkgrey,
    },
    {
      'img': ImageConstants.tamilSongs,
      'text': 'Tamil Songs',
      "subtext": "A collection of trending Tamil hits and classics.",
      "colors": ColorConstants.orange,
    },
    {
      'img': ImageConstants.malayalamSongs,
      'text': 'Malayalam Songs',
      "subtext": "Top Malayalam tracks for every mood and moment.",
      "colors": ColorConstants.orange,
    },
    {
      'img': ImageConstants.travelSongs,
      'text': 'Travel Songs',
      "subtext": "Perfect tunes to accompany your road trips and travels.",
      "colors": ColorConstants.blue,
    },
    {
      'img': ImageConstants.hindiSongs,
      'text': 'Hindi Songs',
      "subtext": "Bollywood chartbusters and soulful Hindi melodies.",
      "colors": ColorConstants.p3,
    },
    {
      'img': ImageConstants.topHitSongs,
      'text': 'Top Hit Songs',
      "subtext": "Today’s most popular tracks across all genres.",
      "colors": ColorConstants.p1,
    },
  ];

  final List<Map<String, dynamic>> topMixes = [
    {
      'img': ImageConstants.dabzeeTopMixes,
      'text': 'Dabzee, Niraj Madhav\nAnd more',
      'subtext': 'A blend of Malayalam rap and indie grooves you’ll love.',
      'song': 'Mazha Mazha',
      "colors": ColorConstants.darkgrey,
    },
    {
      'img': ImageConstants.govindhTopMixes,
      'text': 'Govind Vasantha,\nKailash Kher',
      'subtext': 'Soothing fusion of classical and soulful Indian tunes.',
      'song': 'Oru Manam',
      "colors": ColorConstants.p2,
    },
    {
      'img': ImageConstants.rajatTopMixes,
      'text': 'Najim Arshad and\nOuseppachan',
      'subtext': 'A mix of melodic hits and timeless soundtracks.',
      'song': 'Manassin Madiyil',
      "colors": ColorConstants.orange,
    },
    {
      'img': ImageConstants.ravalTopMixes,
      'text': 'Darshan Raval, A.R.\nRahman',
      'subtext': 'Romantic Bollywood vibes with a touch of magic.',
      'song': 'Chhod Diya',
      "colors": ColorConstants.p2,
    },
  ];

  final List<Map<String, dynamic>> albumFeatures = [
    {
      'img': ImageConstants.kalyanaRaman,
      'text': 'Kalyana Raman',
      'subtext': 'Berny-Ignatius',
      "colors": ColorConstants.p1,
    },
    {
      'img': ImageConstants.ambili,
      'text': 'Ambili',
      'subtext': 'Vishnu Vijay',
      "colors": ColorConstants.blue,
    },
    {
      'img': ImageConstants.tejaBhai,
      'text': 'Teja Bhai & Family',
      'subtext': 'Abu Murali',
      "colors": ColorConstants.deeporange,
    },
    {
      'img': ImageConstants.vishwaroopam,
      'text': 'Vishwaroopam',
      'subtext': 'Shankar-Ehsaan',
      "colors": ColorConstants.darkgrey,
    },
  ];

  final List<Map<String, dynamic>> recents = [
    {
      'img': ImageConstants.topHitSongs,
      'text': 'Top Hit Songs',
      'subtext': 'Playlist',
      "colors": ColorConstants.p1,
    },
    {
      'img': ImageConstants.feelGood,
      'text': 'Feel Good',
      'subtext': 'Playlist - Mithun',
      "colors": ColorConstants.orange,
    },
    {
      'img': ImageConstants.gymMotivation,
      'text': 'Gym Motivation',
      'subtext': 'Album',
      "colors": ColorConstants.darkgrey,
    },
    {
      'img': ImageConstants.tamilSongs,
      'text': 'Tamil Hits',
      'subtext': 'Album',
      "colors": ColorConstants.orange,
    },
  ];

  final List<Map<String, dynamic>> podcasts = [
    {
      'img': ImageConstants.feelGood,
      'text': 'Feel good|\nEpisode 1',
      'disc': 'English Unleashed: The\npodcasts oct 6 13 min',
      'subtext': 'My Podcast Series',
      "color": Colors.brown,
    },
    {
      'img': ImageConstants.topHitSongs,
      'text': 'The Music Stories',
      'disc': 'English Unleashed: The\npodcasts oct 6 13 min',
      'subtext': 'Check out my latest episodes',
      "color": Colors.blueGrey,
    },
  ];

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
                onTap: () => drawerkey.currentState?.openDrawer(),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: ColorConstants.pink,
                  child: Text(
                    name.isNotEmpty ? name[0].toUpperCase() : "A",
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
              _categoryChip("Podcasts", 90),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (selectedCategory == "All") ...[
                const SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recentPlaylists.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2.8,
                  ),
                  itemBuilder: (context, index) {
                    final recent = recentPlaylists[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SongsScreen(
                              text11: recent["text"],
                              title: recent["text"],
                              subtitle: recent["subtext"],
                              image: recent["img"],
                              clr: recent["colors"],
                            ),
                          ),
                        );
                      },
                      child: recentPlaylist(
                        img: AssetImage(recent['img']),
                        text: recent['text'],
                        height: playlistBoxHeight,
                        width: playlistBoxWidth,
                      ),
                    );
                  },
                ),
              ],

              if (selectedCategory == "All" || selectedCategory == "Music") ...[
                const SizedBox(height: 10),
                _sectionTitle("Your Top Mixes"),
                const SizedBox(height: 20),
                _horizontalGrid(topMixes, (index) {
                  final topmix = topMixes[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SongsScreen(
                            text11: topmix["song"],
                            title: topmix["text"],
                            subtitle: topmix["subtext"],
                            image: topmix["img"],
                            clr: topmix["colors"],
                          ),
                        ),
                      );
                    },
                    child: _topmixes(
                      img: AssetImage(topmix['img']),
                      text: topmix['text'],
                    ),
                  );
                }),
                const SizedBox(height: 20),
                _sectionTitle("Albums Featuring Songs You Like"),
                const SizedBox(height: 20),
                _horizontalGrid(albumFeatures, (index) {
                  final albumFeature = albumFeatures[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SongsScreen(
                            text11: albumFeature["text"],
                            title: albumFeature["text"],
                            subtitle: albumFeature["subtext"],
                            image: albumFeature["img"],
                            clr: albumFeature["colors"],
                          ),
                        ),
                      );
                    },
                    child: _albumfeatures(
                      img: AssetImage(albumFeature['img']),
                      text: albumFeature['text'],
                      subtext: albumFeature['subtext'],
                    ),
                  );
                }),
                const SizedBox(height: 20),
                _sectionTitle("Based on your recent listening"),
                const SizedBox(height: 20),
                _horizontalGrid(recents, (index) {
                  final recentlist = recents[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SongsScreen(
                            text11: recentlist["text"],
                            title: recentlist["text"],
                            subtitle: recentlist["subtext"],
                            image: recentlist["img"],
                            clr: recentlist["colors"],
                          ),
                        ),
                      );
                    },
                    child: _recent(
                      img: AssetImage(recentlist['img']),
                      text: recentlist['text'],
                      subtext: recentlist['subtext'],
                    ),
                  );
                }),
              ],

              if (selectedCategory == "Podcasts") ...[
                const SizedBox(height: 30),
                _sectionTitle("Popular Podcasts"),
                const SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: podcasts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1.5,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: podcasts[index]["color"],
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),

                                  image: DecorationImage(
                                    image: AssetImage(podcasts[index]["img"]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      podcasts[index]["text"],
                                      style: TextStyle(
                                        color: ColorConstants.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      podcasts[index]["disc"],
                                      style: TextStyle(
                                        color: ColorConstants.white,

                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          Text(
                            podcasts[index]["subtext"],
                            style: TextStyle(
                              color: ColorConstants.white,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.add_circle_outline,
                                color: ColorConstants.white,
                                size: 25,
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.play_circle_fill,
                                color: ColorConstants.white,
                                size: 25,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _horizontalGrid(
    List<Map<String, dynamic>> items,
    Widget Function(int) builder,
  ) {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.3,
        ),
        itemBuilder: (context, index) => builder(index),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget _topmixes({required AssetImage img, required String text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(image: img, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 8),
        Text(text, style: TextStyle(color: ColorConstants.grey)),
      ],
    );
  }

  Widget _albumfeatures({
    required AssetImage img,
    required String text,
    required String subtext,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(image: img, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 10),
        Text(text, style: TextStyle(color: ColorConstants.white, fontSize: 18)),
        Text(
          subtext,
          style: TextStyle(color: ColorConstants.grey, fontSize: 14),
        ),
      ],
    );
  }

  Widget _recent({
    required AssetImage img,
    required String text,
    required String subtext,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(image: img, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 10),
        Text(text, style: TextStyle(color: ColorConstants.white, fontSize: 18)),
        Text(
          subtext,
          style: TextStyle(color: ColorConstants.grey, fontSize: 14),
        ),
      ],
    );
  }

  Widget recentPlaylist({
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
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image(height: 60, width: 60, image: img, fit: BoxFit.cover),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: ColorConstants.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryChip(String label, double width) {
    bool isSelected = selectedCategory == label;
    return InkWell(
      onTap: () => setState(() => selectedCategory = label),
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
