import 'package:flutter/material.dart';
import 'package:islami/model/core/themes/ui_utils.dart';
import 'package:islami/modules/layout/pages/app_home.dart';
import 'package:islami/modules/layout/pages/hadeth/hadeeth_screen.dart';
import 'package:islami/modules/layout/pages/qran/quran_screen.dart';
import 'package:islami/modules/layout/pages/radio_screen.dart';
import 'package:islami/modules/layout/pages/tasbeeh/sebha_screen.dart';
import 'package:islami/modules/splash/screens/custom_splash.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 2);

  final List<Widget> screens = [
    QuranScreen(),
    HadethScreen(),
    AppHome(),      // the main screen
    SebhaScreen(),
    RadioScreen(),
  ];
    int currentIndex = 2;                 // Default  AppHome (index 2)


  @override
  Widget build(BuildContext context) {
    return CustomSplash(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: screens,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
              currentIndex = 2;               // Navigate to AppHome
            setState(() {
            
              _pageController.jumpToPage(currentIndex);
            });
          },
          shape: CircleBorder(
            side: BorderSide(
              color: const Color(0xffB7935F).withOpacity(0.3),
              width: 2,
            ),
          ),
          child: const Icon(
            Icons.home,
            size: 34,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          notchMargin: 12,
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: const CircularNotchedRectangle(),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
                _pageController.jumpToPage(currentIndex);
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage("assets/icons/icon_quran.png"),
                  size: 34,
                ),
                label: appTranslation(context).qranTitle,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage("assets/icons/icon_hadeth.png"),
                  size: 34,
                ),
                label: appTranslation(context).hadeth,
              ),  const BottomNavigationBarItem(
                label: "",
                icon: SizedBox(),
                ),
              
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage("assets/icons/icon_sebha.png"),
                  size: 34,
                ),
                label: appTranslation(context).tasbeehTab,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage("assets/icons/icon_radio.png"),
                  size: 34,
                ),
                label: appTranslation(context).radioTab,
              ),
            ],
          ),
        ),
      ),
    );
  }
}







