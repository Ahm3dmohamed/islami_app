import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/modules/layout/pages/manager/quran_provider.dart';
import 'package:islami/modules/layout/pages/manager/qran/sura_model.dart';
import 'package:islami/modules/splash/screens/custom_splash.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "SuraDetails";

  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    var model = ModalRoute.of(context)!.settings.arguments as SuraModel;
    var theme = Theme.of(context);

    return ChangeNotifierProvider(
      create: (_) => QuranProvider()..loadSuraFile(model.index),
      builder: (context, child) {
        var provider = Provider.of<QuranProvider>(context);
        return CustomSplash(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                "Islami",
                style: GoogleFonts.elMessiri(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: provider.verses.isNotEmpty
                ? Container(
                    height: size.height * .80,
                    margin: EdgeInsets.only(
                      top: size.width * .12,
                      right: size.width * .05,
                      left: size.width * .05,
                      bottom: size.width * .01,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF14142E).withOpacity(.2),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              model.suraName,
                              textDirection: TextDirection.rtl,
                              style: theme.textTheme.bodyMedium,
                            ),
                            SizedBox(
                              width: size.width * .05,
                            ),
                            const Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        const Divider(
                          color: Color(0x80B7935F),
                          thickness: 2,
                          indent: 60,
                          endIndent: 60,
                        ),
                        SizedBox(
                          height: size.width * .05,
                        ),
                        Text(
                          model.suraBasmala,
                          style: GoogleFonts.amiri(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: provider.verses
                                .length, // Adjusted to display all verses
                            itemBuilder: (context, index) {
                              String verse = provider.replacementArabicNumber(
                                  provider.verses[index].trim());
                              String verseNumber =
                                  getVerseEndSymbol(index + 1).toString();
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text.rich(
                                  TextSpan(
                                    text: verse,
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      fontFamily:
                                          GoogleFonts.amiriQuran().fontFamily,
                                    ),
                                    children: [
                                      const TextSpan(text: " "),
                                      TextSpan(
                                        text: verseNumber,
                                      ),
                                      const TextSpan(text: " "),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        );
      },
    );
  }
}
