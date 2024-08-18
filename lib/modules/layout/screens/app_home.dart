import 'package:flutter/material.dart';
import 'package:islami/modules/layout/home/ad33ya/after_prayer_adhkar.dart';
import 'package:islami/modules/layout/home/ad33ya/morning_azkar.dart';
import 'package:islami/modules/layout/home/ad33ya/do33a.dart';
import 'package:islami/modules/layout/home/ad33ya/estukaz_adhkar.dart';
import 'package:islami/modules/layout/home/ad33ya/night_adhkar.dart';

import '../home/ad33ya/sleep_adhkar.dart';

class AppHome extends StatelessWidget {
  static const String routeName = "AppHome";
  

  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Islami"),
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
                onPressed: () {},
                child: Card(
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
                      child: const Text(
                        "اللهم اغفر لي واهدني وارزقني عافني اعوذ بالله من ضيق يوم القيامه",
                        style: TextStyle(
                            fontFamily: 'Qran',
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 24, bottom: 12),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MorningAzkar.routeName);
                    },
                    child: Container(
                      height: screenHeight * .09,
                      width: screenWidth * .40,
                      decoration: const BoxDecoration(
                          border: Border.fromBorderSide(
                              BorderSide(color: Color(0xffB7935F), width: 1.3)),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                          shape: BoxShape.rectangle),
                      child: const Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'أذكار الصباح',
                          style: TextStyle(
                              fontFamily: 'Qran',
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, NightAdhkar.routeName);
                    },
                    child: Container(
                      height: screenHeight * .09,
                      width: screenWidth * .40,
                      decoration: const BoxDecoration(
                        border: Border.fromBorderSide(
                            BorderSide(color: Color(0xffB7935F), width: 1.3)),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                        shape: BoxShape.rectangle,
                      ),
                      child: const Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'أذكار المساء',
                          style: TextStyle(
                              fontFamily: 'Qran',
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 24, bottom: 12),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, EstukazAdhkar.routeName);
                    },
                    child: Container(
                      height: screenHeight * .09,
                      width: screenWidth * .40,
                      decoration: const BoxDecoration(
                          border: Border.fromBorderSide(
                              BorderSide(color: Color(0xffB7935F), width: 1.3)),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                          shape: BoxShape.rectangle),
                      child: const Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'أذكار الإستيقاظ',
                          style: TextStyle(
                              fontFamily: 'Qran',
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, SleepAdhkar.routeName);
                    },
                    child: Container(
                      height: screenHeight * .09,
                      width: screenWidth * .40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border.fromBorderSide(
                            BorderSide(color: Color(0xffB7935F), width: 1.3)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                        shape: BoxShape.rectangle,
                      ),
                      child: const Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'أذكار النوم',
                          style: TextStyle(
                              fontFamily: 'Qran',
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 18,
                left: 26,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AfterPrayerAdhkar.routeName);
                    },
                    child: Container(
                      height: screenHeight * .09,
                      width: screenWidth * .40,
                      decoration: const BoxDecoration(
                          border: Border.fromBorderSide(
                              BorderSide(color: Color(0xffB7935F), width: 1.3)),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                          shape: BoxShape.rectangle),
                      child: const Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'أذكار بعد الصلاة',
                          style: TextStyle(
                              fontFamily: 'Qran',
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Do33aDetails.routeName);
                    },
                    child: Container(
                      height: screenHeight * .09,
                      width: screenWidth * .40,
                      decoration: const BoxDecoration(
                        border: Border.fromBorderSide(
                            BorderSide(color: Color(0xffB7935F), width: 1.3)),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                        shape: BoxShape.rectangle,
                      ),
                      child: const Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'أدعية مختارة',
                          style: TextStyle(
                              fontFamily: 'Qran',
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
