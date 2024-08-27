import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/domain/tikon/entity/tikon_entity.dart';
import 'package:moatikon_flutter/presentation/tikon/ui/view/detail_screen.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/home/home_screen_tag_state.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../component/text_widget.dart';

class TikonListWidget extends StatelessWidget {
  final List<TikonEntity> tikonList;

  const TikonListWidget({super.key, required this.tikonList});

  @override
  Widget build(BuildContext context) {
    final tagState = context.watch<HomeScreenTagState>().state;
    List<TikonEntity> filterTikonList = tikonList.where((element) {
      switch(tagState){
        case 1: return element.category == "식사류";
        case 2: return element.category == "음료";
        case 3: return element.category == "물건";
        case 4: return element.category == "기타";
        default: return true;
      }
    }).toList();


    String dDayFactory(int dDay){
      if(dDay == 1){
        return "D-Day";
      } else if (dDay > 30){
        return "D-30+";
      }

      return "D-$dDay";
    }

    return Expanded(
      child: ListView.builder(
        itemCount: filterTikonList.length,
        itemBuilder: (_, index) {
          final tikonData = filterTikonList[index];

          return Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: GestureDetector(
              onTap: () => MoaNavigator.push(context, DetailScreen(image: tikonData.image)),
              behavior: HitTestBehavior.opaque,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: ImageWidget(
                            imageType: ImageType.network,
                            image: tikonData.image,
                            width: 100.w,
                            height: 100.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.r),
                              bottomLeft: Radius.circular(15.r),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: TextWidget(
                              text: dDayFactory(tikonData.dDay),
                              textSize: 13.sp,
                              textWeight: TextWeight.semiBold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: tikonData.storeName,
                        textSize: 15.sp,
                        textWeight: TextWeight.semiBold,
                        color: const Color(0xFF939493),
                      ),
                      SizedBox(height: 5.h),
                      TextWidget(
                        text: tikonData.disCount == 100
                            ? "FREE"
                            : "${tikonData.disCount}%",
                        textSize: 20.sp,
                        textWeight: TextWeight.bold,
                        color: const Color(0xFFEA4B43),
                      ),
                      SizedBox(height: 5.h),
                      TextWidget(
                        text: tikonData.tikonName,
                        textSize: 20.sp,
                        textWeight: TextWeight.bold,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
