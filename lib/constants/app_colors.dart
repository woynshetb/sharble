import 'package:flutter/material.dart';

class AppColor {
  static MaterialColor get myColor => const MaterialColor(
        0xff48BFAA,
        <int, Color>{
          50: Color(0xFF558B2F),
          100: Color(0xff7DC242),
          200: Color(0xFF558B2F),
          300: Color(0xFF558B2F),
          400: Color(0xFF558B2F),
          500: Color(0xFF558B2F),
          600: Color(0xFF558B2F),
          700: Color(0xFF558B2F),
          800: Color(0xFF558B2F),
          900: Color(0xFF558B2F),
        },
      );
  static MaterialColor get secondary => const MaterialColor(
        0xff2E3553,
        <int, Color>{
          50: Color(0xFF868d99),
          100: Color(0xFF6d7685),
          200: Color(0xFF555f70),
          300: Color(0xFF3d485c),
          400: Color(0xFF253148),
          500: Color(0xff0D1B34),
          600: Color(0xFF0b182e),
          700: Color(0xFF0a1529),
          800: Color(0xFF091224),
          900: Color(0xFF07101f),
        },
      );

  static Color get secondaryColor => const Color(0xff0D1B34);
}
