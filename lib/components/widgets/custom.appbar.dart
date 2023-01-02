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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: widget.showLeading,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 26,
              height: 26,
              decoration: const BoxDecoration(
                  color: Color(0xffF5F5F5), shape: BoxShape.circle),
              child: const Icon(
                Icons.keyboard_arrow_left,
              ),
            ),
          ),
        ),
        Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 18,
          ),
        ),
        Visibility(
          visible: widget.showLeading,
          child: Container(),
        )
      ],
    );
  }
}
