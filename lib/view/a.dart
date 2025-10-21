// import 'package:flutter/material.dart';
// import 'package:spotify/core/constants/color_constants.dart';
// import 'package:spotify/core/constants/image_constants.dart';
// import 'package:spotify/view/search_section/search_section.dart';
// import 'package:spotify/view/songs_screen/songs_screen.dart';

// class LibraryScreen extends StatefulWidget {
//   const LibraryScreen({super.key});

//   @override
//   State<LibraryScreen> createState() => _LibraryScreenState();
// }

// class _LibraryScreenState extends State<LibraryScreen> {
//   String selectedCategory = "All";

//   final List<Map<String, String>> allRecents = [
//     {
//       'title': 'Liked Songs',
//       'subtitle': 'Playlist',
//       'img': ImageConstants.likedsong,
//       'disc': 'All your favorite songs saved in one place.',
//     },
//     {
//       'title': 'Feel Good',
//       'subtitle': 'Playlist',
//       'img': ImageConstants.feelGood,
//       'disc': 'Upbeat tracks to boost your mood anytime.',
//     },
//     {
//       'title': 'Gym Motivation',
//       'subtitle': 'Album',
//       'img': ImageConstants.gymMotivation,
//       'disc': 'High-energy songs to keep your workout strong.',
//     },
//     {
//       'title': 'Tamil Hits',
//       'subtitle': 'Album',
//       'img': ImageConstants.tamilSongs,
//       'disc': 'The best Tamil songs from top artists and movies.',
//     },
//     {
//       'title': 'Travel Songs',
//       'subtitle': 'Playlist',
//       'img': ImageConstants.travelSongs,
//       'disc': 'Perfect tunes to make your journeys unforgettable.',
//     },
//     {
//       'title': 'Raataan Lamiyan',
//       'subtitle': 'Artist',
//       'img': ImageConstants.raataan,
//       'disc': 'Melodious Punjabi hits from Raataan Lambiyan fame.',
//     },
//     {
//       'title': 'Chand Sifarish',
//       'subtitle': 'Artist',
//       'img': ImageConstants.chandsifarish,
//       'disc': 'Romantic Bollywood classics that never get old.',
//     },
//     {
//       'title': 'Perilla Rajyath',
//       'subtitle': 'Artist',
//       'img': ImageConstants.perillarajyath,
//       'disc': 'Popular Malayalam indie hits by Perilla Rajyath.',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final filteredRecents = selectedCategory == "All"
//         ? allRecents
//         : allRecents
//               .where(
//                 (item) =>
//                     item['subtitle'] ==
//                     selectedCategory.substring(0, selectedCategory.length - 1),
//               )
//               .toList();

//     return Scaffold(
//       backgroundColor: ColorConstants.black,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: ColorConstants.black,
//         title: Row(
//           children: [
//             InkWell(
//               child: CircleAvatar(
//                 backgroundColor: Colors.pink,
//                 child: Text(
//                   "A",
//                   style: TextStyle(
//                     fontSize: 25,
//                     color: ColorConstants.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 15),
//             Text(
//               "Your Library",
//               style: TextStyle(
//                 fontSize: 28,
//                 color: ColorConstants.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const Spacer(),
//             InkWell(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const SearchSection(),
//                   ),
//                 );
//               },
//               child: Icon(Icons.search, color: ColorConstants.white, size: 30),
//             ),
//             const SizedBox(width: 10),
//             Icon(Icons.add, color: ColorConstants.white, size: 40),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               // 🔹 Category filter chips
//               Row(
//                 spacing: 10,
//                 children: [
//                   _categoryChip("Playlists"),
//                   _categoryChip("Albums"),
//                   _categoryChip("Artists"),
//                 ],
//               ),
//               const SizedBox(height: 20),

//               // 🔹 "Recents" title
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Recents",
//                     style: TextStyle(
//                       color: ColorConstants.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),

//               // 🔹 ListView.builder for recents
//               ListView.builder(
//                 shrinkWrap: true, // let it fit inside SingleChildScrollView
//                 physics:
//                     const NeverScrollableScrollPhysics(), // no inner scroll
//                 itemCount: filteredRecents.length,
//                 itemBuilder: (context, index) {
//                   final item = filteredRecents[index];
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 20),
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => SongsScreen(
//                               text11: item['title']!,
//                               title: item['title']!,
//                               subtitle: item['disc']!,
//                               image: item['img']!,
//                             ),
//                           ),
//                         );
//                       },
//                       child: _recents(
//                         title: item['title']!,
//                         subtitle: item['subtitle']!,
//                         img: item['img']!,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // 🔸 Category chip builder
//   Widget _categoryChip(String label) {
//     bool isSelected = selectedCategory == label;
//     return InkWell(
//       onTap: () {
//         setState(() {
//           selectedCategory = label;
//         });
//       },
//       child: Container(
//         height: 40,
//         width: 100,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(25),
//           color: isSelected ? Colors.green : ColorConstants.signUpTextfield,
//         ),
//         child: Center(
//           child: Text(
//             label,
//             style: TextStyle(
//               color: ColorConstants.white,
//               fontSize: 18,
//               fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // 🔸 Recents row widget
//   Row _recents({
//     required String title,
//     required String subtitle,
//     required String img,
//   }) {
//     return Row(
//       children: [
//         SizedBox(
//           height: 80,
//           width: 80,
//           child: Image.asset(img, fit: BoxFit.cover),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(color: ColorConstants.white, fontSize: 20),
//               ),
//               Text(
//                 subtitle,
//                 style: TextStyle(color: ColorConstants.grey, fontSize: 15),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:spotify/core/constants/color_constants.dart';
// import 'package:spotify/view/global_widgets/audio_controller.dart';
// import 'package:spotify/view/mini_player_screen/mini_player.dart';
// import 'package:spotify/view/home_screen/home_screen.dart';
// import 'package:spotify/view/library_screen/library_screen.dart';
// import 'package:spotify/view/premium_screen/premium_screen.dart';
// import 'package:spotify/view/search_screen/search_screen.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   int num = 0;

//   static const List<Widget> screens = <Widget>[
//     HomeScreen(),
//     SearchScreen(),
//     LibraryScreen(),
//     PremiumScreen(),
//     PremiumScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: ColorConstants.black,
//         selectedItemColor: Colors.green,
//         unselectedItemColor: Colors.grey,
//         currentIndex: num,
//         onTap: (value) {
//           setState(() {
//             num = value;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
//           BottomNavigationBarItem(icon: Icon(Icons.library_add), label: "Library"),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Premium"),
//           BottomNavigationBarItem(icon: Icon(Icons.add), label: "Create"),
//         ],
//       ),
//       body: Stack(
//         children: [
//           screens[num],
//           // MiniPlayer is global and reads from AudioController
//           const MiniPlayer(),
//         ],
//       ),
//     );
//   }
// }

