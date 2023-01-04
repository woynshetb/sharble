import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sharble/components/widgets/custom.appbar.dart';
import 'package:sharble/components/widgets/buttons.dart';
import 'package:sharble/components/widgets/forms.dart';
import 'package:sharble/services/validator.service.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with RestorationMixin {
  int stepPercent = 30;
  bool isChecked = false;
  final formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  XFile? image;
  @override
  String? get restorationId => "main";

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentText = "";
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: deviceSize.width * 0.8,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: Color(0xffF4F4F4),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: stepPercent == 30
                          ? deviceSize.width * 0.6
                          : stepPercent == 60
                              ? deviceSize.width * 0.4
                              : stepPercent == 90
                                  ? deviceSize.width * 0.2
                                  : 0,
                      left: stepPercent == 30
                          ? 0
                          : stepPercent == 60
                              ? deviceSize.width * 0.2
                              : stepPercent == 90
                                  ? deviceSize.width * 0.4
                                  : deviceSize.width * 0.6,
                      bottom: 0,
                      child: LayoutBuilder(
                        builder: (context, constraints) => Container(
                          width: deviceSize.width * 0.8 * (30 / 100),
                          height: 4,
                          decoration: const BoxDecoration(
                            color: Color(0xff48BFAA),
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // LinearPercentIndicator(
              //   alignment: MainAxisAlignment.start,
              //   width: deviceSize.width * 0.8,
              //   lineHeight: 4,
              //   percent: stepPercent == 30
              //       ? 0.25
              //       : stepPercent == 60
              //           ? 0.5
              //           : stepPercent == 90
              //               ? 0.75
              //               : 1,
              //   backgroundColor: Color(0xffF4F4F4),
              //   progressColor: Color(0xff48BFAA),
              // ),
              const SizedBox(
                height: 20,
              ),
              
              CustomAppbar(
                onPressed: () {
                  Navigator.pop(context);
                },
                title: "Sign up",
                showLeading: stepPercent == 100 ? false : true,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Visibility(
                          visible: stepPercent == 30,
                          child: Column(
                            children: [
                              const Text(
                                "Create your free account in 4 steps and access all of the features and benefits fo Sharble!",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 13),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.all(3.0),
                                child: const Text(
                                  "First Name",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              DefaultField(
                                keyboardType: TextInputType.emailAddress,
                                textEditingController: TextEditingController(),
                                obscureText: false,
                                onTap: () {},
                                validator: (value) =>
                                    FormValidator.validateName(value!),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.all(3.0),
                                child: const Text(
                                  "Last Name",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              DefaultField(
                                keyboardType: TextInputType.emailAddress,
                                textEditingController: TextEditingController(),
                                hintText: "Baba",
                                obscureText: false,
                                onTap: () {},
                                validator: (value) =>
                                    FormValidator.validateName(value!),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  "Birthday",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),
                                ),
                              ),
                              const SizedBox(height: 5),
                              DefaultField(
                                keyboardType: TextInputType.emailAddress,
                                textEditingController: TextEditingController(),
                                hintText: _selectedDate.value.toString(),
                                obscureText: false,
                                onTap: () {},
                                validator: (value) =>
                                    FormValidator.valateBirthday(value!),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    _restorableDatePickerRouteFuture.present();
                                  },
                                  child: Container(
                                    width: 16,
                                    height: 18,
                                    padding: EdgeInsets.only(
                                      right: deviceSize.width * 0.04,
                                      top: deviceSize.height * 0.013,
                                      bottom: deviceSize.height * 0.013,
                                    ),
                                    // decoration: BoxDecoration(
                                    //     image: DecorationImage(
                                    //       fit: BoxFit.cover,
                                    //         image: AssetImage(

                                    //   "assets/images/icon_calendar.png",
                                    // ))),

                                    child: Image.asset(
                                      "assets/images/icon_calendar.png",
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isChecked = !isChecked;
                                      });
                                    },
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: isChecked
                                            ? Theme.of(context).primaryColor
                                            : Colors.white,
                                        border: isChecked
                                            ? null
                                            : Border.all(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.done,
                                          color: isChecked
                                              ? Colors.white
                                              : Colors.transparent,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "I agree with the terms and conditions and also \nthe protection of my personal data on Sharble.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: deviceSize.width * 0.034),
                                  )
                                ],
                              )
                            ],
                          )),
                      Visibility(
                          visible: stepPercent == 60,
                          child: Column(
                            children: [
                              const Text(
                                "Enter your email and password. Password must be at leas 8 characters.",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 13),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.all(3.0),
                                child: const Text(
                                  "Email",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),
                                ),
                              ),
                              const SizedBox(height: 5),
                              DefaultField(
                                keyboardType: TextInputType.emailAddress,
                                textEditingController: TextEditingController(),
                                obscureText: false,
                                onTap: () {},
                                validator: (value) =>
                                    FormValidator.validateEmail(value!),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.all(3.0),
                                child: const Text(
                                  "Password",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              DefaultField(
                                keyboardType: TextInputType.emailAddress,
                                textEditingController: TextEditingController(),
                                obscureText: true,
                                onTap: () {},
                                validator: (value) =>
                                    FormValidator.validatePassword(value!),
                              ),
                              SizedBox(height: 5),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.all(3.0),
                                child: const Text(
                                  "Confirm Passowrd",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),
                                ),
                              ),
                              const SizedBox(height: 5),
                              DefaultField(
                                keyboardType: TextInputType.text,
                                textEditingController: TextEditingController(),
                                hintText: _selectedDate.value.toString(),
                                obscureText: true,
                                onTap: () {},
                                validator: (value) =>
                                    FormValidator.validatePassword(value!),
                              ),
                            ],
                          )),
                      Visibility(
                          visible: stepPercent == 90,
                          child: Column(
                            children: [
                              const Text(
                                "You need to verify your email address with a pin number. Please check your email.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 20),
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
                                  animationDuration:
                                      const Duration(milliseconds: 300),
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
                          )),
                      Visibility(
                          visible: stepPercent == 100,
                          child: Column(
                            children: [
                              const Text(
                                "Congratulations! Your account is setup. You can upload your profile picture now or later. Only your friends you share rooms with, will see the picture.",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 13),
                              ),
                              const SizedBox(height: 20),
                              InkWell(
                                onTap: () async {
                                  image = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(() {});
                                },
                                child: Container(
                                  width: 126,
                                  height: 126,
                                  decoration: BoxDecoration(
                                      image: image != null
                                          ? DecorationImage(
                                              fit: BoxFit.cover,
                                              image:
                                                  FileImage(File(image!.path)))
                                          : null,
                                      color: Color(0xffFAF9FD),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Visibility(
                                      visible: image == null,
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          deviceSize.width * 0.1,
                                        ),
                                        child: Image.asset(
                                          "assets/images/Icon.png",
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ))
                    ],
                  )),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GreenPostitve(
                    onPressed: () {
                      if (stepPercent == 30) {
                        setState(() {
                          stepPercent = 60;
                          return;
                        });
                      } else if (stepPercent == 60) {
                        setState(() {
                          stepPercent = 90;

                          return;
                        });
                      } else if (stepPercent == 90) {
                        setState(() {
                          stepPercent = 100;

                          return;
                        });
                      }
                    },
                    title: stepPercent == 100 ? "Finish" : "Next",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
