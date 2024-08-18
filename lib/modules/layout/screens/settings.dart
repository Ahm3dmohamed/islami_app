import 'package:flutter/material.dart';
import 'package:islami/modules/splash/screens/custom_splash.dart';

class Settings extends StatelessWidget {
  static const String routeName = "Settings";
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSplash(
        child: const Scaffold(
            backgroundColor: Colors.transparent,
            ));
  }
}
