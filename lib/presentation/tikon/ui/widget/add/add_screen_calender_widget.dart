import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/component/text_widget.dart';

class AddScreenCalenderWidget extends StatelessWidget {
  const AddScreenCalenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(text: "기프티콘 만료일", textSize: 15.sp, textWeight: TextWeight.semiBold),
        SizedBox(height: 5.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 9.h),
          width: MediaQuery.of(context).size.width - 40.w,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFEA4E46)),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: TextWidget(
            text: "2024년 08월 01일",
            textSize: 15.sp,
            textWeight: TextWeight.semiBold,
            color: const Color(0xFF939493),
          ),
        )
      ],
    );
  }
}