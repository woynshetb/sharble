import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sharble/components/widgets/buttons.dart';
import 'package:sharble/components/widgets/custom.appbar.dart';
import 'package:sharble/pages/reset_password/reset_password.page.dart';

class VerfiyPage extends StatefulWidget {
  const VerfiyPage({Key? key}) : super(key: key);

  @override
  State<VerfiyPage> createState() => _VerfiyPageState();
}

class _VerfiyPageState extends State<VerfiyPage> {
  final formKey = GlobalKey<FormState>();
  String currentText = "";
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
       resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                   CustomAppbar(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: "Verify Code",
                    showLeading: true,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Enter your verfication code beforew you change your password ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: formKey,
                    child: PinCodeTextField(
                      autoFocus: true,
                      appContext: context,
                      length: 6,
                      obscureText: false,
                      obscuringCharacter: '*',
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 3) {
                          //return "I'm from validator";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        borderWidth: 1,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(15),
                        fieldHeight: 60,
                        fieldWidth: 45,
                        activeFillColor: Color(0xfffaf9fd),
                        inactiveColor: Colors.white,
                        disabledColor: Color(0xfffaf9fd),
                        errorBorderColor: Color(0xfffaf9fd),
                        selectedFillColor: Color(0xfffaf9fd),
                        activeColor: Color(0xff7248BF),
                        selectedColor: Color(0xfffaf9fd),
                        inactiveFillColor: Color(0xfffaf9fd),
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      controller: TextEditingController(),
                      keyboardType: TextInputType.number,
                      onCompleted: (v) {
                        debugPrint("Completed");
                      },
                      onTap: () {
                        print("Pressed");
                      },
                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");

                        return true;
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "You have 120 seconds left to verify.\nResend new Code!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GreenPostitve(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            ResetPasswordPage(),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  },
                  title: "Next",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
