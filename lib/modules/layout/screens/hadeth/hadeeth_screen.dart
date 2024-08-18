import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/core/themes/ui_utils.dart';
import 'package:islami/modules/layout/screens/hadeth/hadeth_model.dart';
import 'package:islami/modules/layout/screens/hadeth/hadeth_title.dart';

class HadethScreen extends StatefulWidget {
  HadethScreen({super.key});

  @override
  
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  // List<String> hadeth = [];

  List<HadethModel> allHadeth = [];
  @override
  void initState() {
    super.initState();
    readFile();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  Text(appTranslation(context).hadeth,
          style: TextStyle(
        fontSize: 22,
        fontFamily: 'Qran'
      ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 34),
            child: Center(child: Image.asset('assets/icons/hadeth_logo.png')),
          ),
          const Divider(
            color: Color(0xffB7935F),
            thickness: 2,
          ),
          const Text(
            'الأحاديث',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          const Divider(
            thickness: 2,
            color: Color(0xffB7935F),
          ),
          Expanded(
            child: allHadeth.isNotEmpty
                ? ListView.separated(
                    itemCount: allHadeth.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          const Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.star_rate_sharp,
                                color: Color(0xffB7935F),
                              ),
                            ),
                          ),
                          HadethTitle(allHadeth[index],
                          
                          ),
                          const Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.star_rate_sharp,
                                color: Color(0xffB7935F),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        width: double.infinity,
                        height: 2,
                        margin: const EdgeInsets.symmetric(horizontal: 66),
                        // thickness: 2,

                        color: const Color(0xffB7935F),
                      );
                    },
                  )
                : const Center(child: CircularProgressIndicator()),
          )
        ],
      ),
    );
  }

  void readFile() async {
    String text = await rootBundle.loadString("assets/ahadeth.txt");
    List<String> seperatedAhadeth = text.split("#");
    for (int i = 0; i < seperatedAhadeth.length; i++) {
      String hadethText = seperatedAhadeth[i];
      List<String> lines = hadethText.trim().split("\n");
      String title = lines[0];
      lines.removeAt(0);
      String content = lines.join("\n");
      HadethModel h = HadethModel(title, content);
      allHadeth.add(h);
    }
    setState(() {});
  }
}
