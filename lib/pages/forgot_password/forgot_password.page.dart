import 'package:flutter/material.dart';
import 'package:sharble/components/widgets/custom.appbar.dart';
import 'package:sharble/components/widgets/custom_button.dart';
import 'package:sharble/components/widgets/custom_textform.dart';
import 'package:sharble/pages/verify/verify.page.dart';
import 'package:sharble/services/validator.service.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: deviceSize.width * 0.03,
            right: deviceSize.width * 0.03,
            top: deviceSize.width * 0.1,
            bottom: deviceSize.width * 0.1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomAppbar(
                    title: "Forgot Password",
                    showLeading: true,
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.015,
                  ),
                  Text(
                    "Enter your email address to receive a 6-pin number and \n and reset your password ",
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
                    textEditingController: TextEditingController(),
                    hintText: "lubabi@gmail.com",
                    obscureText: false,
                    onTap: () {},
                    validator: (value) => FormValidator.validateEmail(value!),
                  ),
                ],
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerfiyPage()));
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
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
