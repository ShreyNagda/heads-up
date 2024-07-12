import 'package:flutter/material.dart';
import 'package:heads_up/main.dart';
import 'package:heads_up/utils/theme/themes.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = prefs.containsKey("dark") && prefs.getBool("dark")!
      ? darkTheme
      : lightTheme;
  ThemeData get currentTheme => _currentTheme;
  bool get isDarkMode => _currentTheme == darkTheme;

  void toggleTheme() {
    if (currentTheme == darkTheme) {
      _currentTheme = lightTheme;
      prefs.setBool("dark", false);
    } else {
      _currentTheme = darkTheme;
      prefs.setBool("dark", true);
    }
    notifyListeners();
  }
}
