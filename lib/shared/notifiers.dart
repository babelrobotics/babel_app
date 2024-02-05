import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:babelbots/themes.dart';

class ThemeNotifier with ChangeNotifier {
  bool _isDarkMode = false;

  ThemeNotifier() {
    // Optionally initialize the theme here
  }

  // Method to explicitly set the theme mode
  void setDarkMode(bool isDarkMode) {
    _isDarkMode = isDarkMode;
    notifyListeners();
  }

  ThemeData get themeData => _isDarkMode ? _buildDarkTheme() : _buildLightTheme();

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeData _buildLightTheme() {
    return lightTheme;
  }

  ThemeData _buildDarkTheme() {
    return darkTheme;
  }
}
