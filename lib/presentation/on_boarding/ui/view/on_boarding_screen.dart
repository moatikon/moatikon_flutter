import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/presentation/on_boarding/ui/widget/on_boarding_bottom_sheet.dart';

import '../../../../component/bhs_text_widget.dart';
import '../../../../component/image_widget.dart';
import '../../../../component/my_scaffold.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      body: Center(
        child: Column(
          children: [
            ImageWidget(
              image: 'assets/image/logo.png',
              width: 200.w,
            ),
            BHSTextWidget(
              text: "모아티콘",
              textSize: 40.sp,
            )
          ],
        ),
      ),
      bottomSheet: const OnBoardingBottomSheet(),
    );
  }
}
