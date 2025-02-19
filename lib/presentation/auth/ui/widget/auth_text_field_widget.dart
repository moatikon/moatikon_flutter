import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/core/moa_color.dart';

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
        color: MoaColor.black,
        overflow: TextOverflow.visible,
      ),
      cursorHeight: 20.h,
      cursorColor: MoaColor.black,
      cursorErrorColor: MoaColor.black,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: "Pretendard",
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
          color: MoaColor.gray200,
        ),
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: MoaColor.red100)),
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: MoaColor.gray200)),
        errorBorder: const UnderlineInputBorder(borderSide: BorderSide(color: MoaColor.red200)),
        focusedErrorBorder: const UnderlineInputBorder(borderSide: BorderSide(color: MoaColor.red200)),
        error: errorWidget,
      ),
    );
  }
}
