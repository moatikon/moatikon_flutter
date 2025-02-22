import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/moa_dialog.dart';
import 'package:moatikon_flutter/core/moa_font.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/presentation/detail_tikon/view_model/detail_tikon_bloc.dart';
import 'package:moatikon_flutter/presentation/detail_tikon/view_model/detail_tikon_event.dart';

class DetailTikonOptionDialog extends StatelessWidget {
  final String id;

  const DetailTikonOptionDialog({super.key, required this.id});

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
                    onTap: () {},
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
                                  .add(DeleteTikonEvent(id: id));
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
