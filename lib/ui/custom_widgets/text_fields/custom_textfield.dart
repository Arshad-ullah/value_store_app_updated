import 'package:flutter/material.dart';
import 'package:value_stories_app/core/constants/colors.dart';
import 'package:value_stories_app/core/constants/textstyle.dart';

class CustomTextField extends StatelessWidget {
  final controller;
  final obscure;
  final errorText;
  final hintText;
  final prefixIcon;
  final suffixIcon;
  final validator;
  final label;
  final onSaved;
  CustomTextField(
      {this.controller,
      this.label,
      this.obscure = false,
      this.validator,
      this.errorText,
      this.hintText,
      this.prefixIcon,
      this.onSaved,
      this.suffixIcon});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: this.onSaved,
      style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.w600),
      cursorColor: mainThemeColor,
      controller: this.controller,
      obscureText: this.obscure,
      validator: validator ??
          (value) {
            if (value != null) {
              return this.errorText;
            } else {
              return null;
            }
          },
      decoration: InputDecoration(
        // alignLabelWithHint: true,
        labelText: label,
        labelStyle: headingTextStyle.copyWith(fontSize: 17, color: greyColor),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 24,
          maxWidth: 220,
        ),
        prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 22.0, right: 14),
            child: this.prefixIcon),
        suffixIcon: Padding(
            padding: const EdgeInsets.only(), child: suffixIcon ?? Container()),
        suffixIconConstraints: BoxConstraints(maxHeight: 40, maxWidth: 50),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: mainThemeColor, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: greyColor.withOpacity(0.8)),
          borderRadius: BorderRadius.circular(30),
        ),
        contentPadding: EdgeInsets.only(top: 6, left: 16.0),
        // hintText: "EMAIL ADDRESS",
        // hintStyle:
        //     headingTextStyle.copyWith(fontSize: 17, color: greyColor)
      ),
    );
  }
}
