import 'package:flutter/material.dart';
import 'package:value_stories_app/core/constants/screen-utils.dart';
import 'package:value_stories_app/core/constants/textstyle.dart';

class RoundedRaisedButton extends StatelessWidget {
  final buttonText;
  final onPressed;
  final color;
  RoundedRaisedButton({this.buttonText, this.onPressed, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      child: RaisedButton(
        onPressed: this.onPressed,
        color: this.color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        padding: const EdgeInsets.symmetric(
          horizontal: 15.6,
        ),
        child: Container(
          constraints: const BoxConstraints(
              minWidth: 88.0,
              minHeight: 36.0), // min sizes for Material buttons
          alignment: Alignment.center,
          child: Text(
            '$buttonText',
            style: buttonTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
