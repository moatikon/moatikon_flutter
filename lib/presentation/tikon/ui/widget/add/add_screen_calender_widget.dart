import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/add/add_tikon_calender_model.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/add/add_tikon_calender_state_cubit.dart';

import '../../../../../component/text_widget.dart';

class AddScreenCalenderWidget extends StatelessWidget {
  const AddScreenCalenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTikonCalenderStateCubit, AddTikonCalenderModel>(
      builder: (_, state) {
        return GestureDetector(
          onTap: () => context.read<AddTikonCalenderStateCubit>().overlayCalenderInset(context: context),
          child: CompositedTransformTarget(
            link: state.calenderLayerLink,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: "기프티콘 만료일", textSize: 15.sp, textWeight: TextWeight.semiBold),
                SizedBox(height: 5.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 9.h),
                  width: MediaQuery.of(context).size.width - 40.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFEA4E46)),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: TextWidget(
                    text: "${state.date.year}년 ${state.date.month}월 ${state.date.day}일",
                    textSize: 15.sp,
                    textWeight: TextWeight.semiBold,
                    color: const Color(0xFF939493),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}