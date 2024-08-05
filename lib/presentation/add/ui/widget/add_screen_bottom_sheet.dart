import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/core/component/text_widget.dart';

class AddScreenBottomSheet extends StatelessWidget {
  const AddScreenBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            color: const Color(0xFFEA4E46),
            borderRadius: BorderRadius.circular(8.r)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 17.h),
            child: const Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: "추가하기",
                  textSize: 20,
                  textWeight: TextWeight.medium,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
