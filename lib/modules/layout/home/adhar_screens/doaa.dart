import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/modules/splash/screens/custom_splash.dart';

class Do33aDetails extends StatefulWidget {
  static const String routeName = "Do33a Details";

  const Do33aDetails({super.key});

  @override
  State<Do33aDetails> createState() => _Do33aDetailsState();
}

class _Do33aDetailsState extends State<Do33aDetails> {
  List<String> eachDo33a = [];
  List<int> do33aCounters = [];

  @override
  void initState() {
    super.initState();
    loadDo33aFile();
  }

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return CustomSplash(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'أدعية مختارة',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                fontFamily: 'Qran'),
          ),
        ),
        body: eachDo33a.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: eachDo33a.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (do33aCounters[index] == 1) {
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
                                  Text(
                                    eachDo33a[index],
                                    textDirection: TextDirection.rtl,
                                    style: const TextStyle(
                                        fontSize: 24, fontFamily: 'Qran'),
                                  ),
                                  const Divider(
                                    color: Color(0xffB7935F),
                                    thickness: 3,
                                  ),
                                  const SizedBox(height: 9),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        textDirection: TextDirection.rtl,
                                        'مره: ${index < do33aCounters.length ? do33aCounters[index] : 0}',
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ],
                                  ),
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

  void loadDo33aFile() async {
    try {
      String do33aFile = await rootBundle.loadString("assets/Doaa.txt");
      List<String> do33aLines = do33aFile.split('\n');
      setState(() {
        eachDo33a = do33aLines;
        do33aCounters = List<int>.filled(eachDo33a.length, 1);
      });
    } catch (e) {
      print("Error loading Doaa file: $e");
    }
  }
}
