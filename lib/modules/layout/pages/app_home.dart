import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/core/themes/ui_utils.dart';
import 'package:islami/modules/layout/home/adhar_screens/after_prayer_adhkar.dart';
import 'package:islami/modules/layout/home/adhar_screens/morning_azkar.dart';
import 'package:islami/modules/layout/home/adhar_screens/do33a.dart';
import 'package:islami/modules/layout/home/adhar_screens/estukaz_adhkar.dart';
import 'package:islami/modules/layout/home/adhar_screens/night_adhkar.dart';
import 'package:islami/modules/layout/pages/settings/settings.dart';
import '../home/adhar_screens/sleep_adhkar.dart';

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
                color: const Color(0xffB7935F).withOpacity(.6),
              )),
          title: Text(
            appTranslation(context).appTitle,
            style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.normal,
                fontFamily: 'Qran'),
          ),
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
                            top: 12, left: 24, bottom: 12, right: 24),
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
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(18),
                                    ),
                                    shape: BoxShape.rectangle),
                                child: Center(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'أذكار الصباح',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
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
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(18),
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Center(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'أذكار المساء',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12, left: 24, bottom: 12, right: 24),
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
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(18),
                                    ),
                                    shape: BoxShape.rectangle),
                                child: Center(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'أذكار الإستيقاظ',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
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
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12, left: 24, bottom: 12, right: 24),
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
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(18),
                                    ),
                                    shape: BoxShape.rectangle),
                                child: Center(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'أذكار بعد الصلاة',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
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
                                          .bodySmall),
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
