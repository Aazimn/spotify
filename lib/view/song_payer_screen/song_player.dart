import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/view/global_widgets/audio_controller.dart';

class SongPlayerScreen extends StatefulWidget {
  const SongPlayerScreen({super.key});

  @override
  State<SongPlayerScreen> createState() => _SongPlayerScreenState();
}

class _SongPlayerScreenState extends State<SongPlayerScreen> {
  double? _tempSeek;

  @override
  Widget build(BuildContext context) {
    final audio = Provider.of<AudioController>(context);
    final song = audio.currentSong;

    if (song == null) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text('No song playing', style: TextStyle(color: Colors.white)),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Now Playing',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder<Duration>(
        stream: audio.positionStream,
        builder: (context, snapshot) {
          final position = snapshot.data ?? audio.currentPosition;
          final total = audio.totalDuration;

          final currentSec =
              _tempSeek ??
              position.inSeconds.toDouble().clamp(
                0,
                total.inSeconds.toDouble(),
              );

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      song['img'],
                      width: double.infinity,
                      height: 320,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              song['text'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              song['subtext'] ?? song['text'],
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.favorite, color: Colors.green, size: 26),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
               
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Slider(
                        activeColor: Colors.white,
                        inactiveColor: Colors.white24,
                        min: 0,
                        max: total.inSeconds.toDouble(),
                        value: currentSec,
                        onChanged: (value) => setState(() => _tempSeek = value),
                        onChangeEnd: (value) {
                          audio.seekTo(Duration(seconds: value.toInt()));
                          setState(() => _tempSeek = null);
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(position),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "-${_formatDuration(total - position)}",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.shuffle,
                        color: audio.isShuffling
                            ? Colors.green
                            : Colors.white70,
                      ),
                      onPressed: audio.toggleShuffle,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.skip_previous_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: audio.playPrevious,
                    ),
                    IconButton(
                      icon: Icon(
                        audio.isPlaying
                            ? Icons.pause_circle_filled_rounded
                            : Icons.play_circle_filled_rounded,
                        color: Colors.white,
                        size: 70,
                      ),
                      onPressed: audio.togglePlayPause,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.skip_next_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: audio.playNext,
                    ),
                    IconButton(
                      icon: Icon(
                        audio.isRepeating ? Icons.repeat_one : Icons.repeat,
                        color: audio.isRepeating
                            ? Colors.green
                            : Colors.white70,
                      ),
                      onPressed: audio.toggleRepeat,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.speaker, color: Colors.white70, size: 28),
                      Icon(
                        Icons.share_outlined,
                        color: Colors.white70,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
