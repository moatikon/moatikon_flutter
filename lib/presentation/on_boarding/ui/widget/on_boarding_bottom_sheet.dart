import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/moa_button.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/presentation/auth/ui/view/sign_up_screen.dart';

import '../../../../component/text_widget.dart';
import '../../../auth/ui/view/sign_in_screen.dart';

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
            onTap: () => MoaNavigator.push(context, const SignInScreen()),

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
            onTap: () => MoaNavigator.push(context, const SignUpScreen()),

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
