import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/image_widget.dart';
import 'package:moatikon_flutter/core/moa_color.dart';
import 'package:moatikon_flutter/core/moa_font.dart';

class ProfileActionButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String title;
  final Color? fontColor;

  const ProfileActionButton({
    super.key,
    required this.onTap,
    required this.title,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 1.sw - 40.w,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        decoration: BoxDecoration(
          border: Border.all(color: MoaColor.gray100),
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MoaFont.titleTiny(text: title, color: fontColor),
            ImageWidget(
              image: 'assets/image/arrow_right_icon.png',
              width: 24.w,
              color: MoaColor.gray200,
            )
          ],
        ),
      ),
    );
  }
}
