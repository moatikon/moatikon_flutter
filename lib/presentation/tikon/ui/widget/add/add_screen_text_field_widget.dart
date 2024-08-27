import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/text_widget.dart';

class AddScreenTextFieldWidget extends StatelessWidget {
  final String title, hintText;
  final TextEditingController controller;
  final FocusNode node;

  const AddScreenTextFieldWidget({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.node,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle fieldTextStyle = TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF939493),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(text: title, textSize: 15.sp, textWeight: TextWeight.semiBold),
        SizedBox(height: 5.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 9.h),
          width: MediaQuery.of(context).size.width - 40.w,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFEA4E46)),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: TextField(
            controller: controller,
            focusNode: node,
            onTapOutside: (event) => node.unfocus(),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: fieldTextStyle,
            ),
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
