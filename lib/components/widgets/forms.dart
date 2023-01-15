import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultField extends StatefulWidget {
  const DefaultField({
    Key? key,
    this.filled,
    this.fillColor,
    this.textEditingController,
    this.obscureText = false,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.text,
    this.labelText,
    this.hintText,
    this.errorText,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.nextFocusNode,
    this.isReadOnly = false,
    this.onTap,
    this.minLines,
    this.maxLines,
    this.suffixIcon,
    this.prefixIcon,
    this.underline = false,
    this.inputFormatters,
  }) : super(key: key);

  //
  final bool? filled;
  final Color? fillColor;
  final TextEditingController? textEditingController;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  //
  final String? labelText;
  final String? hintText;
  final String? errorText;

  final Function(String)? onChanged;
  final Function? onFieldSubmitted;

  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;

  final bool? isReadOnly;
  final VoidCallback? onTap;
  final int? minLines;
  final int? maxLines;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final bool? underline;
  final List<TextInputFormatter>? inputFormatters;

  @override
  _DefaultFieldState createState() => _DefaultFieldState();
}

class _DefaultFieldState extends State<DefaultField> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return TextFormField(
      autofocus: true,
      scrollPadding: const EdgeInsets.all(0),
      style: const TextStyle(
          color: Color(0xff2E3553), fontWeight: FontWeight.w700, fontSize: 13),
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: const Color(0xffFAF9FD),
        labelText: widget.labelText,
        // hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8), fontSize: 14),
        labelStyle:
            TextStyle(color: Colors.grey.withOpacity(0.8), fontSize: 13),
        errorText: widget.errorText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon ?? _getSuffixWidget(deviceSize),
        contentPadding: const EdgeInsets.all(10),
      ),
      inputFormatters: widget.inputFormatters,
      cursorColor: Colors.grey.shade500,
      obscureText: (widget.obscureText!) ? !makePasswordVisible : false,
      onTap: widget.onTap,
      readOnly: widget.isReadOnly!,
      controller: widget.textEditingController ?? widget.textEditingController
        ?..selection = TextSelection(
            baseOffset: widget.textEditingController!.text.length,
            extentOffset: widget.textEditingController!.text.length),
      validator: (value) => widget.validator!(value),
      focusNode: widget.focusNode,
      onFieldSubmitted: (data) {
        if (widget.onFieldSubmitted != null) {
          widget.onFieldSubmitted!(data);
        } else {
          FocusScope.of(context).requestFocus(widget.nextFocusNode);
        }
      },
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      minLines: widget.minLines,
      maxLines: widget.obscureText! ? 1 : widget.maxLines,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  //check if it's password input
  bool makePasswordVisible = false;

  Widget _getSuffixWidget(deviceSize) {
    if (widget.obscureText!) {
      return Container(
        width: 12,
        height: 12,
        padding: EdgeInsets.only(
          left: deviceSize.width * 0.01,
          right: deviceSize.width * 0.05,
          top: deviceSize.height * 0.013,
          bottom: deviceSize.height * 0.013,
        ),
        //  padding: const EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 10),
        child: InkWell(
          onTap: () {
            setState(() {
              makePasswordVisible = !makePasswordVisible;
            });
          },
          child: (!makePasswordVisible)
              ? Image.asset(
                  "assets/images/icon-eve-close.png",
                  fit: BoxFit.contain,
                  width: 10,
                  height: 10,
                )
              : Image.asset(
                  "assets/images/icon-eye.png",
                  fit: BoxFit.contain,
                  width: 10,
                  height: 10,
                ),
          // child: Icon(
          //   (!makePasswordVisible) ? Icons.visibility : Icons.visibility_off,
          //   color: Color(0xff2E3553),
          // ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
