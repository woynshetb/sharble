import 'package:flutter/material.dart';
import 'package:sharble/components/widgets/custom.appbar.dart';

class VerfiyPage extends StatefulWidget {
  const VerfiyPage({Key? key}) : super(key: key);

  @override
  State<VerfiyPage> createState() => _VerfiyPageState();
}

class _VerfiyPageState extends State<VerfiyPage> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: deviceSize.width * 0.03,
          right: deviceSize.width * 0.03,
          top: deviceSize.width * 0.1,
          bottom: deviceSize.width * 0.1,
        ),
        child: Column(
          children: [
            SizedBox(
              height: deviceSize.height * 0.04,
            ),
            const CustomAppbar(
              title: "Verify Code",
              showLeading: true,
            ),
            SizedBox(
              height: deviceSize.height * 0.015,
            ),
            Text(
              "Enter your verfication code beforew you change your \n password ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: deviceSize.width * 0.035),
            ),
          ],
        ),
      ),
    );
  }
}
