import 'package:flutter/material.dart';
import 'package:islami/model/core/themes/app_theme.dart';

// ignore: must_be_immutable
class CustomSplash extends StatefulWidget {
  Widget child;
  CustomSplash({
    required this.child,
  });
  @override
  State<CustomSplash> createState() => _CustomSplashState();
}
class _CustomSplashState extends State<CustomSplash> {
  @override
  Widget build(BuildContext context) {
        bool isDark = AppTheme.isDark;

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage( isDark?'assets/images/home_dark_background.png': "assets/images/default_bg.png")),
      ),
      child: widget.child,
    );
  }
}
