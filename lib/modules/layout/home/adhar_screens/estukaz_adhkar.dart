import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/modules/splash/screens/custom_splash.dart';

class EstukazAdhkar extends StatefulWidget {
  static const String routeName = "EstukazAdhkar";
  const EstukazAdhkar({super.key});

  @override
  State<EstukazAdhkar> createState() => _EstukazAdhkarState();
}

class _EstukazAdhkarState extends State<EstukazAdhkar> {
  List<int> do33aCounters = [];

  @override
  void initState() {
    super.initState();
    loadEstukazAdhkar();
  }

  List adhkarVerses = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return CustomSplash(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Text(
                "أذكار الإستيقاظ",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Qran'),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: adhkarVerses.isEmpty
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemCount: adhkarVerses.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if (do33aCounters[index] > 0) {
                            setState(() {
                              do33aCounters[index]--;
                            });
                          }
                        },
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                  color: index < do33aCounters.length &&
                                          do33aCounters[index] == 0
                                      ? Colors.grey
                                      : Color(0xffB7935F).withOpacity(.1),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  elevation: 4,
                                  child: Padding(
                                      padding:
                                          EdgeInsets.all(screenWidth * .09),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Divider(
                                            color: Color(0xffB7935F),
                                            thickness: 3,
                                          ),
                                          const SizedBox(height: 18),
                                          Text(
                                            adhkarVerses[index],
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
                                      )))
                            ]),
                      );
                    },
                  )));
  }

  void loadEstukazAdhkar() async {
    try {
      String estukazAdhkarFile =
          await rootBundle.loadString("assets/morrning_adhkar.txt");
      List<String> adhkarLines = estukazAdhkarFile.split('\n');
      setState(() {
        adhkarVerses = adhkarLines;
        do33aCounters = List<int>.filled(adhkarVerses.length, 3);
      });
    } catch (e) {
      print("Error loading Doaa file: $e");
    }
  }
}
