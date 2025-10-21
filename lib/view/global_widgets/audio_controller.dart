import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioController extends ChangeNotifier {
  // --- Singleton setup ---
  static final AudioController _instance = AudioController._internal();
  factory AudioController() => _instance;

  AudioController._internal() {
    _player.onDurationChanged.listen((d) {
      totalDuration = d;
      notifyListeners();
    });

    _player.onPositionChanged.listen((p) {
      currentPosition = p;
      notifyListeners();
    });

    _player.onPlayerComplete.listen((_) => _handleSongCompletion());

    // Audio context to ensure full volume on Android
    _player.setAudioContext(AudioContext(
      android: const AudioContextAndroid(
        isSpeakerphoneOn: true,
        contentType: AndroidContentType.music,
        usageType: AndroidUsageType.media,
        audioFocus: AndroidAudioFocus.gain,
      ),
      iOS:  AudioContextIOS(
        category: AVAudioSessionCategory.playback,
        options: <AVAudioSessionOptions>{},
      ),
    ));
  }

  // --- Core player ---
  AudioPlayer _player = AudioPlayer();

  Map<String, dynamic>? currentSong;
  List<Map<String, dynamic>> _playlist = [];
  int _currentIndex = -1;

  bool isPlaying = false;
  bool isShuffling = false;
  bool isRepeating = false;

  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;

  AudioPlayer get player => _player;

  /// Stream for UI slider
  Stream<Duration> get positionStream => _player.onPositionChanged;

  // --- Playlist controls ---
  void setPlaylist(List<Map<String, dynamic>> playlist) {
    _playlist = List<Map<String, dynamic>>.from(playlist);
    if (_playlist.isEmpty) _resetState();
    else if (_currentIndex < 0 || _currentIndex >= _playlist.length) _currentIndex = 0;
  }

  Future<void> playSong(Map<String, dynamic> song) async {
    final index = _playlist.indexWhere((s) => s['audio'] == song['audio']);
    if (index != -1) _currentIndex = index;
    else {
      _playlist.add(song);
      _currentIndex = _playlist.length - 1;
    }
    await _playAtCurrentIndex();
  }

  Future<void> togglePlayPause() async {
    if (isPlaying) {
      await _player.pause();
      isPlaying = false;
    } else {
      if (currentSong == null && _currentIndex != -1 && _playlist.isNotEmpty) {
        await _playAtCurrentIndex();
      } else {
        await _player.resume();
        isPlaying = true;
      }
    }
    notifyListeners();
  }

  Future<void> seekTo(Duration position) async {
    await _player.seek(position);
  }

  Future<void> playNext() async {
    if (_playlist.isEmpty) return;
    if (isShuffling) _currentIndex = Random().nextInt(_playlist.length);
    else _currentIndex = (_currentIndex + 1) % _playlist.length;
    await _playAtCurrentIndex();
  }

  Future<void> playPrevious() async {
    if (_playlist.isEmpty) return;
    if (isShuffling) _currentIndex = Random().nextInt(_playlist.length);
    else _currentIndex = _currentIndex > 0 ? _currentIndex - 1 : _playlist.length - 1;
    await _playAtCurrentIndex();
  }

  void toggleShuffle() {
    isShuffling = !isShuffling;
    notifyListeners();
  }

  void toggleRepeat() {
    isRepeating = !isRepeating;
    notifyListeners();
  }

  bool get hasNext => _playlist.isNotEmpty && _currentIndex < _playlist.length - 1;
  bool get hasPrevious => _playlist.isNotEmpty && _currentIndex > 0;
  Duration get remainingTime => totalDuration - currentPosition < Duration.zero
      ? Duration.zero
      : totalDuration - currentPosition;

  // --- Internal helpers ---
  Future<void> _playAtCurrentIndex() async {
    if (_currentIndex < 0 || _currentIndex >= _playlist.length) return;

    final song = _playlist[_currentIndex];
    try {
      await _player.stop();

      final audioPath = (song['audio'] ?? '').toString();
      if (audioPath.isEmpty) return;

      final assetPath = audioPath.replaceFirst('assets/', '');

      await _player.play(AssetSource(assetPath), volume: 1.0);

      currentSong = song;
      isPlaying = true;
      currentPosition = Duration.zero;
      totalDuration = Duration.zero;
      notifyListeners();

      // wait until duration is loaded
      Duration? duration;
      for (int i = 0; i < 10; i++) {
        duration = await _player.getDuration();
        if (duration != null && duration > Duration.zero) break;
        await Future.delayed(const Duration(milliseconds: 200));
      }
      if (duration != null) totalDuration = duration;
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

  void release() {
    _player.stop();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
