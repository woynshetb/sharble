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
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          color: Color.fromRGBO(72, 191, 169, 1),
          border: Border.all(
            color: Color.fromRGBO(72, 191, 169, 1),
            width: 1,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  height: 1.6),
            ),
          ],
        ),
      ),
    );
    // return ElevatedButton(
    //   onPressed: () {
    //     onPressed();
    //   },
    //   style: ElevatedButton.styleFrom(
    //     padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
    //     surfaceTintColor: bgColor ?? const Color(0xff48BFAA),
    //     elevation: 1,
    //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    //     primary: bgColor ?? const Color(0xff48BFAA),
    //     onSurface: null,
    //     shadowColor: Colors.black,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(15),
    //     ),
    //   ),
    //   child: Text(
    //     title,
    //     style: const TextStyle(
    //         color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
    //   ),
    // );
  }
}

class GreenNegative extends StatelessWidget {
  final double val;
  final Color? bgColor;
  final String title;
  final Function onPressed;
  const GreenNegative(
      {Key? key,
      this.bgColor,
      required this.onPressed,
      required this.title,
      this.val = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          // color: Color.fromRGBO(72, 191, 169, 1),
          border: Border.all(
            color: Color.fromRGBO(72, 191, 169, 1),
            width: 1,
          ),
        ),
        padding: val==0 ? EdgeInsets.symmetric(horizontal: 14, vertical: 10) :EdgeInsets.symmetric(horizontal: val, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  height: 1.6),
            ),
          ],
        ),
      ),
    );
    // return ElevatedButton(
    //   onPressed: () {
    //     onPressed();
    //   },
    //   style: ElevatedButton.styleFrom(
    //     side: BorderSide(
    //       color: Theme.of(context).primaryColor,
    //       width: 1,
    //       style: BorderStyle.solid,
    //     ),
    //     padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
    //     surfaceTintColor: bgColor ?? Colors.white,
    //     elevation: 1,
    //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    //     primary: bgColor ?? Colors.white,
    //     onSurface: null,
    //     shadowColor: Colors.black,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(15),
    //     ),
    //   ),
    //   child: Text(
    //     title,
    //     style: const TextStyle(
    //         color: Color(0xff48bfaa),
    //         fontSize: 14,
    //         fontWeight: FontWeight.bold),
    //   ),
    // );
  }
}
