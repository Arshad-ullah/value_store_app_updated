import 'package:flutter/material.dart';
import 'package:value_stories_app/core/constants/colors.dart';
import 'package:value_stories_app/core/constants/screen-utils.dart';
import 'package:value_stories_app/core/constants/textstyle.dart';

class CustomTextField2 extends StatelessWidget {
  final controller;
  final bool obscure;
  final String? errorText;
  final String? hintText;
  final bool enabled;
  final Widget? suffixIcon;
  final validator;
  final double fontSize;
  final String? label;
  final inputType;
  final onSaved;
  final ontap;
  final bool disableBorder;
  CustomTextField2(
      {this.controller,
      this.ontap,
      this.disableBorder = false,
      this.label,
      this.inputType = TextInputType.text,
      this.obscure = false,
      this.enabled = true,
      this.validator,
      this.errorText,
      this.fontSize = 14.0,
      this.hintText,
      this.onSaved,
      this.suffixIcon});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: greyColor.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(10.0),
              // border: Border.all(color: greyColor.withOpacity(0.4))
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.1),
              //     blurRadius: 2, // has the effect of softening the shadow
              //     spreadRadius: 0.6, // has the effect of extending the shadow
              //     offset: Offset(
              //       0, // horizontal, move right 10
              //       0.4, // vertical, move down 10
              //     ),
              //   ),
              // ]
            )),
        TextFormField(
          onTap: ontap,
          onSaved: onSaved,
          enabled: enabled,
          style: subBodyTextStyle.copyWith(fontSize: this.fontSize),
          cursorColor: mainThemeColor,
          controller: this.controller,
          obscureText: this.obscure,
          validator: validator,
          keyboardType: inputType,
          decoration: InputDecoration(
              fillColor: Colors.white,
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              isDense: true,
              errorStyle: TextStyle(
                fontSize: 10,
                fontFamily: 'OpenSans',
              ),
              // alignLabelWithHint: true,

              suffixIcon: Padding(
                  padding: const EdgeInsets.only(),
                  child: suffixIcon != null ? suffixIcon : Container()),
              suffixIconConstraints:
                  BoxConstraints(maxHeight: 40, maxWidth: 50),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              // focusedBorder: OutlineInputBorder(
              //     borderSide:
              //         BorderSide(color: mainThemeColor.withOpacity(0.5)),
              //     borderRadius: BorderRadius.circular(
              //       10.0,
              //     )),
              // focusedErrorBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: greyColor.withOpacity(0.5)),
              //   borderRadius: BorderRadius.circular(
              //     10.0,
              //   ),
              // ),
              // disabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: greyColor.withOpacity(0.5)),
              //   borderRadius: BorderRadius.circular(
              //     10.0,
              //   ),
              // ),
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: greyColor.withOpacity(0.5)),
              //   borderRadius: BorderRadius.circular(
              //     10.0,
              //   ),
              // ), // EdgeInsets.only(left: 21.0, top: 10),
              hintText: this.hintText,
              // errorStyle: TextStyle(fontSize: 8, height: 1),
              hintStyle: subBodyTextStyle.copyWith(
                  color: Color(0XFF003140).withOpacity(0.4),
                  fontSize: fontSize)),
        ),
      ],
    );
  }
}
