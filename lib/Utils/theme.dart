import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heads_up/Utils/colors.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    textTheme: GoogleFonts.latoTextTheme(),
    appBarTheme: const AppBarTheme(centerTitle: true),
  );
}
