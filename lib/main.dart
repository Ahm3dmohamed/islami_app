import 'package:flutter/material.dart';
import 'package:islami/model/core/themes/app_theme.dart';
import 'package:islami/modules/layout/home/adhar_screens/after_prayer_adhkar.dart';
import 'package:islami/modules/layout/home/adhar_screens/morning_azkar.dart';
import 'package:islami/modules/layout/home/adhar_screens/night_adhkar.dart';
import 'package:islami/modules/layout/home/adhar_screens/sleep_adhkar.dart';
import 'package:islami/modules/layout/pages/hadeth/hadeth_details.dart';
import 'package:islami/modules/layout/pages/qran/sura_details.dart';
import 'package:islami/modules/layout/home/adhar_screens/do33a.dart';
import 'package:islami/modules/layout/home/adhar_screens/estukaz_adhkar.dart';
import 'package:islami/modules/layout/pages/app_home.dart';
import 'package:islami/modules/layout/pages/home_screen.dart';
import 'package:islami/modules/layout/pages/layout_screen.dart';
import 'package:islami/modules/layout/pages/settings/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/modules/layout/pages/tasbeeh/infinte_sebha.dart';
import 'package:islami/modules/layout/provider/local_provider.dart';
import 'package:islami/modules/layout/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = ThemeProvider.get(context);
    LocaleProvider localeProvider = LocaleProvider.get(context);

    return MaterialApp(
      theme: AppTheme.lightTheme,
      themeMode: themeProvider.currentTheme,
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
        HadethDetails.routeName: (context) => HadethDetails(),
        Settings.routeName: (context) => Settings(),
        InfinteSebha.routeName: (context) => InfinteSebha(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(localeProvider.currentLocale),
    );
  }
}
