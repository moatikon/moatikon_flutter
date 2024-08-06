import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/core/component/image_widget.dart';

import '../../../view_model/add/add_screen_slider_state.dart';
import '../../../view_model/add/add_screen_tag_state.dart';
import '../../view/add/add_screen.dart';

class HomeScreenFloatingActionButton extends StatelessWidget {
  const HomeScreenFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddScreen()),
        );

        if (context.mounted) {
          context.read<AddScreenSliderState>().init();
          context.read<AddScreenTagState>().init();
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFEA4E46),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: const ImageWidget(
            image: "assets/image/add_icon.png",
            width: 30,
            height: 30,
          ),
        ),
      ),
    );
  }
}
