import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatefulWidget {
  final String title;
  final bool showLeading;
  final Function onPressed;

  const CustomAppbar(
      {Key? key,
      required this.title,
      this.showLeading = true,
      required this.onPressed})
      : super(key: key);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      titleSpacing: 0,
      elevation: 0,
      leadingWidth: 50,
      leading: Visibility(
        visible: widget.showLeading,
        child: InkWell(
          onTap: () => {
    Navigator.of(context).maybePop()
          },
          child: Container(
           
            margin: EdgeInsets.only(
              right: 10,
              top: 10,bottom: 10
            ),
            decoration: const BoxDecoration(
                color: Color(0xffF5F5F5), shape: BoxShape.circle),
            child: Icon(Icons.keyboard_arrow_left, color: Color(0xff2E3553)),
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        widget.title,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          color: Theme.of(context).textTheme.bodyText1!.color,
          fontSize: 18,
        ),
      ),
    );
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     Visibility(
    //       visible: true,
    //       child: widget.showLeading == false
    //           ? Container(
    //               width: 26,
    //               height: 26,
    //             )
    //           : InkWell(
    //               onTap: () => {
    //              Navigator.pop(context)
    //               },
    //               child: Container(
    //                 width: 26,
    //                 height: 26,
    //                 decoration: const BoxDecoration(
    //                     color: Color(0xffF5F5F5), shape: BoxShape.circle),
    //                 child: const Icon(
    //                   Icons.keyboard_arrow_left,
    //                 ),
    //               ),
    //             ),
    //     ),
    //     Text(
    //       widget.title,
    //       style: const TextStyle(
    //         fontWeight: FontWeight.w900,
    //         fontSize: 18,
    //       ),
    //     ),
    //     Visibility(
    //       visible: true,
    //       child: Container(),
    //     )
    //   ],
    // );
  }
}
