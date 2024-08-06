import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/component/text_widget.dart';
import '../../../view_model/add/slider_state.dart';

class AddScreenSliderWidget extends StatefulWidget {
  const AddScreenSliderWidget({super.key});

  @override
  State<AddScreenSliderWidget> createState() => _AddScreenSliderWidgetState();
}

class _AddScreenSliderWidgetState extends State<AddScreenSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderState, double>(
      builder: (context, state) {
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
              thumbColor: const Color(0xFFEA4E46),
              inactiveColor: const Color(0xFF939493),
              activeColor: const Color(0xFFFF857E),
              value: state,
              onChanged: (value) {
                context.read<SliderState>().changeState(value);
              },
            ),
          ],
        );
      }
    );
  }
}
