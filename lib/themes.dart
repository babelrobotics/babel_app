import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:babelbots/shared/shared.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:babelbots/shared/shared.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: LIGHT_PRIMARY_BACKGROUND, 
  scaffoldBackgroundColor: LIGHT_PRIMARY_BACKGROUND, 
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: LIGHT_SECONDARY_BACKGROUND, 
  ),
  secondaryHeaderColor: LIGHT_SECONDARY_ACCENT, 
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 18, color: LIGHT_TEXT), 
    bodyMedium: TextStyle(fontSize: 16, color: LIGHT_TEXT), 
    labelLarge: TextStyle(
      fontSize: 18,
      letterSpacing: 1.5,
      fontWeight: FontWeight.bold,
      color: LIGHT_TEXT, 
    ),
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: LIGHT_TEXT, 
    ),
    titleMedium: TextStyle(
      color: LIGHT_SECONDARY_TEXT, 
    ),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: LIGHT_TEXT, 
    labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    unselectedLabelStyle: TextStyle(fontSize: 16),
    indicatorColor: LIGHT_ACCENT,
    indicator: BoxDecoration(
      color: Color.fromARGB(255, 233, 59, 59), 
    ),
    indicatorSize: TabBarIndicatorSize.tab,
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: DARK_PRIMARY_BACKGROUND, 
  scaffoldBackgroundColor: DARK_SECONDARY_BACKGROUND, 
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: DARK_PRIMARY_BACKGROUND, 
  ),
  secondaryHeaderColor: DARK_SECONDARY_ACCENT, 
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 18, color: DARK_TEXT), 
    bodyMedium: TextStyle(fontSize: 16, color: DARK_TEXT), 
    labelLarge: TextStyle(
      fontSize: 18,
      letterSpacing: 1.5,
      fontWeight: FontWeight.bold,
      color: DARK_TEXT, 
    ),
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: DARK_TEXT, 
    ),
    titleMedium: TextStyle(
      color: DARK_SECONDARY_TEXT, 
    ),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: DARK_TEXT, 
    labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    unselectedLabelStyle: TextStyle(fontSize: 16),
    indicatorColor: DARK_ACCENT,
  ),
);
