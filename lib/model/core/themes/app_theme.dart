import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final Color light = Colors.white;

  static final Color lightPrimary = Color(0xFFB7935F);
  static final Color darkPrimary = Color(0xFF14142E);
  static final Color darkSecondery = Color(0xFFACC1D);
  static const bool isDark = false;
  static ThemeData lightTheme = ThemeData(
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontFamily: 'Qran'),
      headlineMedium: TextStyle(
          fontSize: 30,
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontFamily: 'Qran'),
      headlineLarge: TextStyle(
          color: Colors.black,
          fontSize: 44,
          fontWeight: FontWeight.bold,
          fontFamily: 'Qran'),
      bodySmall: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: 'Qran'),
      bodyMedium: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Qran'),
      bodyLarge: TextStyle(
          color: Colors.black,
          fontSize: 34,
          fontWeight: FontWeight.bold,
          fontFamily: 'Qran'),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: GoogleFonts.elMessiri().fontFamily,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
    ),
    // colorScheme: ColorScheme.fromSeed(
    //   seedColor: Color(0xffB7935F)),
    cardTheme: const CardTheme(
      color: Colors.white,
      surfaceTintColor: null,
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
    textTheme:  const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        fontFamily: 'Qran',
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          fontFamily: 'Qran'),
      headlineLarge: TextStyle(
          fontSize: 44,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'Qran'),
      bodySmall: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'Qran'),
      bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w500,
          fontFamily: 'Qran'),
      bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: 34,
          fontWeight: FontWeight.bold,
          fontFamily: 'Qran'),
    ),
    cardTheme: CardTheme(
      color: darkPrimary,
      surfaceTintColor: null,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: GoogleFonts.elMessiri().fontFamily,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: GoogleFonts.elMessiri(
          color: Colors.white, fontSize: 28, fontWeight: FontWeight.w500),
      centerTitle: true,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: darkPrimary,
      primary: darkPrimary,
      onPrimary: Colors.white,
      secondary: darkSecondery,
      onSecondary: Colors.black,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkPrimary,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: lightPrimary,
      elevation: 0,
      showSelectedLabels: true,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: false,
    ),
  );
}
