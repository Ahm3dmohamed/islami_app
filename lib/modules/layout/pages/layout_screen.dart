import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islami/modules/layout/pages/home_screen.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = "LayoutScreen";
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _SplashState();
}

class _SplashState extends State<LayoutScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          HomeScreen.routeName,
          (route) => false,
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    
    return Image.asset( "assets/images/splash.png");
  }
}
