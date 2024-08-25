import 'package:flutter/material.dart';
import 'package:islami/modules/layout/provider/theme_provider.dart';
import 'package:provider/provider.dart';

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
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    bool isDark = provider.isDarkEnabled();
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage( isDark?'assets/images/home_dark_background.png': "assets/images/default_bg.png")),
      ),
      child: widget.child,
    );
  }
}
