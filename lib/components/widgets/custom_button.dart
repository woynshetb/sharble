import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color? bgColor;
  final Widget child;
  final Function onPressed;
  const CustomButton(
      {Key? key, this.bgColor, required this.onPressed, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: child,
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        surfaceTintColor: bgColor ?? Color(0xff48BFAA),
        // shadowColor: backgroundColor,
        elevation: 1,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        primary: bgColor ?? Color(0xff48BFAA),
        onSurface: null,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
