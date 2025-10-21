import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/view/dummy_data/songs_screen_dummy.dart';
import 'package:spotify/view/global_widgets/audio_controller.dart';
import 'package:spotify/view/global_widgets/mini_player.dart';
import 'package:spotify/view/search_section/search_section.dart';
import 'package:spotify/view/song_payer_screen/song_player.dart';

class SongsScreen extends StatefulWidget {
  final String text11;
  final String title;
  final String subtitle;
  final String image;
  final Color clr;

  SongsScreen({
    super.key,
    required this.text11,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.clr,
  });

  @override
  State<SongsScreen> createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    final audioController = Provider.of<AudioController>(context);

    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        backgroundColor: widget.clr,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.text11,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [widget.clr, Colors.black, Colors.black, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchSection(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: ColorConstants.white,
                              size: 30,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              "Find on this page",
                              style: TextStyle(
                                color: ColorConstants.white,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.asset(widget.image, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: ColorConstants.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: TextStyle(color: ColorConstants.grey),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 20,
                        children: [
                          Container(
                            height: 40,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: BoxBorder.all(
                                color: ColorConstants.grey,
                                width: 4,
                              ),
                            ),
                            child: Image.asset(widget.image, fit: BoxFit.cover),
                          ),

                          InkWell(
                            onTap: () {
                              setState(() {
                                isAdded = !isAdded;
                              });
                            },
                            child: Icon(
                              isAdded
                                  ? Icons.check_circle
                                  : Icons.add_circle_outline,
                              size: 30,
                              color: isAdded
                                  ? ColorConstants.green
                                  : ColorConstants.grey,
                            ),
                          ),
                          Icon(
                            Icons.downloading,
                            size: 30,
                            color: ColorConstants.grey,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          audioController.togglePlayPause();
                        },
                        child: Icon(
                          Icons.play_circle,
                          size: 60,
                          color: ColorConstants.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: likedSongs.length,
                    itemBuilder: (context, index) {
                      final song = likedSongs[index];
                      return InkWell(
                        onDoubleTap: () {
                          final audioController = Provider.of<AudioController>(
                            context,
                            listen: false,
                          );
                          audioController.setPlaylist(likedSongs);
                          audioController.playSong(song);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SongPlayerScreen(),
                            ),
                          );
                        },
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              song["img"],
                              height: 55,
                              width: 55,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            song["text"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            "Playlist • ${song["text"]}",
                            style: TextStyle(
                              color: ColorConstants.grey,
                              fontSize: 14,
                            ),
                          ),
                          trailing: InkWell(
                            onTap: () {
                              _showSongOptions(context, song);
                            },
                            child: Icon(
                              Icons.more_horiz,
                              color: ColorConstants.white,
                            ),
                          ),
                          onTap: () {
                            final audioController =
                                Provider.of<AudioController>(
                                  context,
                                  listen: false,
                                );
                            audioController.setPlaylist(likedSongs);
                            audioController.playSong(song);
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          MiniPlayer(),
        ],
      ),
    );
  }

  void _showSongOptions(BuildContext context, Map<String, dynamic> song) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorConstants.signUpTextfield,
          ),
          height: 500,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      song['img'],
                      height: 55,
                      width: 55,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    song['text'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    "Playlist • ${song['text']}",
                    style: TextStyle(color: ColorConstants.grey, fontSize: 14),
                  ),
                ),
                // Add other options here
              ],
            ),
          ),
        );
      },
    );
  }
}
