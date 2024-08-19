import 'package:flutter/material.dart';

class SettingLangTab extends StatelessWidget {
  const SettingLangTab({super.key});

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
            Center(
                child: Text(
              'العربية',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(
                      0xffB7935F,
                    ),
                  ),
            )),
                    const SizedBox(height: 18,),
                    Center(
                        child: Text(
                      'English',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: const Color(
                              0xffB7935F,
                            ),
                          ),
                    )),
          ],
        ),
      ),
    );
  
  }
}