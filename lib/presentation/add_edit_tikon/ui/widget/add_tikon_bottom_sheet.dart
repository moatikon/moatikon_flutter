import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moatikon_flutter/component/moa_button.dart';
import 'package:moatikon_flutter/component/text_widget.dart';
import 'package:moatikon_flutter/component/toast_message.dart';
import 'package:moatikon_flutter/core/moa_color.dart';
import 'package:moatikon_flutter/core/tikon_category.dart';
import 'package:moatikon_flutter/data/tikon/dto/request/add_tikon_request.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_tikon_bloc.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_tikon_calender_state.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_tikon_category_state.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_tikon_event.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_tikon_image_state.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_tikon_slider_state.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddTikonBottomSheet extends StatelessWidget {
  final TextEditingController tikonNameController, storeNameController;

  const AddTikonBottomSheet({
    super.key,
    required this.tikonNameController,
    required this.storeNameController,
  });

  @override
  Widget build(BuildContext context) {
    void showToastMessage({required String message}) {
      showTopSnackBar(
        Overlay.of(context),
        ToastMessage(title: message, isError: true),
      );
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: MoaButton(
        onTap: () {
          XFile? imageFile = context.read<AddTikonImageState>().state;
          String? storeName = storeNameController.text;
          String? tikonName = tikonNameController.text;
          String category = tikonCategory[context.read<AddTikonCategoryState>().state + 1];
          String finishedTikon = context.read<AddTikonCalenderState>().dateTimeFormat();
          int disCount = context.read<AddTikonSliderState>().state.round();

          if (imageFile == null) {
            showToastMessage(message: "이미지를 추가해 주세요");
          }

          if (tikonName.isEmpty) {
            showToastMessage(message: "기프티콘의 이름을 지어주세요");
          }

          if (storeName.isEmpty) {
            showToastMessage(message: "사용처를 적어주세요");
          }

          context.read<AddTikonBloc>().add(
                AddTikonEvent(
                  addTikonRequest: AddTikonRequest(
                    imageFile: imageFile!,
                    storeName: storeName,
                    tikonName: tikonName,
                    category: category,
                    finishedTikon: finishedTikon,
                    disCount: disCount,
                  ),
                ),
              );
        },
        width: MediaQuery.of(context).size.width - 40.w,
        height: 58.h,
        text: "추가하기",
        textSize: 20.sp,
        textWeight: TextWeight.semiBold,
        color: MoaColor.red100,
        fontColor: MoaColor.white,
        borderRadius: 8.r,
      ),
    );
  }
}
