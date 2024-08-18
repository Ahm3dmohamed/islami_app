import 'package:flutter/material.dart';
import 'package:islami/model/core/themes/ui_utils.dart';
import 'package:islami/modules/splash/screens/custom_splash.dart';

class RadioScreen extends StatelessWidget {
    static const String routeName = "RadioScreen";

  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSplash(
      child: Scaffold(
   appBar: AppBar(title:  Text(appTranslation(context).radioTab,),),
   body: Column(
    children: [
      Container(
        padding: const EdgeInsets.only(top: 120),
        child: Center(
          child: Image.asset('assets/images/radio_image.png'),
        ),
      )
    ],
   ),
      ),
    );
  }
}