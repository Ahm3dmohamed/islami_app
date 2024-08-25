import 'package:flutter/material.dart';
import 'package:islami/modules/layout/pages/hadeth/hadeth_model.dart';
import 'package:islami/modules/splash/screens/custom_splash.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = "HadethDetails";

  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    HadethModel hadeth =
        ModalRoute.of(context)!.settings.arguments as HadethModel;

    return CustomSplash(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          hadeth.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Card(
          color: const Color.fromARGB(128, 121, 118, 115),
          margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          elevation: 2,
          shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Color(0xffB7935F),
              ),
              borderRadius: BorderRadius.circular(24)),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    hadeth.content,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )),
    ));
  }
}
