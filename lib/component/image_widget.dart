import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum ImageType { png, network }

class ImageWidget extends StatelessWidget {
  final String image;
  final ImageType imageType;
  final Color? color;
  final double? width, height;
  final BoxFit? fit;

  const ImageWidget({
    super.key,
    required this.image,
    this.imageType = ImageType.png,
    this.width,
    this.height,
    this.color,
    this.fit,
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
          fit: fit,
        );
      case ImageType.network:
        return CachedNetworkImage(
          imageUrl: image,
          width: width,
          height: height,
          color: color,
          fit: fit,
        );
    }
  }
}
