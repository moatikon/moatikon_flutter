import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode node;
  final String hintText;
  final Widget? errorWidget;
  final bool? isObscure;

  const AuthTextFieldWidget({
    super.key,
    required this.controller,
    required this.node,
    required this.hintText,
    this.isObscure,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure ?? false,
      focusNode: node,
      onTapOutside: (_) => node.unfocus(),
      style: TextStyle(
        fontFamily: "Pretendard",
        height: 1.h,
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        overflow: TextOverflow.visible,
      ),
      cursorHeight: 20.h,
      cursorColor: Colors.black,
      cursorErrorColor: Colors.black,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: "Pretendard",
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF939599),
        ),
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFEA4E46))),
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF939599))),
        errorBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFF5290A))),
        focusedErrorBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFF5290A))),
        error: errorWidget,
      ),
    );
  }
}
