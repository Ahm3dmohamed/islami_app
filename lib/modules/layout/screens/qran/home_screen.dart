import 'package:flutter/material.dart';
import 'package:islami/modules/layout/screens/app_home.dart';
import 'package:islami/modules/layout/screens/hadeth/hadeeth_screen.dart';
import 'package:islami/modules/layout/screens/qran/quran_screen.dart';
import 'package:islami/modules/layout/screens/radio_screen.dart';
import 'package:islami/modules/layout/screens/sebha_screen.dart';
import 'package:islami/modules/splash/screens/custom_splash.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 2;
  PageController _pageController = PageController(initialPage: 2);

  List labels = [
    "Quran",
    "Hadeeth",
    "Home",
    "Sebha",
    "Radio",
  ];

  List<Widget> screens = [
    QuranScreen(),
    HadethScreen(),
    AppHome(),
    SebhaScreen(),
    RadioScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomSplash(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              currentIndex = 2;
              _pageController.jumpToPage(currentIndex);
            });
          },
          shape: CircleBorder(
              side: BorderSide(
                  color: const Color(0xffB7935F).withOpacity(.5), width: 2)),
          child: Icon(
            Icons.home,
            color: currentIndex == 2
                ? const Color.fromARGB(255, 36, 36, 36)
                : Colors.white,
            size: 34,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          // height: 66,
          elevation: 1,
          notchMargin: 14,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: const Color(0xffB7935F),
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                    _pageController.jumpToPage(currentIndex);
                  });
                },
                icon: ImageIcon(
                  const AssetImage("assets/icons/icon_quran.png"),
                  color: currentIndex == 0
                      ? const Color(0xff242424)
                      : Colors.white,
                  size: 34,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                    _pageController.jumpToPage(currentIndex);
                  });
                },
                icon: ImageIcon(
                  const AssetImage("assets/icons/icon_hadeth.png"),
                  color: currentIndex == 1
                      ? const Color(0xff242424)
                      : Colors.white,
                  size: 34,
                ),
              ),
              const SizedBox(width: 40),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                    _pageController.jumpToPage(currentIndex);
                  });
                },
                icon: ImageIcon(
                  const AssetImage("assets/icons/icon_sebha.png"),
                  color: currentIndex == 3
                      ? const Color(0xff242424)
                      : Colors.white,
                  size: 34,
                ),
              ),
              // Space for the FAB
              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 4;
                    _pageController.jumpToPage(currentIndex);
                  });
                },
                icon: ImageIcon(
                  const AssetImage("assets/icons/icon_radio.png"),
                  color: currentIndex == 4
                      ? const Color(0xff242424)
                      : Colors.white,
                  size: 34,
                ),
              ),
            ],
          ),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          children: screens,
        ),
      ),
    );
  }
}
