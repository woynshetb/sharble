import 'package:flutter/material.dart';
import 'package:sharble/constants/app_colors.dart';

class AppTheme {
  ThemeData lightTheme() {
    return ThemeData(
      fontFamily: "Gilroy",
      primarySwatch: AppColor.myColor,
      primaryColor: AppColor.myColor[100],
      primaryColorDark: AppColor.secondary,
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.grey,
      ),
      dividerColor: Colors.black,
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      cardColor: Colors.white,
      textTheme: TextTheme(
        headline3: TextStyle(
   color: AppColor.secondary,
        ),
        bodyText1: TextStyle(
   color: AppColor.secondary,
        ),
        bodyText2: TextStyle(
          color: AppColor.secondary,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
      ),
      dialogBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(
        primary: Color(0xff0D1B34),
        secondary: Color(0xffF2F3FA),
        brightness: Brightness.light,
      ),
      buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
      highlightColor: Colors.grey[400],
    );
  }

  //
  ThemeData darkTheme() {
    return ThemeData(
      fontFamily: "Gilroy",
      primarySwatch: AppColor.myColor,
      primaryColor: AppColor.myColor[100],
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.grey,
      ),
      appBarTheme: AppBarTheme(
          centerTitle: false,
          titleTextStyle:
              const TextStyle(fontSize: 17, color: Color(0xffF2F3FA)),
          iconTheme: const IconThemeData(color: Color(0xffF2F3FA)),
          elevation: 0,
          backgroundColor: Colors.grey[700]),
      backgroundColor: Colors.grey[850],
      dividerColor: Colors.white,
      cardColor: Colors.grey[700],
      textTheme: const TextTheme(
        headline3: TextStyle(
          color: Colors.white,
        ),
        bodyText1: TextStyle(
          color: Colors.white,
        ),
        bodyText2: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
