import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/core/moa_color.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/presentation/add_tikon/ui/add_tikon_screen.dart';

import '../../../../component/image_widget.dart';

class HomeScreenFloatingActionButton extends StatelessWidget {
  const HomeScreenFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MoaNavigator.push(context, const AddTikonScreen()),
      child: Container(
        decoration: const BoxDecoration(
          color: MoaColor.red100,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: ImageWidget(
            image: "assets/image/add_icon.png",
            width: 30.w,
            height: 30.h,
          ),
        ),
      ),
    );
  }
}
