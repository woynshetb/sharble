import 'package:flutter/material.dart';
import 'package:sharble/components/widgets/custom_button.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: deviceSize.width * 0.03,
            right: deviceSize.width * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: deviceSize.height * 0.05,
              ),
              Text(
                "Sharble",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: deviceSize.height * 0.03,
                  color: const Color(
                    0xff48BFAA,
                  ),
                ),
              ),
              SizedBox(
                height: deviceSize.height * 0.02,
              ),
              const Text(
                "The ultimate sharing app with sharble you can easily share grocery list with your friends and family split for shring purchases and much more spli more",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: deviceSize.height * 0.04,
              ),
              Image.asset(
                "assets/images/holding.png",
                width: deviceSize.width * 0.7,
              ),
              SizedBox(
                height: deviceSize.height * 0.04,
              ),
              const Text(
                "The ultimate sharing app with sharble you can easily share grocery list with your  much morelist with your  ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: deviceSize.height * 0.15,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupPage()));
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
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
          ),
        ),
      ),
    );
  }
}
