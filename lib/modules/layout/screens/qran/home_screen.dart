import 'package:flutter/material.dart';
import 'package:islami/model/core/themes/app_theme.dart';
import 'package:islami/model/core/themes/ui_utils.dart';
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
  int currentIndex = 2;  // Default to AppHome (index 2)
  PageController _pageController = PageController(initialPage: 2);

  List<Widget> screens = [
    QuranScreen(),
    HadethScreen(),
    AppHome(),  // AppHome as the main screen
    SebhaScreen(),
    RadioScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    bool isDark = AppTheme.isDark;

    return CustomSplash(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              currentIndex = 2;  // Navigate to AppHome
              _pageController.jumpToPage(currentIndex);
            });
          },
          shape: CircleBorder(
            side: BorderSide(
              color: const Color(0xffB7935F).withOpacity(.3), width: 2,
            ),
          ),
          child: const Icon(
            Icons.home,
            size: 34,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          notchMargin: 9,
          height: 90,
          elevation: 9,
          padding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: isDark ? const Color(0xffB7935F) : const Color(0xff141A2E),
          shape: const CircularNotchedRectangle(),
          child: BottomNavigationBar(
            currentIndex: currentIndex < 2 ? currentIndex : currentIndex - 1,
            onTap: (index) {
              setState(() {
                currentIndex = index < 2 ? index : index + 1;
                _pageController.jumpToPage(currentIndex);
              });
            },
            items:  [
              BottomNavigationBarItem(
                icon:const ImageIcon(
                  AssetImage("assets/icons/icon_quran.png"),
                  size: 34,
                ),
                label: appTranslation(context).qranTitle,
              ),
              BottomNavigationBarItem(
                icon:const ImageIcon(
                  AssetImage("assets/icons/icon_hadeth.png"),
                  size: 34,
                ),
                label: appTranslation(context).hadeth,
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
