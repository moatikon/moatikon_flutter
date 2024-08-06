import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/component/text_widget.dart';

class DetailScreenBottomSheet extends StatelessWidget {
  const DetailScreenBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width - 60.w,
        decoration: BoxDecoration(
            color: const Color(0xFFEA4E46),
            borderRadius: BorderRadius.circular(20.r)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                text: "기프티콘 사용완료",
                textSize: 25.sp,
                textWeight: TextWeight.semiBold,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
