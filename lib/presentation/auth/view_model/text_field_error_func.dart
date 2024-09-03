import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../component/text_widget.dart';
import '../../../core/bloc_state_enum.dart';
import 'auth_state.dart';

class TextFieldErrorFunc {
  static TextWidget? emailText({required AuthState state, required TextEditingController emailController}) {
    RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    if(emailController.text.isNotEmpty && !regex.hasMatch(emailController.text)){
      return TextWidget(
        text: "이메일 형식을 지켜주세요",
        textSize: 12.sp,
        textWeight: TextWeight.regular,
        color: const Color(0xFFF5290A),
      );
    }

    if (state.authState == BlocStateEnum.error) {
      return TextWidget(
        text: "동일한 이메일이 존재합니다.",
        textSize: 12.sp,
        textWeight: TextWeight.regular,
        color: const Color(0xFFF5290A),
      );
    }

    return null;
  }

  static TextWidget? passwordNotMatchText({required TextEditingController passwordController}) {
    RegExp regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&+=])[A-Za-z\d@$!%*#?&]{4,20}$');

    if (passwordController.text.isNotEmpty && !regex.hasMatch(passwordController.text)) {
      return TextWidget(
        text: "비밀번호는 4~20글자에 문자, 숫자, 특수문자가 다 포함되어야 합니다.",
        textSize: 12.sp,
        textWeight: TextWeight.regular,
        color: const Color(0xFFF5290A),
      );
    }

    return null;
  }

  static TextWidget? passWordNotCompareText({
    required TextEditingController passwordController,
    required TextEditingController passwordCompareController,
  }) {
    if (passwordController.text.isNotEmpty &&
        passwordController.text != passwordCompareController.text) {
      return TextWidget(
        text: "비밀번호가 일치하지 않습니다.",
        textSize: 12.sp,
        textWeight: TextWeight.regular,
        color: const Color(0xFFF5290A),
      );
    }

    return null;
  }
}