import 'package:flutter/material.dart';
import 'dart:math';
import 'package:islami/model/core/themes/ui_utils.dart';
import 'package:islami/modules/layout/pages/settings/settings.dart';
import 'package:islami/modules/splash/screens/custom_splash.dart';

class InfinteSebha extends StatefulWidget {
  static const String routeName = "InfinteSebha";
  const InfinteSebha({super.key});
  @override
  State<InfinteSebha> createState() => _InfinteSebhaState();
}

class _InfinteSebhaState extends State<InfinteSebha>
    with SingleTickerProviderStateMixin {
  int tasbeehCount = 0;

  void incrementCounter() {
    setState(() {
      tasbeehCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomSplash(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              appTranslation(context).tasbeehTab,
              style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Qran'),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'عدد التسبيحات',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 55),
                  Container(
                    width: 80,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xffB7935F).withOpacity(.2),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text(
                        tasbeehCount.toString(),
                        style: const TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 44),
                  ElevatedButton(
                    onPressed: incrementCounter,
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromRadius(100),
                      shape: CircleBorder(
                          side: BorderSide(color: Color(0xffB7935F), width: 2)),
                      backgroundColor: const Color(0xffB7935F).withOpacity(.4),
                      padding: const EdgeInsets.all(22),
                    ),
                    child: Text(
                      "تسبيح",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
