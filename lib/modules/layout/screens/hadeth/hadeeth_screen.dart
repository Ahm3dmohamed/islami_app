import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/modules/layout/screens/hadeth/hadeth_details.dart';

class HadethScreen extends StatefulWidget {
  HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  // List<String> hadeth = [];

  List<String> allHadeth = [];
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
          title: const Text("Hadeth"),
        ),
      body: Column(
        children: [
        Padding(
          padding: const EdgeInsets.only(top: 66),
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
            child:  allHadeth.isNotEmpty ? 
             ListView.builder(
              itemCount: allHadeth.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, HadethDetails.routeName,arguments:hadeth[index] );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(allHadeth[index].title,
                     
                     textAlign: TextAlign.center,style: theme.textTheme.bodyLarge,),
                  ),
                );
              },
            ):Center(child: CircleProgressIndicator()),
          )
        ],
      ),
    );
  }
 void  readFile() async {
    String text = await rootBundle.loadString("assets/Hadeeth/ahadeth.txt");
   List <String> seperatedAhadeth = text.split("#"); 
    for (int i = 0; i < seperatedAhadeth.length; i++) {
      String hadethText = seperatedAhadeth[i];
      List <String> lines=hadethText.trim().solit("\n");
      String title = lines[0]; 
      lines.removeAt(0);
      String content =lines.join("\n");
      HadethModel h=HadethModel(title,content);
      allHadeth.add(h);
          }
    setState(() {});
  }
}