import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/domain/tikon/entity/tikon_entity.dart';
import 'package:moatikon_flutter/presentation/tikon/ui/widget/detail/detail_screen_app_bar.dart';
import 'package:moatikon_flutter/presentation/tikon/ui/widget/detail/detail_screen_bottom_sheet.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/tikon_bloc.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/tikon_event.dart';

import '../../../../component/image_widget.dart';
import '../../../../component/my_scaffold.dart';

class DetailScreen extends StatelessWidget {
  final TikonEntity tikonData;
  const DetailScreen({super.key, required this.tikonData});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      appbar: const DetailScreenAppBar(),
      bottomSheet: GestureDetector(
        onTap: () {
          context.read<TikonBloc>().add(
            CompleteTikonEvent(id: tikonData.id),
          );

          MoaNavigator.pop(context);
        },
        child: const DetailScreenBottomSheet(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageWidget(
              image: tikonData.image,
              imageType: ImageType.network,
              width: 1.sw,
            ),
          ],
        ),
      ),
    );
  }
}
