import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget {
  final String title;
  final bool showLeading;

  const CustomAppbar({Key? key, required this.title, this.showLeading = true})
      : super(key: key);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: widget.showLeading
          ? MainAxisAlignment.start
          : MainAxisAlignment.center,
      children: [
        Visibility(
          visible: widget.showLeading,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: deviceSize.width * 0.05,
              height: deviceSize.width * 0.05,
              decoration: BoxDecoration(
                  color: Color(0xffF5F5F5), shape: BoxShape.circle),
              child: Icon(Icons.keyboard_arrow_left),
            ),
          ),
        ),
        SizedBox(
          width: widget.showLeading ? deviceSize.width * 0.3 : 0,
        ),
        Text(
          widget.title,
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: deviceSize.width * 0.04),
        )
      ],
    );
  }
}
