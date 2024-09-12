import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/add/add_tikon_image_state_cubit.dart';

import '../../../../component/my_scaffold.dart';
import '../widget/add/add_screen_app_bar.dart';
import '../widget/add/add_screen_bottom_sheet.dart';
import '../widget/add/add_screen_calender_widget.dart';
import '../widget/add/add_screen_image_button_widget.dart';
import '../widget/add/add_screen_select_tag_widget.dart';
import '../widget/add/add_screen_slider_widget.dart';
import '../widget/add/add_screen_text_field_widget.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final ImagePicker imagePicker = ImagePicker();

  late TextEditingController tikonNameController;
  late FocusNode tikonNameNode;

  late TextEditingController storeNameController;
  late FocusNode storeNameNode;

  @override
  void initState() {
    super.initState();
    tikonNameController = TextEditingController();
    tikonNameNode = FocusNode();

    storeNameController = TextEditingController();
    storeNameNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    tikonNameController.dispose();
    tikonNameNode.dispose();

    storeNameController.dispose();
    storeNameNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final XFile? imageFile = context.watch<AddTikonImageStateCubit>().state;

    return MyScaffold(
      appbar: const AddScreenAppBar(),
      bottomSheet: AddScreenBottomSheet(
        tikonName: tikonNameController,
        storeName: storeNameController,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    XFile? imageFile = await imagePicker.pickImage(source: ImageSource.gallery, imageQuality: 100);

                    if(context.mounted){
                      context.read<AddTikonImageStateCubit>().setFile(imageFile!);
                    }
                  },
                  child: Builder(
                    builder: (context) {
                      if(imageFile == null){
                        return const AddImageButtonWidget();
                      } else {
                        return Image.file(File(imageFile.path));
                      }
                    }
                  ),
                ),
                SizedBox(height: 20.h),
                AddScreenTextFieldWidget(
                  title: "기프티콘명",
                  hintText: "기프티콘에 이름을 지어주세요!",
                  controller: tikonNameController,
                  node: tikonNameNode,
                ),
                SizedBox(height: 20.h),
                AddScreenTextFieldWidget(
                  title: "기프티콘 사용처",
                  hintText: "어디서 사용하나요? ex) 모아티콘",
                  controller: storeNameController,
                  node: storeNameNode,
                ),
                SizedBox(height: 20.h),
                const AddScreenCalenderWidget(),
                SizedBox(height: 20.h),
                const AddScreenSliderWidget(),
                SizedBox(height: 20.h),
                const AddScreenSelectTagWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
