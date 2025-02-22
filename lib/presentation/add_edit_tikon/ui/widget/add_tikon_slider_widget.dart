import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/core/moa_color.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_tikon_slider_state.dart';
import '../../../../../component/text_widget.dart';

class AddTikonSliderWidget extends StatefulWidget {
  const AddTikonSliderWidget({super.key});

  @override
  State<AddTikonSliderWidget> createState() => _AddTikonSliderWidgetState();
}

class _AddTikonSliderWidgetState extends State<AddTikonSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTikonSliderState, double>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: "기프티콘 할인율",
            textSize: 15.sp,
            textWeight: TextWeight.semiBold,
          ),
          SizedBox(height: 5.h),
          Slider(
            min: 1,
            max: 10,
            divisions: 9,
            label: "${state.toInt()}0%",
            thumbColor: MoaColor.red100,
            inactiveColor: MoaColor.gray100,
            activeColor: MoaColor.red100,
            value: state,
            onChanged: (value) =>
                context.read<AddTikonSliderState>().changeState(value),
          ),
        ],
      );
    });
  }
}
