import 'package:flutter/material.dart';
import 'package:sharble/components/widgets/custom.appbar.dart';
import 'package:sharble/components/widgets/custom_button.dart';
import 'package:sharble/components/widgets/custom_textform.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
              left: deviceSize.width * 0.1,
              right: deviceSize.width * 0.1,
              bottom: deviceSize.width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: deviceSize.height * 0.04,
                  ),
                  CustomAppbar(
                    title: "Login",
                    showLeading: false,
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.015,
                  ),
                  Text(
                    "Please log in to access all of the features and \n benefits of our app",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: deviceSize.width * 0.035),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.015,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      "Email",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                        fontWeight: FontWeight.w700,
                        fontSize: deviceSize.width * 0.03,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.01,
                  ),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textEditingController: email,
                    hintText: "wbilihatu@gmail.com",
                    obscureText: false,
                    onTap: () {},
                    validator: (value) => FormValidator.validateEmail(value!),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.015,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      "Password",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                        fontWeight: FontWeight.w700,
                        fontSize: deviceSize.width * 0.03,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.01,
                  ),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textEditingController: email,
                    hintText: "1234",
                    obscureText: true,
                    onTap: () {},
                    suffixIcon: null,
                    validator: (value) => FormValidator.validateEmail(value!),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage()));
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: deviceSize.width * 0.03,
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
                    child: CustomButton(
                      onPressed: () {},
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: deviceSize.width * 0.035),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupPage()));
                        },
                        child: Text(
                          "Sign up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: deviceSize.width * 0.035,
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
