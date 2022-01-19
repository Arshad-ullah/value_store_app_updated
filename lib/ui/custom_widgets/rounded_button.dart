import 'package:flutter/material.dart';
import 'package:value_stories_app/core/constants/textstyle.dart';

class RoundedButton extends StatelessWidget {
  final text;
  final textColor;
  final onPressed;
  final color;
  final double circularBorderRadius;

  RoundedButton(
      {@required this.text,
      @required this.onPressed,
      this.textColor,
      this.color,
      this.circularBorderRadius = 25.0});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      colorBrightness: Brightness.light,
      textColor: this.textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(this.circularBorderRadius),
      ),
      color: this.color,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: buttonTextStyle.copyWith(color: textColor),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
