import 'package:flutter/material.dart';

///
/// All corners rounded except bottom right
///
const BorderRadius chatBorderRadiusRight = BorderRadius.only(
  topLeft: Radius.circular(20.0),
  topRight: Radius.circular(20.0),
  bottomLeft: Radius.circular(20.0),
);

///
/// All corners rounded except bottom left
///
const BorderRadius chatBorderRadiusLeft = BorderRadius.only(
  topLeft: Radius.circular(20.0),
  bottomRight: Radius.circular(20.0),
  topRight: Radius.circular(20.0),
);
