import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heads_up/Utils/colors.dart';
import 'package:heads_up/Utils/text.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    primarySwatch: Colors.blue,
    textTheme: GoogleFonts.latoTextTheme(),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      toolbarHeight: 80,
      elevation: 15,
      shadowColor: Colors.black,
      backgroundColor: secondary,
      titleTextStyle: titleWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
    ),
    scaffoldBackgroundColor: primary,
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: secondary),
    cardColor: secondary,
    cardTheme: CardTheme(
      elevation: 10,
      color: secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}
