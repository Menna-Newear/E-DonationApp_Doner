import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const theme_Status = "Theme Status";
  bool _PrimaryTheme = false;
  bool get getIsPrimaryTheme => _PrimaryTheme;
  ThemeProvider() {
    getTheme();
  }
  Future<void> setPrimaryTheme({required bool themeValue}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(theme_Status, themeValue);
    _PrimaryTheme = themeValue;
    notifyListeners();
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _PrimaryTheme = prefs.getBool(theme_Status) ?? false;
    notifyListeners();
    return _PrimaryTheme;
  }
}
