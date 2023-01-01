
import 'package:flutter/material.dart';

class AppColor {
  static MaterialColor get myColor => const MaterialColor(
        0xff48BFAA,
        <int, Color>{
          50: Color(0xffa3dfd4),
          100: Color(0xff91d8cc),
          200: Color(0xff7ed2c3),
          300: Color(0xff6ccbbb),
          400: Color(0xff5ac5b2),
          500: Color(0xff48BFAA),
          600: Color(0xff40ab99),
          700: Color(0xff399888),
          800: Color(0xff328576),
          900: Color(0xff2b7266),
        },
      );
  static MaterialColor get secondary => const MaterialColor(
        0xff2E3553,
        <int, Color>{
          50: Color(0xff969aa9),
          100: Color(0xff818597),
          200: Color(0xff6c7186),
          300: Color(0xff575d75),
          400: Color(0xff424964),
          500: Color(0xff2E3553),
          600: Color(0xff292f4a),
          700: Color(0xff242a42),
          800: Color(0xff20253a),
          900: Color(0xff1b1f31),
        },
      );

  static Color get secondaryColor => const Color(0xff0D1B34);
}
