import 'package:flutter/material.dart';
import 'package:value_stories_app/core/constants/colors.dart';

class CustomWidget extends StatelessWidget {
  final double size;
  final Widget? child;
  final double borderWidth;
  final image;
  final bool isActive;
  final VoidCallback onTap;

  CustomWidget({
    this.child,
    required this.onTap,
    required this.size,
    this.borderWidth = 2,
    this.image,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(200),
      ),
      border: Border.all(
        width: borderWidth,
        color: isActive ? Colors.blue : mainThemeColor,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.blue.withOpacity(0.6),
          blurRadius: 10,
          offset: Offset(5, 5),
          spreadRadius: 3,
        ),
        BoxShadow(
          color: Colors.white,
          blurRadius: 10,
          offset: Offset(-5, -5),
          spreadRadius: 3,
        )
      ],
    );

    if (image != null) {
      boxDecoration = boxDecoration.copyWith(
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      );
    }
    if (isActive) {
      boxDecoration = boxDecoration.copyWith(
        gradient: RadialGradient(
          colors: [Colors.blue, Colors.lightBlue],
        ),
      );
    } else {
      boxDecoration = boxDecoration.copyWith(
        gradient: RadialGradient(
          colors: [
            mainThemeColor,
            mainThemeColor,
            mainThemeColor,
            Colors.white,
          ],
        ),
      );
    }
    return Container(
      height: size,
      width: size,
      decoration: boxDecoration,
      child: FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: onTap,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(200),
          )),
          child: child ?? Container()),
    );
  }
}
