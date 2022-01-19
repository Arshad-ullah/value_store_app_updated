import 'package:flutter/material.dart';
import 'package:value_stories_app/core/constants/dimensions.dart';

class OnBoarding {
  String? imageUrl;
  String? title;
  Color? bgColor;
  String? content;
  Dimensions? dimensions;

  OnBoarding(
      {this.imageUrl, this.bgColor, this.title, this.content, this.dimensions});
}
