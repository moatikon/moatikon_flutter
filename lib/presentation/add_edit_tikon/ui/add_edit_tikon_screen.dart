import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/my_scaffold.dart';
import 'package:moatikon_flutter/component/toast_message.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_enum.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_none_value.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/ui/widget/add_edit_tikon_app_bar.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/ui/widget/add_edit_tikon_bottom_sheet.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/ui/widget/add_edit_tikon_calender_widget.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/ui/widget/add_edit_tikon_category_widget.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/ui/widget/add_edit_tikon_image_button_widget.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/ui/widget/add_edit_tikon_slider_widget.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/ui/widget/add_edit_tikon_text_field_widget.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_edit_tikon_bloc.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddEditTikonScreen extends StatefulWidget {
  const AddEditTikonScreen({super.key});

  @override
  State<AddEditTikonScreen> createState() => _AddEditTikonScreenState();
}

class _AddEditTikonScreenState extends State<AddEditTikonScreen> {
  late TextEditingController _tikonNameController;
  late TextEditingController _storeNameController;

  late FocusNode _tikonNameNode;
  late FocusNode _storeNameNode;

  @override
  void initState() {
    super.initState();
    _tikonNameController = TextEditingController();
    _storeNameController = TextEditingController();

    _tikonNameNode = FocusNode();
    _storeNameNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _tikonNameController.dispose();
    _storeNameController.dispose();

    _tikonNameNode.dispose();
    _storeNameNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AddEditTikonBloc, BlocStateNoneValue>(
          listenWhen: (_, current) => current.blocState == BlocStateEnum.loaded,
          listener: (context, state) {
            MoaNavigator.pop(context);
          },
        ),

        BlocListener<AddEditTikonBloc, BlocStateNoneValue>(
          listenWhen: (_, current) => current.blocState == BlocStateEnum.error,
          listener: (context, state) {
            showTopSnackBar(
              Overlay.of(context),
              ToastMessage(
                title: state.error.message,
                isError: true,
              ),
            );
          },
        ),
      ],
      child: MyScaffold(
        appbar: const AddEditTikonAppBar(),
        bottomSheet: AddEditTikonBottomSheet(
          tikonNameController: _tikonNameController,
          storeNameController: _storeNameController,
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
          child: Center(
            child: Column(
              children: [
                const AddEditTikonImageButtonWidget(),
                SizedBox(height: 20.h),
                AddEditTikonTextFieldWidget(
                  title: "기프티콘명",
                  hintText: "기프티콘에 이름을 지어주세요!",
                  controller: _tikonNameController,
                  node: _tikonNameNode,
                ),
                SizedBox(height: 20.h),
                AddEditTikonTextFieldWidget(
                  title: "기프티콘 사용처",
                  hintText: "어디서 사용하나요? ex) 모아티콘",
                  controller: _storeNameController,
                  node: _storeNameNode,
                ),
                SizedBox(height: 20.h),
                const AddEditTikonCalenderWidget(),
                SizedBox(height: 20.h),
                const AddEditTikonSliderWidget(),
                SizedBox(height: 20.h),
                const AddEditTikonCategoryWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
