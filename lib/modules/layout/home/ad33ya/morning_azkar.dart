import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/modules/splash/screens/custom_splash.dart';

class MorningAzkar extends StatefulWidget {
  static const String routeName = "MorningAzkar";
  MorningAzkar({super.key});

  @override
  State<MorningAzkar> createState() => _MorningAzkarState();
}

class _MorningAzkarState extends State<MorningAzkar> {
  List<String> adhkarEls33bah = [];
  List<int> do33aCounters = [];

  @override
  void initState() {
    super.initState();
    loadAdhkarEls33bah();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return CustomSplash(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'أذكار الصباح ',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        body: adhkarEls33bah.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: adhkarEls33bah.length,
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
                            color: index < do33aCounters.length &&
                                    do33aCounters[index] == 0
                                ? Colors.blueGrey
                                : Color(0xffB7935F).withOpacity(.2),
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
                                    adhkarEls33bah[index],
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

  void loadAdhkarEls33bah() async {
    try {
      String do33aFile =
          await rootBundle.loadString("assets/Azkaar_elsab33h.txt");
      List<String> azkarLines = do33aFile.split('\n');
      setState(() {
        adhkarEls33bah = azkarLines;
        do33aCounters = List<int>.filled(adhkarEls33bah.length, 3);
      });
    } catch (e) {
      print("Error loading Doaa file: $e");
    }
  }
}
