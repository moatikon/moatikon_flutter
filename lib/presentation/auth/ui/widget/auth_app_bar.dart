import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/image_widget.dart';
import 'package:moatikon_flutter/component/text_widget.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AuthAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => MoaNavigator.pop(context),
                child: ImageWidget(
                  image: "assets/image/arrow_left_icon.png",
                  width: 24.w,
                ),
              ),
              TextWidget(text: title, textSize: 20.sp, textWeight: TextWeight.medium),
              SizedBox(width: 24.w),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(52.h);
}
