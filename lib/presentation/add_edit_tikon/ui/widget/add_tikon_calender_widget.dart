import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/core/moa_color.dart';
import 'package:moatikon_flutter/core/moa_font.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_tikon_calender_model.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_tikon_calender_state.dart';

import '../../../../../component/text_widget.dart';

class AddTikonCalenderWidget extends StatelessWidget {
  const AddTikonCalenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTikonCalenderState, AddTikonCalenderModel>(
        builder: (_, state) {
      return GestureDetector(
        onTap: () => context
            .read<AddTikonCalenderState>()
            .overlayCalenderInset(context: context),
        child: CompositedTransformTarget(
          link: state.calenderLayerLink,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MoaFont.titleTiny(text: "기프티콘 만료일"),
              SizedBox(height: 5.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 9.h),
                width: MediaQuery.of(context).size.width - 40.w,
                decoration: BoxDecoration(
                  border: Border.all(color: MoaColor.red100),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: MoaFont.bodyMedium(
                  text: "${state.date.year}년 ${state.date.month}월 ${state.date.day}일",
                  color: MoaColor.gray200,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
