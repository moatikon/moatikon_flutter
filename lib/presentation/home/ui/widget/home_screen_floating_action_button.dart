import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/image_widget.dart';
import 'package:moatikon_flutter/core/moa_color.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/ui/add_edit_tikon_screen.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_edit_tikon_slider_state.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_tikon_calender_state.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_edit_tikon_category_state.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_edit_tikon_image_state.dart';


class HomeScreenFloatingActionButton extends StatelessWidget {
  const HomeScreenFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MoaNavigator.push(
        context,
        MultiBlocProvider(
          providers: [
            BlocProvider<AddEditTikonCalenderState>(create: (context) => AddEditTikonCalenderState()),
            BlocProvider<AddEditTikonSliderState>(create: (context) => AddEditTikonSliderState()),
            BlocProvider<AddEditTikonCategoryState>(create: (context) => AddEditTikonCategoryState()),
            BlocProvider<AddEditTikonImageState>(create: (context) => AddEditTikonImageState()),
          ],
          child: const AddEditTikonScreen(),
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: MoaColor.red100,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: ImageWidget(
            image: "assets/image/add_icon.png",
            width: 30.w,
            height: 30.h,
          ),
        ),
      ),
    );
  }
}
