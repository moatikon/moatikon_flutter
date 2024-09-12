import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/text_widget.dart';

class ToastMessage extends StatelessWidget {
  final String title;
  final bool isError;

  const ToastMessage({super.key, required this.title, this.isError = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Builder(
        builder: (_) {
          if(!isError){
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              width: 1.sw,
              decoration: BoxDecoration(
                color: const Color(0xFFE4E6EB),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: TextWidget(
                text: title,
                textWeight: TextWeight.medium,
                textSize: 16.sp,
              ),
            );
          } else {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              width: 1.sw,
              decoration: BoxDecoration(
                color: const Color(0xFFF5E8E6),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: TextWidget(
                text: title,
                textWeight: TextWeight.medium,
                textSize: 16.sp,
                color: const Color(0xFFCC2208),
              ),
            );
          }
        },
      ),
    );
  }
}
