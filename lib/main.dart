import 'package:flutter/material.dart';
import 'package:islami/model/core/themes/app_theme.dart';
import 'package:islami/modules/layout/home/ad33ya/after_prayer_adhkar.dart';
import 'package:islami/modules/layout/home/ad33ya/morning_azkar.dart';
import 'package:islami/modules/layout/home/ad33ya/night_adhkar.dart';
import 'package:islami/modules/layout/home/ad33ya/sleep_adhkar.dart';
import 'package:islami/modules/layout/screens/hadeth/hadeth_details.dart';
import 'package:islami/modules/layout/screens/qran/sura_details.dart';
import 'package:islami/modules/layout/home/ad33ya/do33a.dart';
import 'package:islami/modules/layout/home/ad33ya/estukaz_adhkar.dart';
import 'package:islami/modules/layout/screens/app_home.dart';
import 'package:islami/modules/layout/screens/qran/home_screen.dart';
import 'package:islami/modules/layout/screens/layout_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.system,
        darkTheme: AppTheme.darkTHeme,
        debugShowCheckedModeBanner: false,
        initialRoute: LayoutScreen.routeName,
        routes: {
          AppHome.routeName: (context) => AppHome(),
          HomeScreen.routeName: (context) => HomeScreen(),
          LayoutScreen.routeName: (context) => LayoutScreen(),
          SuraDetails.routeName: (context) => SuraDetails(),
          Do33aDetails.routeName: (context) => Do33aDetails(),
          EstukazAdhkar.routeName: (context) => EstukazAdhkar(),
          MorningAzkar.routeName: (context) => MorningAzkar(),
          NightAdhkar.routeName: (context) => NightAdhkar(),
          SleepAdhkar.routeName: (context) => SleepAdhkar(),
          AfterPrayerAdhkar.routeName: (context) => AfterPrayerAdhkar(),
          HadethDetails.routeName :(context)=> HadethDetails(),
        });
  }
}
