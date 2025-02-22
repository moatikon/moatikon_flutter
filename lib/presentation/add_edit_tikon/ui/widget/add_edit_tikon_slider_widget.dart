import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/core/moa_color.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_edit_tikon_slider_state.dart';
import '../../../../../component/text_widget.dart';

class AddEditTikonSliderWidget extends StatefulWidget {
  const AddEditTikonSliderWidget({super.key});

  @override
  State<AddEditTikonSliderWidget> createState() => _AddEditTikonSliderWidgetState();
}

class _AddEditTikonSliderWidgetState extends State<AddEditTikonSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEditTikonSliderState, double>(builder: (context, state) {
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
                context.read<AddEditTikonSliderState>().changeState(value),
          ),
        ],
      );
    });
  }
}
