import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/core/moa_color.dart';

class AuthRichTextWidget extends StatelessWidget {
  final String firstText, secondText;

  const AuthRichTextWidget({
    super.key,
    required this.firstText,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        TextSpan(
            children: [
              TextSpan(
                text: firstText,
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: MoaColor.black,
                ),
              ),
              TextSpan(
                text: secondText,
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: MoaColor.red200,
                ),
              ),
            ]
        )
    );
  }
}
