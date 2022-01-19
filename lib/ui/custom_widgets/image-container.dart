import 'package:flutter/material.dart';

/// ImageContainer creates container with specific height and width
/// and use Image as backgroung image of the container
class ImageContainer extends StatelessWidget {
  final double? height, width, size;
  final String? assetImage;
  ImageContainer({this.height, this.width, this.size, this.assetImage});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? height,
      width: size ?? width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetImage!),
        ),
      ),
    );
  }
}
