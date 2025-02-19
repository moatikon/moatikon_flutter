import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/moa_button.dart';
import 'package:moatikon_flutter/component/text_widget.dart';
import 'package:moatikon_flutter/core/moa_color.dart';
import 'package:moatikon_flutter/core/moa_font.dart';
import 'package:moatikon_flutter/core/tikon_category.dart';
import 'package:moatikon_flutter/presentation/home/view_model/home_category_state.dart';

class HomeCategoryWidget extends StatelessWidget {
  const HomeCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCategoryState, int>(
      builder: (context, state) {
        return SizedBox(
          height: 30.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tikonCategory.length,
            itemBuilder: (context, index) {
              bool currentValue = index == state;

              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: MoaButton(
                  onTap: () => context.read<HomeCategoryState>().changeState(index),
                  textSize: 14.sp,
                  borderRadius: 30.r,
                  text: tikonCategory[index],
                  textWeight: TextWeight.medium,
                  color: currentValue ? MoaColor.red100 : null,
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  fontColor: currentValue ? MoaColor.white : MoaColor.gray200,
                  border: currentValue ? Border.all(color: MoaColor.red100) : Border.all(color: MoaColor.gray200),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
