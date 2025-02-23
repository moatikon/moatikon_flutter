import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/image_widget.dart';
import 'package:moatikon_flutter/core/moa_color.dart';
import 'package:moatikon_flutter/core/moa_font.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/core/tikon_category.dart';
import 'package:moatikon_flutter/domain/tikon/entity/tikon_entity.dart';
import 'package:moatikon_flutter/domain/tikon/entity/tikons_entity.dart';
import 'package:moatikon_flutter/presentation/detail_tikon/ui/detail_tikon_screen.dart';
import 'package:moatikon_flutter/presentation/home/view_model/home_category_state.dart';

class HomeTikonsGridWidget extends StatelessWidget {
  final TikonsEntity tikonsEntity;

  const HomeTikonsGridWidget({super.key, required this.tikonsEntity});

  @override
  Widget build(BuildContext context) {
    final categoryIdx = context.watch<HomeCategoryState>().state;
    final filterTikons = tikonsEntity.tikons.where((e) {
      return tikonCategory[categoryIdx] == e.category ||
          tikonCategory[categoryIdx] == "전체";
    }).toList();

    String dDayFactory(DateTime targetDate){
      DateTime now = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      );

      int dDay = targetDate.difference(now).inDays;

      if(dDay == 0){
        return "D-Day";
      } else if (dDay > 30){
        return "D-30+";
      }

      return "D-$dDay";
    }

    return Expanded(
      child: GridView.builder(
        itemCount: filterTikons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // 세로
          mainAxisSpacing: 10,
          // 가로
          crossAxisSpacing: 10,
          childAspectRatio: 195.w / 291.h,
        ),
        itemBuilder: (context, index) {
          TikonEntity tikonData = filterTikons[index];

          return GestureDetector(
            onTap: () => MoaNavigator.push(
              context,
              DetailTikonScreen(
                tikonEntity: tikonData,
              ),
            ),
            behavior: HitTestBehavior.opaque,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 195.w,
                      height: 195.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: ImageWidget(
                          imageType: ImageType.network,
                          image: tikonData.image,
                          width: 100.w,
                          height: 100.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: MoaColor.red100,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          bottomRight: Radius.circular(15.r),
                        ),
                      ),
                      child: MoaFont.titleTiny(
                        text: dDayFactory(tikonData.dDay),
                        color: MoaColor.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                MoaFont.labelSmall(
                  text: tikonData.storeName,
                  color: MoaColor.gray200,
                ),
                SizedBox(height: 5.h),
                MoaFont.titleMedium(
                  text: tikonData.disCount == 10
                      ? "FREE"
                      : "${tikonData.disCount}0%",
                  color: MoaColor.red100,
                ),
                SizedBox(height: 5.h),
                MoaFont.titleMedium(
                  text: tikonData.tikonName,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
