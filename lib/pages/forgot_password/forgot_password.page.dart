import 'package:flutter/material.dart';
import 'package:sharble/components/widgets/custom.appbar.dart';
import 'package:sharble/components/widgets/buttons.dart';
import 'package:sharble/components/widgets/forms.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomAppbar(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: "Forgot Password",
                    showLeading: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Enter your email address to receive a 6-pin number and reset your password ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Email",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 5),
                  DefaultField(
                    
                    keyboardType: TextInputType.emailAddress,
                    textEditingController: TextEditingController(),
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
                    child: GreenPostitve(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                VerfiyPage(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      },
                      title: "Next",
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
