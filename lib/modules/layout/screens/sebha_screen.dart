import 'package:flutter/material.dart';
import 'dart:math';

import 'package:islami/model/core/themes/ui_utils.dart'; 

class SebhaScreen extends StatefulWidget {
  static const String routeName = "SebhaScreen";
  const SebhaScreen({super.key});
  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen>
    with SingleTickerProviderStateMixin {
  final List<String> _tasbeehPhrases = [
    'سبحان الله', // Subhan Allah
    'الحمدلله',  // Alhamdulillah
    'الله أكبر'   // Allahu Akbar
  ];
  int tasbeehCount = 0;
  int currentRound = 0;
  double rotationAngle = 0.0; // Current angle for rotation
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() { 
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500), 
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void incrementCounter() {
    tasbeehCount++;
    if (tasbeehCount >= 33) {
      tasbeehCount = 0;
      currentRound = (currentRound + 1) % 3;
    }
    rotationAngle = 2 * pi / 33; 
    _controller.forward(from: 0); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(appTranslation(context).tasbeehTab),
      ),
      body: Padding(
            padding: const EdgeInsets.only(top: 12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 9, right: 12,left: 12),
              child: Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 0,
                          child: Container(
                            padding: const EdgeInsets.only(left: 110),
                            child: Image.asset(
                              'assets/images/head of seb7a.png',
                              scale: 1.4,
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: rotationAngle * _animation.value,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 49,bottom: 34),
                            child: Image.asset(
                              'assets/images/body_sebha_logo.png',
                              scale: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              'عدد التسبيحات',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: incrementCounter,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffB7935F),
                padding: const EdgeInsets.all(18),
              ),
              child: Text(
                _tasbeehPhrases[currentRound],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
