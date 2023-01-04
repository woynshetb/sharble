import 'package:flutter/material.dart';
import 'package:sharble/components/widgets/custom.appbar.dart';
import 'package:sharble/components/widgets/buttons.dart';
import 'package:sharble/components/widgets/forms.dart';
import 'package:sharble/pages/forgot_password/forgot_password.page.dart';
import 'package:sharble/pages/signup/signup.page.dart';
import 'package:sharble/services/validator.service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    TextEditingController email = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            
              Column(
                children: [
                  CustomAppbar(
                    title: "Login",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    showLeading: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Please log in to access all of the features and \n benefits of our app",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    // padding: const EdgeInsets.all(3.0),
                    child: Text(
                      "Email",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  DefaultField(
                    keyboardType: TextInputType.emailAddress,
                    textEditingController: TextEditingController(),
                    hintText: "wbilihatu@gmail.com",
                    obscureText: false,
                    onTap: () {},
                    validator: (value) => FormValidator.validateEmail(value!),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    alignment: Alignment.topLeft,
                    //  padding: const EdgeInsets.all(3.0),
                    child: Text(
                      "Password",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  DefaultField(
                    keyboardType: TextInputType.emailAddress,
                    textEditingController: email,
                    hintText: "1234",
                    obscureText: true,
                    onTap: () {},
                    suffixIcon: null,
                    validator: (value) =>
                        FormValidator.validatePassword(value!),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                ForgotPasswordPage(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(
                            0xff48BFAA,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GreenPostitve(
                      onPressed: () {},
                      title: "Login",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => SignupPage(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
                        },
                        child: const Text(
                          "Sign up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
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
