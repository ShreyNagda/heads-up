import 'package:flutter/material.dart';
import 'package:heads_up/utils/theme/themes.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = lightTheme;
  ThemeData get currentTheme => _currentTheme;
  bool get isDarkMode => _currentTheme == darkTheme;

  void toggleTheme() {
    if (currentTheme == darkTheme) {
      _currentTheme = lightTheme;
    } else {
      _currentTheme = darkTheme;
    }
    notifyListeners();
  }
}
