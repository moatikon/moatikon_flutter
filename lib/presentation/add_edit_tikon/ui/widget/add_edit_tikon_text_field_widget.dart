import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/core/moa_color.dart';
import 'package:moatikon_flutter/core/moa_font.dart';

class AddEditTikonTextFieldWidget extends StatelessWidget {
  final String title, hintText;
  final TextEditingController controller;
  final FocusNode node;
  final ValueChanged<String>? onSubmit;

  const AddEditTikonTextFieldWidget({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.node,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MoaFont.titleTiny(text: title),
        SizedBox(height: 5.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 9.h),
          width: MediaQuery.of(context).size.width - 40.w,
          decoration: BoxDecoration(
            border: Border.all(color: MoaColor.red100),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: TextField(
            controller: controller,
            focusNode: node,
            onSubmitted: onSubmit,
            onTapOutside: (event) => node.unfocus(),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: MoaColor.gray200,
              ),
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
