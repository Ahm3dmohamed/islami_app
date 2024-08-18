import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/modules/splash/screens/custom_splash.dart';

class AfterPrayerAdhkar extends StatefulWidget {
  static const String routeName = 'AfterPrayerAdhkar';
  AfterPrayerAdhkar({super.key});

  @override
  State<AfterPrayerAdhkar> createState() => _AfterPrayerAdhkarState();
}

class _AfterPrayerAdhkarState extends State<AfterPrayerAdhkar> {
  @override
  void initState() {
    super.initState();
    loadAfterPrayerAdhkar();
  }

  List<String> afterPrayerAdhkar = [];

  List<int> do33aCounters = [];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return CustomSplash(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'أذكار بعد الصلاة ',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        body: afterPrayerAdhkar.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: afterPrayerAdhkar.length,
                itemBuilder: (context, index) {
                  print(afterPrayerAdhkar.length);

                  return GestureDetector(
                    onTap: () {
                      if (do33aCounters[index] > 0) {
                        setState(() {
                          do33aCounters[index]--;
                        });
                      }
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: ShapeBorder.lerp(const CircleBorder(
                                side: BorderSide(
                                    color: Color(
                                      0xffB7935F,
                                    ),
                                    width: 2)),Border.fromBorderSide(BorderSide(color: Color(
                                      0xffB7935F,
                                    ),style: BorderStyle.solid)),BorderSide.strokeAlignOutside),
                            color: index < do33aCounters.length &&
                                    do33aCounters[index] == 0
                                ? Colors.blueGrey
                                : Color(0xffB7935F).withOpacity(.1),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            elevation: 4,
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * .09),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Divider(
                                    color: Color(0xffB7935F),
                                    thickness: 3,
                                  ),
                                  const SizedBox(height: 18),
                                  Text(
                                    afterPrayerAdhkar[index],
                                    textDirection: TextDirection.rtl,
                                    style: const TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  const Divider(
                                    color: Color(0xffB7935F),
                                    thickness: 3,
                                  ),
                                  const SizedBox(height: 9),
                                  Text('${do33aCounters[index]} مره '),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }

  void loadAfterPrayerAdhkar() async {
    try {
      String do33aFile =
          await rootBundle.loadString("assets/adhkar_after_prayer.txt");
      List<String> azkarLines = do33aFile.split('\n');
      setState(() {
        afterPrayerAdhkar = azkarLines;
        do33aCounters = List<int>.filled(afterPrayerAdhkar.length, 34);
      });
    } catch (e) {
      print("Error loading Doaa file: $e");
    }
  }
}
