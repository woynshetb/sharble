import 'package:flutter/material.dart';
import 'package:sharble/components/widgets/buttons.dart';
import 'package:sharble/components/widgets/custom.appbar.dart';
import 'package:sharble/components/widgets/forms.dart';

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
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const CustomAppbar(
                    title: "Reset Password",
                    showLeading: true,
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
                  const SizedBox(height: 10),
                  DefaultField(
                    keyboardType: TextInputType.emailAddress,
                    textEditingController: TextEditingController(),
                    hintText: "wbilihatu@gmail.com",
                    obscureText: false,
                    onTap: () {},
                  ),
                  const SizedBox(height: 10),
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
                    height: 10,
                  ),
                  DefaultField(
                    keyboardType: TextInputType.emailAddress,
                    textEditingController: TextEditingController(),
                    hintText: "1234",
                    obscureText: true,
                    onTap: () {},
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
