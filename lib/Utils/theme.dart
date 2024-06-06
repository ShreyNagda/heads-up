import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heads_up/Utils/colors.dart';
import 'package:http/http.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    textTheme: GoogleFonts.latoTextTheme()
        .copyWith(
            titleMedium: heading,
            titleSmall: subheading,
            bodyLarge: bodyLarge,
            bodyMedium: bodyMedium)
        .apply(bodyColor: secondary),
    appBarTheme: const AppBarTheme(centerTitle: true),
    scaffoldBackgroundColor: primary,
  );

  static TextStyle heading = const TextStyle(
      fontSize: 35, fontWeight: FontWeight.w700, color: secondary);
  static TextStyle subheading = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.w600, color: secondary);
  static TextStyle bodyLarge = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.normal, color: secondary);

  static TextStyle bodyMedium = const TextStyle(fontSize: 20, color: secondary);
}
