import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class AudioController extends ChangeNotifier {
  // --- Singleton setup ---
  static final AudioController _instance = AudioController._internal();
  factory AudioController() => _instance;

  AudioController._internal() {
    // Stream listeners (initialized once)
    _player.onDurationChanged.listen((d) {
      totalDuration = d;
      notifyListeners();
    });

    _player.onPositionChanged.listen((p) {
      // Only update UI when the position (in seconds) changes
      if (p.inSeconds != currentPosition.inSeconds) {
        currentPosition = p;
        notifyListeners();
      }
    });

    _player.onPlayerComplete.listen((_) => _handleSongCompletion());
  }

  // --- Core player instance ---
  final AudioPlayer _player = AudioPlayer();

  // --- Playback state ---
  Map<String, dynamic>? currentSong;
  List<Map<String, dynamic>> _playlist = [];
  int _currentIndex = -1;
  bool isPlaying = false;
  bool isShuffling = false;
  bool isRepeating = false;

  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;

  AudioPlayer get player => _player;

  // --- Public API ---

  void setPlaylist(List<Map<String, dynamic>> playlist) {
    _playlist = List<Map<String, dynamic>>.from(playlist);
    if (_playlist.isEmpty) {
      _resetState();
    } else if (_currentIndex < 0 || _currentIndex >= _playlist.length) {
      _currentIndex = 0;
    }
  }

  Future<void> playSong(Map<String, dynamic> song) async {
    final index = _playlist.indexWhere((s) => s['audio'] == song['audio']);
    if (index != -1) {
      _currentIndex = index;
    } else if (_playlist.isEmpty) {
      _playlist = [song];
      _currentIndex = 0;
    } else {
      _playlist.add(song);
      _currentIndex = _playlist.length - 1;
    }

    await _playAtCurrentIndex();
  }

  Future<void> togglePlayPause() async {
    try {
      if (isPlaying) {
        await _player.pause();
        isPlaying = false;
      } else {
        if (currentSong == null &&
            _currentIndex != -1 &&
            _playlist.isNotEmpty) {
          await _playAtCurrentIndex();
        } else {
          await _player.resume();
          isPlaying = true;
        }
      }
      notifyListeners();
    } catch (e) {
      debugPrint('togglePlayPause error: $e');
    }
  }

  Future<void> seekTo(Duration position) async {
    await _player.seek(position);
  }

  Future<void> playNext() async {
    if (_playlist.isEmpty) return;

    if (isShuffling) {
      _currentIndex = Random().nextInt(_playlist.length);
    } else {
      _currentIndex = (_currentIndex + 1) % _playlist.length;
    }

    await _playAtCurrentIndex();
  }

  Future<void> playPrevious() async {
    if (_playlist.isEmpty) return;

    if (isShuffling) {
      _currentIndex = Random().nextInt(_playlist.length);
    } else {
      _currentIndex = _currentIndex > 0
          ? _currentIndex - 1
          : _playlist.length - 1;
    }

    await _playAtCurrentIndex();
  }

  Future<void> stop() async {
    await _player.stop();
    isPlaying = false;
    currentPosition = Duration.zero;
    notifyListeners();
  }

  void toggleShuffle() {
    isShuffling = !isShuffling;
    notifyListeners();
  }

  void toggleRepeat() {
    isRepeating = !isRepeating;
    notifyListeners();
  }

  bool get hasNext =>
      _playlist.isNotEmpty && _currentIndex < _playlist.length - 1;
  bool get hasPrevious => _playlist.isNotEmpty && _currentIndex > 0;

  Duration get remainingTime => totalDuration - currentPosition < Duration.zero
      ? Duration.zero
      : totalDuration - currentPosition;

  // --- Internal Helpers ---

Future<void> _playAtCurrentIndex() async {
  if (_currentIndex < 0 || _currentIndex >= _playlist.length) return;

  final song = _playlist[_currentIndex];
  try {
    await _player.stop();
    await _player.release();

    final audioPath = (song['audio'] ?? '').toString();
    if (audioPath.isEmpty) return;

    final assetPath = audioPath.replaceFirst('assets/', '');

    await _player.play(AssetSource(assetPath)); // 🎵 start first
    await _player.setVolume(1.0); // 🔊 then force full volume (after session init)

    currentSong = song;
    isPlaying = true;
    currentPosition = Duration.zero;
    totalDuration = Duration.zero;
    notifyListeners();

    debugPrint('✅ Volume forced to 1.0 after playback start');
  } catch (e) {
    debugPrint('Error in _playAtCurrentIndex: $e');
  }
}




  void _handleSongCompletion() {
    if (isRepeating) {
      _player.seek(Duration.zero);
      _player.resume();
    } else {
      playNext();
    }
  }

  void _resetState() {
    _currentIndex = -1;
    currentSong = null;
    isPlaying = false;
    currentPosition = Duration.zero;
    totalDuration = Duration.zero;
    notifyListeners();
  }

  // --- Lifecycle ---

  void release() {
    _player.stop();
  }

  @override
  void dispose() {
    // Don't auto-dispose since it's a singleton; call release() manually if needed
    super.dispose();
  }
}
