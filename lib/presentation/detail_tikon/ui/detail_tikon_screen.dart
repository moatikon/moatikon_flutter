import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/image_widget.dart';
import 'package:moatikon_flutter/component/moa_button.dart';
import 'package:moatikon_flutter/component/my_scaffold.dart';
import 'package:moatikon_flutter/component/text_widget.dart';
import 'package:moatikon_flutter/component/toast_message.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_enum.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_none_value.dart';
import 'package:moatikon_flutter/core/moa_color.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/domain/tikon/entity/tikon_entity.dart';
import 'package:moatikon_flutter/presentation/detail_tikon/ui/widget/detail_tikon_app_bar.dart';
import 'package:moatikon_flutter/presentation/detail_tikon/view_model/detail_tikon_bloc.dart';
import 'package:moatikon_flutter/presentation/home/ui/home_screen.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class DetailTikonScreen extends StatelessWidget {
  final TikonEntity tikonEntity;

  const DetailTikonScreen({
    super.key,
    required this.tikonEntity,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DetailTikonBloc, BlocStateNoneValue>(
          listenWhen: (_, current) => current.blocState == BlocStateEnum.loaded,
          listener: (context, state) {
            showTopSnackBar(
              Overlay.of(context),
              const ToastMessage(title: "삭제가 완료되었습니다."),
            );
            MoaNavigator.teleporting(context, const HomeScreen());
          },
        ),

        BlocListener<DetailTikonBloc, BlocStateNoneValue>(
          listenWhen: (_, current) => current.blocState == BlocStateEnum.error,
          listener: (context, state) {
            showTopSnackBar(
              Overlay.of(context),
              ToastMessage(title: state.error.message),
            );
          },
        )
      ],
      child: MyScaffold(
        appbar: DetailTikonAppBar(
          title: tikonEntity.tikonName,
          tikonId: tikonEntity.id,
        ),
        bottomSheet: Container(
          width: 1.sw,
          height: 78.h,
          alignment: Alignment.center,
          child: MoaButton(
            width: 1.sw - 40.w,
            height: 58.h,
            borderRadius: 8.r,
            color: MoaColor.red100,
            text: "기프티콘 사용 완료",
            textSize: 20.sp,
            textWeight: TextWeight.semiBold,
            fontColor: MoaColor.white,
          ),
        ),
        body: ImageWidget(
          width: 1.sw,
          height: 1.sh,
          image: tikonEntity.image,
          imageType: ImageType.network,
        ),
      ),
    );
  }
}
