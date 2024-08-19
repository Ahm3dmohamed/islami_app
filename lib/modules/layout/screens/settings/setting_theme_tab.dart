import 'package:flutter/material.dart';

class SettingThemeTab extends StatelessWidget {
  const SettingThemeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        // color: const Color(0xffB7935F).withOpacity(.1),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Color(0xffB7935F), width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(44),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
                    SizedBox(height: 18,),
                    Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: const Color(0xffB7935F))),
                  child: Center(
                      child: Text(
                    'Dark',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(
                            0xffB7935F,
                          ),
                        ),
                  ))),
          ],
        ),
      ),
    );
  
  }
}
