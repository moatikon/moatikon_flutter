import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/image_widget.dart';
import 'package:moatikon_flutter/core/moa_font.dart';
import 'package:moatikon_flutter/presentation/detail_tikon/ui/widget/detail_tikon_option_dialog.dart';

class DetailTikonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title, tikonId;

  const DetailTikonAppBar({
    super.key,
    required this.title,
    required this.tikonId,
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
                onTap: () => Navigator.pop(context),
                child: ImageWidget(
                  image: 'assets/image/arrow_left_icon.png',
                  width: 24.w,
                ),
              ),
              MoaFont.titleSmall(text: title),
              GestureDetector(
                onTap: () {
                  showGeneralDialog(
                    context: context,
                    barrierColor: Colors.black.withOpacity(0),
                    pageBuilder: (_, __, ___) {
                      return DetailTikonOptionDialog(id: tikonId);
                    },
                  );
                },
                child: ImageWidget(
                  image: 'assets/image/mage_dots.png',
                  width: 24.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(52.h);
}
