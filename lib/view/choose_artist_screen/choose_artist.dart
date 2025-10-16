import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/view/choose_podcast_screen/choose_podcast.dart';

class ChooseArtist extends StatefulWidget {
  const ChooseArtist({super.key});

  @override
  State<ChooseArtist> createState() => _ChooseArtistState();
}

class _ChooseArtistState extends State<ChooseArtist> {
  final TextEditingController searchctrl = TextEditingController();

  // single source of truth: name + image together
  final List<Map<String, String>> artists = [
    {"name": "Billi Eilish", "image": "assets/images/billie.jpg"},
    {"name": "Ariana Grande", "image": "assets/images/ariana.jpg"},
    {"name": "BTS", "image": "assets/images/bts.jpg"},
    {"name": "Drake", "image": "assets/images/drake.jpg"},
    {"name": "Ed Sheeran", "image": "assets/images/ed.jpg"},
    {"name": "Harry styles", "image": "assets/images/harry.jpg"},
  ];

  List<Map<String, String>> filtered = [];

  final Set<String> selectedArtists = {};

  @override
  void initState() {
    super.initState();
    filtered = List.from(artists);
  }

  void search(String input) {
    setState(() {
      final term = input.toLowerCase().trim();
      filtered = term.isEmpty
          ? List.from(artists)
          : artists
                .where((a) => a['name']!.toLowerCase().contains(term))
                .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Choose 3 or more artists you like.",
            style: TextStyle(
              color: ColorConstants.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: ColorConstants.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              controller: searchctrl,
              onChanged: search,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: filtered.isEmpty
                ? const Center(
                    child: Text(
                      "No match",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : GridView.custom(
                    padding: const EdgeInsets.all(8),
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      repeatPattern: QuiltedGridRepeatPattern.inverted,
                      pattern: const [
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                      childCount: filtered.length,
                      (context, index) {
                        final artist = filtered[index];
                        final isSelected = selectedArtists.contains(
                          artist['name'],
                        );
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              final name = artist['name']!;
                              if (selectedArtists.contains(name)) {
                                selectedArtists.remove(name);
                              } else {
                                selectedArtists.add(name);
                              }
                            });
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.asset(
                                        artist['image']!,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                    if (isSelected)
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black45,
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.check_circle,
                                            color: Colors.greenAccent,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                artist['name']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(0, 1),
                                      blurRadius: 4,
                                      color: Colors.black54,
                                    ),
                                  ],
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 300,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedArtists.length >= 3
                ? Colors.white
                : Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: selectedArtists.length >= 3
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChoosePodcast()),
                  );
                }
              : null,
          child: const Text(
            "Done",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
