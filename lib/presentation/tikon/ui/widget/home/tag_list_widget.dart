import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/home/home_screen_tag_state.dart';

import '../../../../../component/text_widget.dart';
import '../../../../../core/tag_list.dart';

class TagListWidget extends StatelessWidget {
  const TagListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenTagState, int>(
      builder: (context, state) {
        return SizedBox(
          height: 25.h,
          child: ListView.builder(
            itemCount: tagList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              bool isSelected = state == index;

              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: GestureDetector(
                  onTap: () => context.read<HomeScreenTagState>().changeState(index),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFEA434D) : const Color(0xFFFFFFFF),
                        border: Border.all(color: isSelected ? const Color(0xFFEA434D) : const Color(0xFF939493)),
                        borderRadius: BorderRadius.circular(30.r)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: TextWidget(
                        text: tagList[index],
                        textSize: 13.sp,
                        textWeight: TextWeight.semiBold,
                        color: isSelected ? const Color(0xFFFFFFFF) : const Color(0xFF939493),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
