import 'package:flutter/material.dart';

class AppTheme {
  static final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0A0A0A),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF1A1818),
      secondary: Color(0xFF292424),
      surface: Color(0xFF3A3A3C),
      outline: Color(0xFF242426),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );

  static final light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFF858181),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFD9D7D7),
      secondary: Color(0xFFEDEDED),
      surface: Color(0xFFE5E5EA),
      outline: Color(0xFFF4F4FF),
    ),
    iconTheme: const IconThemeData(color: Colors.black87),
  );
}