import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/moa_button.dart';
import 'package:moatikon_flutter/component/text_widget.dart';
import 'package:moatikon_flutter/core/moa_color.dart';
import 'package:moatikon_flutter/core/moa_font.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';

class MoaDialog extends StatelessWidget {
  final String title, contents;
  final GestureTapCallback onNo, onYes;

  const MoaDialog({
    super.key,
    required this.title,
    required this.contents,
    required this.onNo,
    required this.onYes,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MoaNavigator.pop(context),
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            width: 1.sw - 110.w,
            padding: EdgeInsets.all(24.sp),
            decoration: BoxDecoration(
              color: MoaColor.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8.r),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MoaFont.titleLarge(text: title),
                SizedBox(height: 8.h),
                MoaFont.bodyMedium(text: contents),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: onNo,
                        child: MoaButton(
                          width: (1.sw - 158.w) / 2 - 8.w,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          border: Border.all(color: MoaColor.black),
                          borderRadius: 8.r,
                          text: "아니요",
                          textSize: 20.sp,
                          textWeight: TextWeight.medium,
                        ),
                      ),
                      GestureDetector(
                        onTap: onYes,
                        child: MoaButton(
                          width: (1.sw - 158.w) / 2 - 8.w,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          color: MoaColor.red100,
                          border: Border.all(color: MoaColor.red100),
                          borderRadius: 8.r,
                          text: "네",
                          textSize: 20.sp,
                          textWeight: TextWeight.medium,
                          fontColor: MoaColor.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
