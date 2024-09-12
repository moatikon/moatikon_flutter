import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moatikon_flutter/data/tikon/dto/request/add_tikon_request.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/add/add_tikon_calender_state_cubit.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/add/add_tikon_image_state_cubit.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/tikon_bloc.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/tikon_event.dart';

import '../../../../../component/text_widget.dart';
import '../../../view_model/add/add_screen_category_state.dart';
import '../../../view_model/add/add_screen_slider_state.dart';

class AddScreenBottomSheet extends StatelessWidget {
  final TextEditingController tikonName, storeName;

  const AddScreenBottomSheet({
    super.key,
    required this.tikonName,
    required this.storeName,
  });

  @override
  Widget build(BuildContext context) {
    XFile? imageFile = context.watch<AddTikonImageStateCubit>().state;
    final int disCount = context.watch<AddScreenSliderState>().state.toInt() * 10;

    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: GestureDetector(
        onTap: () {
          if(tikonName.text.isNotEmpty && storeName.text.isNotEmpty && imageFile != null){
            print(disCount.toString());
            context.read<TikonBloc>().add(
              AddTikonEvent(
                addTikonRequest: AddTikonRequest(
                  imageFile: imageFile,
                  storeName: storeName.text,
                  tikonName: tikonName.text,
                  category: context.read<AddScreenCategoryState>().categoryBuilder(),
                  finishedTikon: context.read<AddTikonCalenderStateCubit>().dateTimeFormat(),
                  disCount: disCount,
                ),
              ),
            );
            Navigator.pop(context);
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width - 40.w,
          decoration: BoxDecoration(
              color: const Color(0xFFEA4E46),
              borderRadius: BorderRadius.circular(8.r)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 17.h),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: "추가하기",
                  textSize: 20.sp,
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
