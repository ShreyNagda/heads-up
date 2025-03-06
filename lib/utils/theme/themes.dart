import 'package:flutter/material.dart';

const Color primary = Color.fromRGBO(72, 159, 181, 1);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: primary),
  appBarTheme: const AppBarTheme(
      backgroundColor: primary, iconTheme: IconThemeData(color: Colors.black)),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: primary),
  appBarTheme: const AppBarTheme(
      backgroundColor: primary, iconTheme: IconThemeData(color: Colors.white)),
);
