import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/component/text_widget.dart';

class DetailScreenBottomSheet extends StatelessWidget {
  const DetailScreenBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width - 40.w,
        decoration: BoxDecoration(
            color: const Color(0xFFEA4E46),
            borderRadius: BorderRadius.circular(8.r)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 17.h),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                text: "기프티콘 사용완료",
                textSize: 20.sp,
                textWeight: TextWeight.medium,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
