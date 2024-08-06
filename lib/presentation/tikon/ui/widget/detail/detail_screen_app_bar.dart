import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/component/image_widget.dart';

class DetailScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          SizedBox(width: 20.w),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: ImageWidget(
              image: 'assets/image/arrow_right_icon.png',
              width: 24.w,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(52.h);
}