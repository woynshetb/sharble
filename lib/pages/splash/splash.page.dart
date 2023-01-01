import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Sharble",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: deviceSize.width * 0.1,
                color: Color(
                  0xff48BFAA,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
