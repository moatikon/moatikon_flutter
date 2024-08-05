import 'package:flutter/material.dart';

enum TextWeight {
  thin,
  extraLight,
  light,
  regular,
  medium,
  semiBold,
  bold,
  extraBold,
  black
}

class TextWidget extends StatelessWidget {
  final String text;
  final double textSize;
  final TextWeight textWeight;
  final Color? color;


  const TextWidget({
    super.key,
    required this.text,
    required this.textSize,
    required this.textWeight,
    this.color,
  });

  FontWeight fontWeight(TextWeight textWeight){
    switch(textWeight){
      case TextWeight.thin:
        return FontWeight.w100;

      case TextWeight.extraLight:
        return FontWeight.w200;

      case TextWeight.light:
        return FontWeight.w300;

      case TextWeight.regular:
        return FontWeight.w400;

      case TextWeight.medium:
        return FontWeight.w500;

      case TextWeight.semiBold:
        return FontWeight.w600;

      case TextWeight.bold:
        return FontWeight.w700;

      case TextWeight.extraBold:
        return FontWeight.w800;

      case TextWeight.black:
        return FontWeight.w900;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Pretendard",
        fontSize: textSize,
        color: color,
        fontWeight: fontWeight(textWeight),
      ),
    );
  }
}
