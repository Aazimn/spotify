import 'package:flutter/material.dart';
import 'package:spotify/core/constants/color_constants.dart';
import 'package:spotify/core/constants/image_constants.dart';

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
    'isAdded': false,
  },
  {
    'img': ImageConstants.topHitSongs,
    'text': 'The Music Stories',
    'disc': 'Mal Unleashed: The\npodcasts sep 12 07 min',
    'subtext': 'Check out my latest episodes',
    "color": Colors.blueGrey,
    'isAdded': false,
  },
];
