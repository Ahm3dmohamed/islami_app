import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: GoogleFonts.elMessiri().fontFamily,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Color(0xff242424),
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
    ),
       
    
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xffB7935F),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xff242424),
      unselectedItemColor: Colors.white,
      showUnselectedLabels: false,
    ),
  );
  static ThemeData darkTHeme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: GoogleFonts.elMessiri().fontFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: GoogleFonts.elMessiri(
          color: Colors.black, fontSize: 28, fontWeight: FontWeight.w500),
      centerTitle: true,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff141A2E),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xffFACC1D),
      unselectedItemColor: Colors.white,
      showUnselectedLabels: false,
    ),
  );
}
