import 'package:flutter/material.dart';
import 'package:sharble/components/widgets/buttons.dart';
import 'package:sharble/components/widgets/custom.appbar.dart';
import 'package:sharble/components/widgets/forms.dart';
import 'package:sharble/services/validator.service.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
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
                    title: "Reset Password",
                    showLeading: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Add your new password. From now on, you can login only with the new password.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.topLeft,
                    // padding: const EdgeInsets.all(3.0),
                    child: Text(
                      "Password",
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
                    obscureText: false,
                    onTap: () {},
                    validator: (value) =>
                        FormValidator.validatePassword(value!),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    alignment: Alignment.topLeft,
                    //  padding: const EdgeInsets.all(3.0),
                    child: Text(
                      "Confirm Password",
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
                    textEditingController: TextEditingController(),
                    hintText: "1234",
                    obscureText: true,
                    onTap: () {},
                    validator: (value) =>
                        FormValidator.validatePassword(value!),
                    suffixIcon: null,
                  ),
                ],
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GreenPostitve(
                      onPressed: () {},
                      title: "Reset Password",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
