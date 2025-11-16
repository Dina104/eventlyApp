import 'package:evently/core/prefs_manager/prefs_manager.dart';
import 'package:flutter/widgets.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLang = PrefsManager.getSavedLan() ?? "en";

  bool get isEnglish => currentLang == "en";

  void voidChangeAppLanguage(String newLang) {
    if (currentLang == newLang) return;

    currentLang = newLang;
    PrefsManager.SaveLanguage(currentLang);
    notifyListeners();
  }
}
