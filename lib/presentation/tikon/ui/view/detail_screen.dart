import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/presentation/tikon/ui/widget/detail/detail_screen_app_bar.dart';
import 'package:moatikon_flutter/presentation/tikon/ui/widget/detail/detail_screen_bottom_sheet.dart';

import '../../../../component/image_widget.dart';
import '../../../../component/my_scaffold.dart';

class DetailScreen extends StatelessWidget {
  final String image;
  const DetailScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      appbar: const DetailScreenAppBar(),
      bottomSheet: const DetailScreenBottomSheet(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageWidget(
              image: image,
              imageType: ImageType.network,
              width: 1.sw,
            ),
          ],
        ),
      ),
    );
  }
}
