import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../component/text_widget.dart';

class AddImageButtonWidget extends StatelessWidget {
  const AddImageButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFEA4E46),
          borderRadius: BorderRadius.circular(10.r)
      ),
      child: Padding(
        padding: EdgeInsets.all(15.w),
        child: Column(
          children: [
            ImageWidget(
              image: "assets/image/picture_icon.png",
              width: 80.w,
              height: 80.h,
            ),
            SizedBox(height: 10.h),
            TextWidget(
              text: "기프티콘 추가하기",
              textSize: 20.sp,
              textWeight: TextWeight.bold,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
