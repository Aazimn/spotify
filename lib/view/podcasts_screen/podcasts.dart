import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/view/global_widgets/audio_controller.dart';
import 'package:spotify/view/global_widgets/mini_player.dart';
import 'package:spotify/view/song_payer_screen/song_player.dart';

class PodcastScreen extends StatelessWidget {
  final String title;
  final String img;

  const PodcastScreen({super.key, required this.title, required this.img});

  @override
  Widget build(BuildContext context) {
    final episodes = [
      {
        'text':
            'Bad parenting? Blaming parents for our own mistakes? | Malayalam Podcast',
        'description':
            "Do we always trace our life's problems back to our parents? Is it truly 'bad parenting,' or is it the struggle and inexperienc...",
        'date': 'Jul 23',
        'duration': '13 min left',
        'progress': 0.2,
        'audio': 'assets/audios/podcasts1.mp3',
        'img': img,
      },
      {
        'text':
            'Fear of attachments | Falling in love after breakup - Malayalam Podcast',
        'description':
            " Is it too soon to date again? That feeling when you meet someone great, but instead of butterflies, you get anx...",
        'date': 'Jul 19',
        'duration': '13 min',
        'progress': 0.0,
        'audio': 'assets/audios/podcasts2.mp3',
        'img': img,
      },
      {
        'text':
            'Overthinking | How to stop ruining your peace | Malayalam Podcast',
        'description':
            "Ever catch yourself replaying conversations in your head or worrying about things you can’t control? Let’s talk about why we overthink and how to calm the chaos in our minds.",
        'date': 'Jul 12',
        'duration': '14 min',
        'progress': 0.0,
        'audio': 'assets/audios/podcasts3.mp3',
        'img': img,
      },
      {
        'text':
            'Social media validation | Why likes don’t define you | Malayalam Podcast',
        'description':
            "Do you feel anxious when your post doesn’t get enough likes? In this episode, we explore the hidden pressure of online validation and how to build real self-worth offline.",
        'date': 'Jul 5',
        'duration': '15 min',
        'progress': 0.0,
        'audio': 'assets/audios/podcasts4.mp3',
        'img': img,
      },
    ];

    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ColorConstants.white,
          ),
        ),
      ),

     
      body: Stack(
        children: [
      
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children: [
            
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Episodes',
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.white24),

        
              Row(
                children: const [
                  Icon(Icons.filter_list, color: Colors.white70, size: 18),
                  SizedBox(width: 6),
                  Text(
                    'Newest • All Episodes',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 16),

            
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: episodes.length,
                itemBuilder: (context, index) {
                  final ep = episodes[index];
                  return InkWell(
                    onTap: () {
                      final audioController = Provider.of<AudioController>(
                        context,
                        listen: false,
                      );
                      audioController.setPlaylist(episodes);
                      audioController.playSong(episodes[index]);
                    },
                    onDoubleTap: () {
                      final audioController = Provider.of<AudioController>(
                        context,
                        listen: false,
                      );
                      audioController.setPlaylist(episodes);
                      audioController.playSong(episodes[index]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SongPlayerScreen(),
                        ),
                      );
                    },
                    child: EpisodeCard(
                      title: ep['text']!.toString(),
                      description: ep['description']!.toString(),
                      date: ep['date']!.toString(),
                      duration: ep['duration']!.toString(),
                      progress: ep['progress'] as double,
                      img: img,
                    ),
                  );
                },
              ),

       
              const SizedBox(height: 80),
            ],
          ),

       
          MiniPlayer(),
        ],
      ),
    );
  }
}

class EpisodeCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String duration;
  final String img;
  final double progress;

  const EpisodeCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.duration,
    required this.progress,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(img, width: 64, height: 64, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),

        
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  "$date • $duration",
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
          ),

       
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8),
            child: IconButton(
              icon: const Icon(
                Icons.play_circle_fill,
                color: Colors.white,
                size: 32,
              ),
              onPressed: () {
                final audioController = Provider.of<AudioController>(
                  context,
                  listen: false,
                );
                audioController.togglePlayPause();
              },
            ),
          ),
        ],
      ),
    );
  }
}
