import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  const MyImage({
    super.key, 
    required this.image, 
    required this.height, 
    required this.width
  });

  final String image;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(
        image
      ),
      width: width,
      height: height,
    );
  }
}