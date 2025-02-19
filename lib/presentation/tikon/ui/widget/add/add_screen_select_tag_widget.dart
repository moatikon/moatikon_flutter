import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/add/add_screen_category_state.dart';

import '../../../../../component/text_widget.dart';
import '../../../../../core/tikon_category.dart';


class AddScreenSelectTagWidget extends StatelessWidget {
  const AddScreenSelectTagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> subTagList = tikonCategory.sublist(1);

    return BlocBuilder<AddScreenCategoryState, int>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: "태그",
              textSize: 15.sp,
              textWeight: TextWeight.semiBold,
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  subTagList.length,
                  (index) {
                    return GestureDetector(
                      onTap: () => context.read<AddScreenCategoryState>().changeState(index),
                      behavior: HitTestBehavior.opaque,
                      child: Row(
                        children: [
                          Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              color: state == index ? const Color(0xFFEA4E46) : null,
                              border: Border.all(color: state == index ? const Color(0xFFEA4E46) : const Color(0xFF939493)),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          TextWidget(
                            text: subTagList[index],
                            textSize: 16.sp,
                            textWeight: TextWeight.semiBold,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
