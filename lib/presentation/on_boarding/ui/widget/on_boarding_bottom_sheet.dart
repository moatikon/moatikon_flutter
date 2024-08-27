import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/text_widget.dart';

class OnBoardingBottomSheet extends StatelessWidget {
  const OnBoardingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 40.w,
            decoration: BoxDecoration(
              color: const Color(0xFFEA4E46),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 17.h),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    text: "로그인",
                    textSize: 20.sp,
                    textWeight: TextWeight.medium,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            width: MediaQuery.of(context).size.width - 40.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFEA4E46),
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 17.h),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    text: "회원가입",
                    textSize: 20.sp,
                    textWeight: TextWeight.medium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
