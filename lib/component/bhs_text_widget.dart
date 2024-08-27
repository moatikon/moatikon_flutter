import 'package:flutter/material.dart';

class BHSTextWidget extends StatelessWidget {
  final String text;
  final double textSize;
  final Color? color;


  const BHSTextWidget({
    super.key,
    required this.text,
    required this.textSize,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: "BlackHanSans",
          fontSize: textSize,
          color: color,
          fontWeight: FontWeight.w400,
      ),
    );
  }
}