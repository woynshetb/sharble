import 'package:flutter/material.dart';
import 'package:sharble/components/widgets/custom.appbar.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
              left: deviceSize.width * 0.03,
              right: deviceSize.width * 0.03,
              top: deviceSize.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CustomAppbar(
                title: "Signup",
                showLeading: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
