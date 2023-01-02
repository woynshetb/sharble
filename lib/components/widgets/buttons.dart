import 'package:flutter/material.dart';

class GreenPostitve extends StatelessWidget {
  final Color? bgColor;
  final String title;
  final Function onPressed;
  const GreenPostitve(
      {Key? key, this.bgColor, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
        surfaceTintColor: bgColor ?? const Color(0xff48BFAA),
        elevation: 1,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        primary: bgColor ?? const Color(0xff48BFAA),
        onSurface: null,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class GreenNegative extends StatelessWidget {
  final Color? bgColor;
  final String title;
  final Function onPressed;
  const GreenNegative(
      {Key? key, this.bgColor, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 1,
          style: BorderStyle.solid,
        ),
        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
        surfaceTintColor: bgColor ?? Colors.white,
        elevation: 1,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        primary: bgColor ?? Colors.white,
        onSurface: null,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
            color: Color(0xff48bfaa),
            fontSize: 14,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
