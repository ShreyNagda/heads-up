import 'package:flutter/material.dart';

const Color primary = Color.fromRGBO(72, 159, 181, 1);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      backgroundColor: primary, iconTheme: IconThemeData(color: Colors.black)),
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
      backgroundColor: primary, iconTheme: IconThemeData(color: Colors.white)),
);
