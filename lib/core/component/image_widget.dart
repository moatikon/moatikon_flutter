import 'package:flutter/material.dart';

enum ImageType { png, network }

class ImageWidget extends StatelessWidget {
  final String image;
  final ImageType imageType;
  final Color? color;
  final double? width, height;

  const ImageWidget({
    super.key,
    required this.image,
    this.imageType = ImageType.png,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    switch(imageType){
      case ImageType.png:
        return Image.asset(
          image,
          width: width,
          height: height,
          color: color,
        );
      case ImageType.network:
        return Image.network(
          image,
          width: width,
          height: height,
          color: color,
        );
    }
  }
}
