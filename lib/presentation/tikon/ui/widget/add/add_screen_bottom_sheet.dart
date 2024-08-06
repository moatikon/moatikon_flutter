import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/core/component/text_widget.dart';
import 'package:moatikon_flutter/data/tikon/dto/request/add_tikon_request.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/tikon_bloc.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/tikon_event.dart';

class AddScreenBottomSheet extends StatelessWidget {
  final TextEditingController tikonName, storeName;
  final int addScreenTagState, disCount;

  const AddScreenBottomSheet({
    super.key,
    required this.tikonName,
    required this.storeName,
    required this.addScreenTagState,
    required this.disCount,
  });

  @override
  Widget build(BuildContext context) {
    String categoryBuilder(int index){
      switch(index){
        case 0:
          return "식사류";
        case 1:
          return "음료";
        case 2:
          return "물건";
        default:
          return "기타";
      }
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: GestureDetector(
        onTap: () {
          context.read<TikonBloc>().add(
            AddTikon(
              addTikonRequest: AddTikonRequest(
                image: "https://www.contis.ph/cdn/shop/products/CokeinCan.jpg?v=1689558538&width=1200",
                storeName: storeName.text,
                tikonName: tikonName.text,
                category: categoryBuilder(addScreenTagState),
                dDay: 10,
                disCount: disCount,
              ),
            ),
          );
          Navigator.pop(context);
        },
        child: Container(
          width: MediaQuery.of(context).size.width - 40.w,
          decoration: BoxDecoration(
              color: const Color(0xFFEA4E46),
              borderRadius: BorderRadius.circular(8.r)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 17.h),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: "추가하기",
                  textSize: 20.sp,
                  textWeight: TextWeight.medium,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
