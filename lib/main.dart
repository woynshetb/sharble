import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharble/constants/app_theme.dart';
import 'package:sharble/pages/splash/splash.page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        initial: AdaptiveThemeMode.system,
        light: AppTheme().lightTheme(),
        dark: AppTheme().darkTheme(),
        builder: (theme, darkTheme) {
          return GetMaterialApp(
            defaultTransition: Transition.noTransition,
            theme: theme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            title: 'Shable App',
            home: const SplashPage(),
          );
        });
  }
}
