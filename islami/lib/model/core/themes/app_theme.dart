import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppTheme {
  static final  Color light = Colors.white;
  static final Color lightPrimary = Color(0xFFB7935F);
  static final Color darkPrimary = Color(0xFF14142E);
  static final Color darkSecondery = Color.fromARGB(15, 247, 201, 19);


  static ThemeData lightTheme = ThemeData(
      
    textTheme:  const TextTheme(
      headlineSmall: TextStyle(
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontFamily: 'Qran'),
      headlineMedium: TextStyle(
          fontSize: 30,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontFamily: 'Qran'),
      headlineLarge: TextStyle(
          color: Colors.black,
          fontSize: 44,
          fontWeight: FontWeight.bold,
          fontFamily: 'Qran'),
      bodySmall: TextStyle(
          color: Colors.black,
          fontSize: 21,
          fontWeight: FontWeight.normal,
          // fontFamily: 'Qran'
          ),
      bodyMedium: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.normal,
          // fontFamily: 'Qran'
          ),
      bodyLarge: TextStyle(
          color: Colors.black,
          fontSize: 34,
          fontWeight: FontWeight.bold,
          // fontFamily: 'Qran'
          ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: GoogleFonts.elMessiri().fontFamily,
    appBarTheme:  const AppBarTheme(
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
    
    cardTheme:const  CardTheme(
      color: Colors.white,
      surfaceTintColor: null,
    ),
    bottomNavigationBarTheme:const  BottomNavigationBarThemeData(
      backgroundColor: Color(0xffB7935F),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xff242424),
      unselectedItemColor: Colors.white,
      showUnselectedLabels: false,
    ),
      bottomSheetTheme:  BottomSheetThemeData(
      backgroundColor: light,
    ),
  


  colorScheme: ColorScheme.fromSeed(
      seedColor: darkPrimary,
      primary: darkPrimary,
      onPrimary: Colors.white,
      secondary: const Color(0xFFB7935F),
      onSecondary: Colors.black,
    ),


  );
  
  
  
  
  
  
  
  static ThemeData darkTHeme = ThemeData(

    dialogTheme: DialogTheme(
      backgroundColor: const Color(0xffB7935F).withOpacity(.2),
    ),
      bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: darkPrimary,
    ),
    textTheme:   const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.normal,
        fontFamily: 'Qran',
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.normal,
          fontFamily: 'Qran'),
      headlineLarge: TextStyle(
          fontSize: 44,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'Qran'),
      bodySmall: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.normal,
          // fontFamily: 'Qran'
          ),
      bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.normal,
          // fontFamily: 'Qran'
          ),
      bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: 34,
          fontWeight: FontWeight.bold,
          fontFamily: 'Qran'
          ),
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
      secondary: lightPrimary,
      onSecondary: Colors.black,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF14142E),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xFFB7935F),
      elevation: 0,
      showSelectedLabels: true,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: false,
    ),
  );
}
