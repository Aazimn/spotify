import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/view/dummy_data/home_screen_dummy.dart';
import 'package:spotify/view/global_widgets/audio_controller.dart';
import 'package:spotify/view/podcasts_screen/podcasts.dart';
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
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PodcastScreen(
                              title: podcasts[index]["text"],
                              img: podcasts[index]["img"],
                            ),
                          ),
                        );
                      },
                      child: Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                            SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      final currentValue =
                                          podcasts[index]['isAdded'] ?? false;
                                      podcasts[index]['isAdded'] =
                                          !currentValue;
                                    });
                                  },
                                  child: Icon(
                                    podcasts[index]['isAdded']
                                        ? Icons.check_circle
                                        : Icons.add_circle_outline,
                                    color: podcasts[index]['isAdded']
                                        ? Colors.green
                                        : Colors.white70,
                                    size: 30,
                                  ),
                                ),
                                SizedBox(width: 20),
                                InkWell(
                                  onTap: () {
                                    final audioController =
                                        Provider.of<AudioController>(
                                          context,
                                          listen: false,
                                        );
                                    audioController.togglePlayPause();
                                  },
                                  child: Icon(
                                    Icons.play_circle_fill,
                                    color: ColorConstants.white,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
