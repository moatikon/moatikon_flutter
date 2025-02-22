import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/core/moa_color.dart';
import 'package:moatikon_flutter/core/moa_font.dart';
import 'package:moatikon_flutter/core/tikon_category.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_tikon_category_state.dart';

class AddTikonCategoryWidget extends StatelessWidget {
  const AddTikonCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTikonCategoryState, int>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MoaFont.titleTiny(text: "카테고리"),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List<Widget>.generate(
                tikonCategory.length - 1,
                (index) {
                  return GestureDetector(
                    onTap: () => context
                        .read<AddTikonCategoryState>()
                        .changeState(index),
                    behavior: HitTestBehavior.opaque,
                    child: Row(
                      children: [
                        Container(
                          width: 20.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: state == index ? MoaColor.red100 : null,
                            border: state == index
                                ? Border.all(color: MoaColor.red100)
                                : Border.all(color: MoaColor.gray200),
                            shape: BoxShape.circle,
                            // border: Border.all(color: )
                          ),
                        ),
                        SizedBox(width: 10.w),
                        MoaFont.titleTiny(text: tikonCategory[index + 1])
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      );
    });
  }
}
