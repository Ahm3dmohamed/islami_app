import 'package:flutter/material.dart';
import 'package:islami/modules/layout/screens/settings/setting_lang_tab.dart';
import 'package:islami/modules/layout/screens/settings/setting_theme_tab.dart';
import 'package:islami/modules/splash/screens/custom_splash.dart';

class Settings extends StatelessWidget {
  static const String routeName = "Settings";
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSplash(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Text(
              "Theme",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () {
                showThemeBottomSheet(context);
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: const Color(0xffB7935F))),
                  child: Center(
                      child: Text(
                    'Light',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(
                            0xffB7935F,
                          ),
                        ),
                  ))),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              "Langage",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () {
                showlanguageBottomSheet(context);
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: const Color(0xffB7935F))),
                  child: Center(
                      child: Text(
                    'English',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(
                            0xffB7935F,
                          ),
                        ),
                  ))),
            ),
          ],
        ),
      ),
    ));
  }

  void showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SettingThemeTab();
        });
  }
}

void showlanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SettingLangTab();
      });
}
