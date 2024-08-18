import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/core/themes/app_theme.dart';
import 'package:islami/model/core/themes/ui_utils.dart';
import 'package:islami/modules/layout/home/ad33ya/after_prayer_adhkar.dart';
import 'package:islami/modules/layout/home/ad33ya/morning_azkar.dart';
import 'package:islami/modules/layout/home/ad33ya/do33a.dart';
import 'package:islami/modules/layout/home/ad33ya/estukaz_adhkar.dart';
import 'package:islami/modules/layout/home/ad33ya/night_adhkar.dart';
import 'package:islami/modules/layout/screens/settings.dart';
import '../home/ad33ya/sleep_adhkar.dart';

class AppHome extends StatefulWidget {
  static const String routeName = "AppHome";

  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  List<String> eachDo33a = [];
  String currentDo33a =
      "اللهم اغفر لي واهدني وارزقني عافني اعوذ بالله من ضيق يوم القيامه";
  void updateDo33a() {
    if (eachDo33a.isNotEmpty) {
      setState(() {
        currentDo33a = eachDo33a[Random().nextInt(eachDo33a.length)];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadDo33aFile();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Settings.routeName);
              },
              icon: Icon(
                Icons.settings,
                size: 44,
                color: Color(0xffB7935F).withOpacity(.6),
              )),
          title:  Text(appTranslation(context).appTitle),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            const Center(
                child: CircleAvatar(
              backgroundImage: AssetImage("assets/icons/moon.png"),
              radius: 66,
            )),
            const SizedBox(
              height: 18,
            ),
            TextButton(
                onPressed: updateDo33a,
                child: Card(
                  color: Color(0xffB7935F).withOpacity(.01),
                  margin: EdgeInsets.symmetric(
                      horizontal: screenHeight * .02,
                      vertical: screenWidth * .01),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: const BorderSide(color: Color(0xffB7935F)),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * .05),
                      child: Text(
                        currentDo33a,
                        style: TextStyle(
                            fontFamily: 'Qran',
                            fontSize: 18,
                            // color: AppTheme.light,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12, left: 24, bottom: 12,right: 24),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, MorningAzkar.routeName);
                              },
                              child: Container(
                                height: screenHeight * .09,
                                width: screenWidth * .40,
                                decoration: const BoxDecoration(
                                    border: Border.fromBorderSide(BorderSide(
                                        color: Color(0xffB7935F), width: 1.3)),
                                    // color: Colors.white.withOpacity(.5),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(18),
                                    ),
                                    shape: BoxShape.rectangle),
                                child: Center(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'أذكار الصباح',
                                    // style: TextStyle(
                                    //     fontFamily: 'Qran',
                                    //     color: AppTheme.light,
                                    //     fontSize: 18,
                                    //     fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, NightAdhkar.routeName);
                              },
                              child: Container(
                                height: screenHeight * .09,
                                width: screenWidth * .40,
                                decoration: const BoxDecoration(
                                  border: Border.fromBorderSide(BorderSide(
                                      color: Color(0xffB7935F), width: 1.3)),
                                  // color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(18),
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Center(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'أذكار المساء',
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12, left: 24, bottom: 12,right: 24),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, EstukazAdhkar.routeName);
                              },
                              child: Container(
                                height: screenHeight * .09,
                                width: screenWidth * .40,
                                decoration: const BoxDecoration(
                                    border: Border.fromBorderSide(BorderSide(
                                        color: Color(0xffB7935F), width: 1.3)),
                                    // color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(18),
                                    ),
                                    shape: BoxShape.rectangle),
                                child: Center(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'أذكار الإستيقاظ',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, SleepAdhkar.routeName);
                              },
                              child: Container(
                                height: screenHeight * .09,
                                width: screenWidth * .40,
                                decoration: const BoxDecoration(
                                  // color: Colors.white,
                                  border: Border.fromBorderSide(BorderSide(
                                      color: Color(0xffB7935F), width: 1.3)),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(18),
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Center(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'أذكار النوم',
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                                                    top: 12, left: 24, bottom: 12,right: 24),

                        
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AfterPrayerAdhkar.routeName);
                              },
                              child: Container(
                                height: screenHeight * .09,
                                width: screenWidth * .40,
                                decoration: const BoxDecoration(
                                    border: Border.fromBorderSide(BorderSide(
                                        color: Color(0xffB7935F), width: 1.3)),
                                    // color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(18),
                                    ),
                                    shape: BoxShape.rectangle),
                                child: Center(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'أذكار بعد الصلاة',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Do33aDetails.routeName);
                              },
                              child: Container(
                                height: screenHeight * .09,
                                width: screenWidth * .40,
                                decoration: const BoxDecoration(
                                  border: Border.fromBorderSide(BorderSide(
                                      color: Color(0xffB7935F), width: 1.3)),
                                  // color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(18),
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Center(
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      'أدعية مختارة',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void loadDo33aFile() async {
    try {
      String do33aFile = await rootBundle.loadString("assets/Doaa.txt");
      List<String> do33aLines = do33aFile.split('\n');
      setState(() {
        eachDo33a = do33aLines;
      });
    } catch (e) {
      print("Error loading Doaa file: $e");
    }
  }
}
