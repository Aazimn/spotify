import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/view/global_widgets/audio_controller.dart';
import 'package:spotify/view/song_payer_screen/song_player.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final audioController = Provider.of<AudioController>(context);
    if (audioController.currentSong == null) return const SizedBox();

    final song = audioController.currentSong!;

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SongPlayerScreen()),
          );
        },
        child: Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF8B0000),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  song['img'],
                  height: 45,
                  width: 45,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song['text'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      song['text'],
                      style: const TextStyle(
                        color: Color(0xFFD3D3D3),
                        fontSize: 13,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.devices, color: Colors.white, size: 22),
              const SizedBox(width: 15),
              IconButton(
                icon: Icon(
                  audioController.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  audioController.togglePlayPause();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
