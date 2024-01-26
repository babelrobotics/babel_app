import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appTheme = ThemeData(
  //useMaterial3: true,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  fontFamily: GoogleFonts.roboto().fontFamily,
  brightness: Brightness.light,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 18),
    bodyMedium: TextStyle(fontSize: 16),
    labelLarge: TextStyle(
      letterSpacing: 1.5,
      fontWeight: FontWeight.bold
    ),
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: Colors.grey
    )  
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.accent,
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Colors.black, // Color of the text for the selected tab
    labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Style for the text of the selected tab
    unselectedLabelStyle: TextStyle(fontSize: 16), // Style for the text of the unselected tabs
  ),
);