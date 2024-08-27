import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/moa_button.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/presentation/tikon/ui/view/home_screen.dart';

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
          MoaButton(
            onTap: () => MoaNavigator.go(context, const HomeScreen()),

            text: "로그인",
            textSize: 20.sp,
            textWeight: TextWeight.medium,
            fontColor: Colors.white,
            color: const Color(0xFFEA4E46),
            borderRadius: 8.r,
            padding: EdgeInsets.symmetric(vertical: 17.h),
          ),
          SizedBox(height: 20.h),
          MoaButton(
            text: "회원가입",
            textSize: 20.sp,
            textWeight: TextWeight.medium,
            fontColor: Colors.black,
            border: Border.all(color: const Color(0xFFEA4E46)),
            borderRadius: 8.r,
            padding: EdgeInsets.symmetric(vertical: 17.h),
          ),
        ],
      ),
    );
  }
}
