import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/modules/splash/screens/custom_splash.dart';

class NightAdhkar extends StatefulWidget {
  static const String routeName = 'NightAdhkar';
  const NightAdhkar({super.key});

  @override
  State<NightAdhkar> createState() => _NightAdhkarState();
}

class _NightAdhkarState extends State<NightAdhkar> {
  List <String>adhkarElmas33a = [];
    List <int>do33aCounters = [];

  @override
  void initState() {
    super.initState();
    loadAdhkarElmas33a();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return CustomSplash(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'أذكار المساء ',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        body: adhkarElmas33a.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: adhkarElmas33a.length,
                itemBuilder: (context, index) {
                  print(adhkarElmas33a.length);

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
                                : Colors.white,
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
                                    adhkarElmas33a[index],
                                    textDirection: TextDirection.rtl,
                                    style: const TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
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

  void loadAdhkarElmas33a() async {
    try {
      String do33aFile =
          await rootBundle.loadString("assets/azkar_elmas33.txt");
      List<String> azkarLines = do33aFile.split('\n');
      setState(() {
        adhkarElmas33a = azkarLines;
        do33aCounters = List<int>.filled(adhkarElmas33a.length, 3);
      });
    } catch (e) {
      print("Error loading Doaa file: $e");
    }
  }
}
