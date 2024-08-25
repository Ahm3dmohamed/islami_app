// import 'package:flutter/material.dart';
// import 'package:islami/modules/layout/screens/hadeeth_screen.dart';
// import 'package:islami/modules/layout/screens/settings.dart';

// class BtnNavBar extends StatefulWidget {
//   static const String routeName = "BtnNavBar";
//   @override
//   State<BtnNavBar> createState() => _BtnNavBarState();
// }

// class _BtnNavBarState extends State<BtnNavBar> {
//   // PageController _pageController = PageController();
//   // @override
//   // void dispose() {
//   //   _pageController.dispose();
//   // }

//   // void onTap(int index) {
//   //   setState(() {
//   //     selectedIndex == index;
//   //   });
//   //   _pageController.jumpToPage(index);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     int selectedIndex = 0;

//     return Scaffold(

//       floatingActionButton: IconButton(
//           onPressed: () {
//             setState(() {
//               selectedIndex = 2;
//             });
//           },
//           icon: Icon(Icons.home)),
//                           floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

//       body: BottomNavigationBar(
//           currentIndex: selectedIndex,
//           onTap: (index) {
//             setState(() {
//               selectedIndex = index;
//             });
//             // _pageController.jumpToPage(index);
//           },
//           items: [
//             const BottomNavigationBarItem(
//                 icon: ImageIcon(
//                   AssetImage(
//                     "assets/icons/icon_quran.png",
//                   ),
//                   size: 40,
//                 ),
//                 label: "Quran"),
//             const BottomNavigationBarItem(
//                 icon: ImageIcon(
//                   AssetImage("assets/icons/icon_hadeth.png"),
//                   size: 40,
//                 ),
//                 label: "Hadeeth"),
//             const BottomNavigationBarItem(
//                 icon: ImageIcon(
//                   AssetImage("assets/icons/icon_sebha.png"),
//                   size: 40,
//                 ),
//                 label: "Sebha"),
//             const BottomNavigationBarItem(
//                 icon: ImageIcon(
//                   AssetImage("assets/icons/icon_radio.png"),
//                   size: 40,
//                 ),
//                 label: "Radio"),
//             // BottomNavigationBarItem(
//             //     icon: IconButton(
//             //         onPressed: () {
//             //           // Navigator.push(context,
//             //           //     MaterialPageRoute(builder: (context) => Settings()));
//             //         },
//             //         icon: Icon(
//             //           Icons.settings,
//             //           size: 34,
//             //         )),
//             //     label: "Settings"),
//           ]),
//     );
//   }
// }
