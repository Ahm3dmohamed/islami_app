import 'package:flutter/material.dart';
import 'dart:math'; 

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
      // Duration for each step
      duration: const Duration(milliseconds: 500), 
      vsync: this,
    );
    _animation = Tween<double>(begin: 0,end: 1).animate(_controller)
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
   // Full rotation divided by 33 taps
    rotationAngle = 2 * pi / 33; 

   // Start the animation
    _controller.forward(from: 0); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Sebha"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 34),
            child:
             Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 110),
                    child: Image.asset(
                      'assets/images/head of seb7a.png',
                      scale: 1.6,
                    ),
                  ),
                  Transform.rotate(
                    angle: rotationAngle * _animation.value, // Rotate incrementally
                    child: Image.asset(
                      'assets/images/body_sebha_logo.png',
                      scale: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          
          ),
          const SizedBox(height: 34),
          const Text(
            'عدد التسبيحات',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xffB7935F).withOpacity(.4),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(
              child: Text(
                tasbeehCount.toString(),
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
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
    );
  }
}
