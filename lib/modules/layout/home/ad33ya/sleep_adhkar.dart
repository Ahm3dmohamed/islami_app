import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/modules/splash/screens/custom_splash.dart';

class SleepAdhkar extends StatefulWidget {
  static const String routeName = 'SleepAdhkar';
  const SleepAdhkar({super.key});

  @override
  State<SleepAdhkar> createState() => _SleepAdhkarState();
}

class _SleepAdhkarState extends State<SleepAdhkar> {
  List<String> sleepAdhkar = [];
  List<int> do33aCounters = [];

  @override
  void initState() {
    super.initState();
    loadSleepAdhkar();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return CustomSplash(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'أذكار النوم ',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        body: sleepAdhkar.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: sleepAdhkar.length,
                itemBuilder: (context, index) {
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
                            shape: ShapeBorder.lerp(
                                Border.all(color: Color(0xffB7935F), width: 2),
                                Border(),
                                BorderSide.strokeAlignCenter),
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
                                    sleepAdhkar[index],
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
                                  Text('${do33aCounters[index]} مرات '),
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

  void loadSleepAdhkar() async {
    try {
      String do33aFile = await rootBundle.loadString("assets/night_adhkar.txt");
      List<String> azkarLines = do33aFile.split('\n');
      setState(() {
        sleepAdhkar = azkarLines;
        do33aCounters = List<int>.filled(sleepAdhkar.length, 3);
      });
    } catch (e) {
      print("Error loading Doaa file: $e");
    }
  }
}
