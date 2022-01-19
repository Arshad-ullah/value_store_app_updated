import 'package:flutter/material.dart';
import 'package:value_stories_app/core/constants/textstyle.dart';

class RoundedGradientButton extends StatelessWidget {
  final buttonText;
  final onPressed;
  RoundedGradientButton({this.buttonText, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: RaisedButton(
        onPressed: this.onPressed,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Ink(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFFFC2D00),
              Color(0xFFF6A18F),
            ]),
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
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
      ),
    );
  }
}
