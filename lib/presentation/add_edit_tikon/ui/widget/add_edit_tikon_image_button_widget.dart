import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moatikon_flutter/core/moa_color.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_edit_tikon_image_state.dart';

import '../../../../../component/image_widget.dart';

class AddEditTikonImageButtonWidget extends StatefulWidget {
  const AddEditTikonImageButtonWidget({super.key});

  @override
  State<AddEditTikonImageButtonWidget> createState() =>
      _AddEditTikonImageButtonWidgetState();
}

class _AddEditTikonImageButtonWidgetState extends State<AddEditTikonImageButtonWidget> {
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        XFile? imageFile = await imagePicker.pickImage(
            source: ImageSource.gallery, imageQuality: 100);

        if (context.mounted) {
          context.read<AddEditTikonImageState>().setFile(imageFile!);
        }
      },
      child: BlocBuilder<AddEditTikonImageState, XFile?>(builder: (context, state) {
        if (state == null) {
          return Container(
            width: 195.w,
            height: 195.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: MoaColor.red100,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: ImageWidget(
              image: "assets/image/picture_icon.png",
              width: 80.w,
              height: 80.h,
            ),
          );
        } else {
          return SizedBox(
            height: 195.w,
            child: Image.file(
              File(state.path),
              fit: BoxFit.cover,
            ),
          );
        }
      }),
    );
  }
}
