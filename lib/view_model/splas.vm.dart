import 'dart:async';

import 'package:flutter/material.dart';

import 'package:sharble/pages/welcome/welcome.page.dart';
import 'package:sharble/view_model/base.view_model.dart';

class SplashViewModel extends MyBaseViewModel {
  SplashViewModel(BuildContext context) {
    viewContext = context;
  }

  @override
  initialise() async {
    loadNextPage();
  }

  loadNextPage() async {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        viewContext!,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => WelcomePage(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    });
  }
}
