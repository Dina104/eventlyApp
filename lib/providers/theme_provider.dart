import 'package:evently_app_app/core/prefs_manager/prefs_manager.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currenTheme = PrefsManager.getSavedTheme()??ThemeMode.light;

  bool get isDark => currenTheme == ThemeMode.dark;

  void changeAppTheme(ThemeMode newTheme) {
    if (currenTheme == newTheme) return;
    currenTheme = newTheme;
    PrefsManager.SaveTheme(currenTheme);
    notifyListeners();
  }
}
