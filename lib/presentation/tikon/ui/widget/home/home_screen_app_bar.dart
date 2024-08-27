import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/image_widget.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          SizedBox(width: 20.w),
          ImageWidget(
            image: 'assets/image/logo_with_text.png',
            width: 96.w,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(52.h);
}
