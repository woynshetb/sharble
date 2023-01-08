import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sharble/components/widgets/buttons.dart';
import 'package:sharble/pages/login/login.page.dart';
import 'package:sharble/pages/signup/signup.page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
       resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                    "assets/images/Sharble.svg",
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "The ultimate sharing app with sharble you can easily share grocery list with your friends and family split for shring purchases and much more spli more",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: deviceSize.width * 0.035,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                      width: 315,
                      height: deviceSize.height * 0.37,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/images/welcome.png'),
                            fit: BoxFit.fitWidth),
                      )),
                  const SizedBox(height: 25),
                  const Text(
                    "Simply create an account and log in to start using Sharly and simplifying your shopping experience.",
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                ],
              ),
              Column(
                children: [
                  GreenPostitve(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              SignupPage(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    },
                    title: "Sign up",
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.013,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        textAlign: TextAlign.center,
                        style: TextStyle(),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  LoginPage(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        },
                        child: const Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff48BFAA)),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
