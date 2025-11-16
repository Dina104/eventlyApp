import 'dart:ffi';

import 'package:evently/core/resourese/constant_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late SharedPreferences prefs;
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void SaveTheme(ThemeMode newTheme) {
    String Theme = newTheme== ThemeMode.light ? "Light" : "Dark";
    prefs.setString(CacheConstant.themeKey, Theme);
  }

  static ThemeMode? getSavedTheme() {
    String? savedTheme = prefs.getString(CacheConstant.themeKey);
    if (savedTheme == null) {
      return null;
    } else {
      ThemeMode themeMode =
          savedTheme == "Light" ? ThemeMode.light : ThemeMode.dark;
      return themeMode;
    }
  }

  static String? SaveLanguage(String newLang) {
    prefs.setString(CacheConstant.languageKey, newLang);
  }
  static getSavedLan(){
   String? saveLang= prefs.getString(CacheConstant.languageKey);
   return saveLang;
  }
}
