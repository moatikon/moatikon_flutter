import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/moa_dialog.dart';
import 'package:moatikon_flutter/core/moa_font.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/domain/tikon/entity/tikon_entity.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/ui/add_edit_tikon_screen.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_edit_tikon_category_state.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_edit_tikon_image_state.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_edit_tikon_slider_state.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_tikon_calender_state.dart';
import 'package:moatikon_flutter/presentation/detail_tikon/view_model/detail_tikon_bloc.dart';
import 'package:moatikon_flutter/presentation/detail_tikon/view_model/detail_tikon_event.dart';

class DetailTikonOptionDialog extends StatelessWidget {
  final TikonEntity tikon;

  const DetailTikonOptionDialog({super.key, required this.tikon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MoaNavigator.pop(context),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(right: 46.w, top: 80.h),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 140.w,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x4C000000),
                    blurRadius: 6,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  )
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(20.r),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      MoaNavigator.push(
                        context,
                        MultiBlocProvider(
                          providers: [
                            BlocProvider<AddEditTikonCalenderState>(
                                create: (context) =>
                                    AddEditTikonCalenderState()),
                            BlocProvider<AddEditTikonSliderState>(
                                create: (context) => AddEditTikonSliderState()),
                            BlocProvider<AddEditTikonCategoryState>(
                                create: (context) =>
                                    AddEditTikonCategoryState()),
                            BlocProvider<AddEditTikonImageState>(
                                create: (context) => AddEditTikonImageState()),
                          ],
                          child: AddEditTikonScreen(
                            id: tikon.id,
                            image: tikon.image,
                            tikonName: tikon.tikonName,
                            storeName: tikon.storeName,
                            dDay: tikon.dDay,
                            discount: tikon.disCount,
                            category: tikon.category,
                          ),
                        ),
                      );
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 16.w,
                      ),
                      alignment: Alignment.centerLeft,
                      child: MoaFont.bodyMedium(text: "수정하기"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return MoaDialog(
                            onYes: () {
                              context
                                  .read<DetailTikonBloc>()
                                  .add(DeleteTikonEvent(id: tikon.id));
                            },
                            onNo: () => MoaNavigator.pop(context),
                            title: "기프티콘 삭제",
                            contents: "정말 기프티콘을 삭제하시겠습니까?\n이제는 복구할 수 없어요",
                          );
                        },
                      );
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 16.w,
                      ),
                      alignment: Alignment.centerLeft,
                      child: MoaFont.bodyMedium(text: "삭제하기"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 16.w,
                      ),
                      alignment: Alignment.centerLeft,
                      child: MoaFont.bodyMedium(text: "이미지 저장하기"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
