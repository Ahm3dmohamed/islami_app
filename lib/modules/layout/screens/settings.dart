import 'package:flutter/material.dart';
import 'package:islami/modules/splash/screens/custom_splash.dart';

class Settings extends StatelessWidget {
  static const String routeName = "Settings";
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSplash(
        child:  Scaffold(
          appBar:AppBar(
            title: const Text("Settings",style: TextStyle(
            ),),
          ),
            backgroundColor: Colors.transparent,
            body: Column(
              children: [

                Center(child: ElevatedButton(onPressed: (){}, child: Text('ThemeMode'))),
                Center(child: ElevatedButton(onPressed: (){}, child: Text('Language')))

              ],
            ),
            ));
  }
}
