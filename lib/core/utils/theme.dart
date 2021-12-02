import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTheme {
  static const Color primaryColor = Color(0xFF050249);
  static const Color greyColor = Color(0xFFf5f6f7);
  static const Radius radius = Radius.circular(30);
  static ThemeData themeData = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: const MaterialColor(
        0xFF050249,
        <int, Color>{
          50: Color(0xFFE1E1E9),
          100: Color(0xFFB4B3C8),
          200: Color(0xFF8281A4),
          300: Color(0xFF504E80),
          400: Color(0xFF2B2864),
          500: Color(0xFF050249),
          600: Color(0xFF040242),
          700: Color(0xFF040139),
          800: Color(0xFF030131),
          900: Color(0xFF010121),
        },
      ),
    ),
  );
  static const defaultPadding = 20.0;
  static const spacer = 20.0;
}
