import 'package:flutter/material.dart';
import 'package:islami/model/core/themes/ui_utils.dart';
import 'package:islami/modules/layout/provider/theme_provider.dart';

class SettingThemeTab extends StatelessWidget {
  const SettingThemeTab({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = ThemeProvider.get(context);

    return Container(
      height: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xffB7935F), width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(44),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(
              onTap: () {
                themeProvider.changeTheme(ThemeMode.light);
              },
              child: themeProvider.isDarkEnabled()
                  ? getUnselectedItem(context, appTranslation(context).light)
                  : getSelectedItem(context, appTranslation(context).light)),
          InkWell(
              onTap: () {
                themeProvider.changeTheme(ThemeMode.dark);
              },
              child: themeProvider.isDarkEnabled()
                  ? getSelectedItem(context, appTranslation(context).dark)
                  : getUnselectedItem(context, appTranslation(context).dark)),
        ]),
      ),
    );
  }

  Widget getSelectedItem(BuildContext context, String text) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xffB7935F))),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                Icon(
                  Icons.check,
                  color: Theme.of(context).colorScheme.secondary,
                )
              ],
            ))),
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }

  Widget getUnselectedItem(BuildContext context, String text) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xffB7935F))),
            child: Center(
                child:
                    Text(text, style: Theme.of(context).textTheme.bodyMedium))),
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }
}
