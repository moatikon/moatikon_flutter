import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/my_scaffold.dart';
import 'package:moatikon_flutter/presentation/add_tikon/ui/widget/add_tikon_app_bar.dart';
import 'package:moatikon_flutter/presentation/add_tikon/ui/widget/add_tikon_bottom_sheet.dart';
import 'package:moatikon_flutter/presentation/add_tikon/ui/widget/add_tikon_calender_widget.dart';
import 'package:moatikon_flutter/presentation/add_tikon/ui/widget/add_tikon_category_widget.dart';
import 'package:moatikon_flutter/presentation/add_tikon/ui/widget/add_tikon_image_button_widget.dart';
import 'package:moatikon_flutter/presentation/add_tikon/ui/widget/add_tikon_slider_widget.dart';
import 'package:moatikon_flutter/presentation/add_tikon/ui/widget/add_tikon_text_field_widget.dart';

class AddTikonScreen extends StatefulWidget {
  const AddTikonScreen({super.key});

  @override
  State<AddTikonScreen> createState() => _AddTikonScreenState();
}

class _AddTikonScreenState extends State<AddTikonScreen> {
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
    return MyScaffold(
      appbar: const AddTikonAppBar(),
      bottomSheet: AddTikonBottomSheet(
        tikonNameController: _tikonNameController,
        storeNameController: _storeNameController,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
        child: Center(
          child: Column(
            children: [
              const AddTikonImageButtonWidget(),
              SizedBox(height: 20.h),
              AddTikonTextFieldWidget(
                title: "기프티콘명",
                hintText: "기프티콘에 이름을 지어주세요!",
                controller: _tikonNameController,
                node: _tikonNameNode,
              ),
              SizedBox(height: 20.h),
              AddTikonTextFieldWidget(
                title: "기프티콘 사용처",
                hintText: "어디서 사용하나요? ex) 모아티콘",
                controller: _storeNameController,
                node: _storeNameNode,
              ),
              SizedBox(height: 20.h),
              const AddTikonCalenderWidget(),
              SizedBox(height: 20.h),
              const AddTikonSliderWidget(),
              SizedBox(height: 20.h),
              const AddTikonCategoryWidget()
            ],
          ),
        ),
      ),
    );
  }
}
