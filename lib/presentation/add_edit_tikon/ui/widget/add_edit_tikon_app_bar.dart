import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/core/moa_font.dart';

import '../../../../component/image_widget.dart';

class AddEditTikonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddEditTikonAppBar({super.key});

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
                onTap: () => Navigator.pop(context),
                child: ImageWidget(
                  image: 'assets/image/arrow_left_icon.png',
                  width: 24.w,
                ),
              ),
              MoaFont.titleSmall(text: "추가하기"),
              SizedBox(width: 24.w)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(52.h);
}
