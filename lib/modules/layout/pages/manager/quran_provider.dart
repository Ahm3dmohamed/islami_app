import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuranProvider extends ChangeNotifier {
  List<String> verses = [];

  Future<void> loadSuraFile(int index) async {
    try {
      String file =
          await rootBundle.loadString("assets/Suras/${index + 1}.txt");
      // Update the class-level verses list
      verses = file.trim().split('\n');
      notifyListeners();
    } catch (e) {
      print("Error loading sura file: $e");
    }
  }

  String replacementArabicNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], arabic[i]);
    }

    return input;
  }
}
