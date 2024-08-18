import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/modules/layout/screens/qran/sura_model.dart';
import 'package:islami/modules/splash/screens/custom_splash.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "SuraDetails";

  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];
  List<String> ayaNum = [];

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as SuraModel;
    // @override
    // void initState() {
    //   super.initState();
    //   loadSuraFile(model.index);
    // }

    if (verses.isEmpty) {
      loadSuraFile(model.index);
    }

    return CustomSplash(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: Colors.transparent,
        title: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Text(
              model.suraName,
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              model.suraBasmala,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Card(
           color: Color(0x80B7935F).withOpacity(.1),

          margin: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          elevation: 2,
          shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Color(0xffB7935F),
              ),
              borderRadius: BorderRadius.circular(24)),
          child: verses.isNotEmpty
              ? Padding( 

                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: verses.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              '  ${verses[index]}${{index + 1}}',
                            style:Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        );
                      }),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )
          // child:
          // Text(
          //   textDirection: TextDirection.rtl,
          //   verses[index],
          //   style: TextStyle(
          //     fontSize: 24,
          //     fontFamily: 'Qran',
          //   ),
          // ),
          ),
    ));
  }

  loadSuraFile(int index) async {
    String file = await rootBundle.loadString("assets/Suras/${index + 1}.txt");
    List<String> suraLines = file.trim().split('\n');
    List<String> aya = file.split('assets/fonts/AyatQuran7-8OMy0.ttf');
    setState(() {
      verses = suraLines;
      ayaNum = aya;
    });
  }
}
