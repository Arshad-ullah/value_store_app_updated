import 'package:flutter/material.dart';

///
///A custom widget with elevation take padding and child as a descendant
///
class ElevatedContainer extends StatelessWidget {
  final padding;
  final child;
  ElevatedContainer({this.padding, @required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 8, // has the effect of softening the shadow
          spreadRadius: 1.2, // has the effect of extending the shadow
          offset: Offset(
            0, // horizontal, move right 10
            0.4, // vertical, move down 10
          ),
        )
      ]),
      padding: padding,
      child: child,
    );
  }
}
