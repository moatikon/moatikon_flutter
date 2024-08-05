import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/core/component/my_scaffold.dart';
import 'package:moatikon_flutter/core/component/text_widget.dart';
import 'package:moatikon_flutter/core/util/bloc_state_enum.dart';
import 'package:moatikon_flutter/domain/tikon/entity/tikon_entity.dart';
import 'package:moatikon_flutter/presentation/home/ui/widget/home_screen_floating_action_button.dart';
import 'package:moatikon_flutter/presentation/home/ui/widget/tikon_list_widget.dart';
import 'package:moatikon_flutter/presentation/home/view_model/tikon_bloc.dart';
import 'package:moatikon_flutter/presentation/home/view_model/tikon_state.dart';
import '../widget/home_screen_app_bar.dart';
import '../widget/tag_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appbar: const HomeScreenAppBar(),
      floatingActionButton: const HomeScreenFloatingActionButton(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            const TagListWidget(),
            BlocBuilder<TikonBloc, TikonState<List<TikonEntity>>>(
              builder: (context, state) {
                switch(state.tikonState){
                  case BlocStateEnum.empty:
                    return Expanded(
                      child: Center(
                        child: TextWidget(
                          text: "값을 불러오지 못했어요.",
                          textSize: 25.sp,
                          textWeight: TextWeight.extraBold,
                        ),
                      ),
                    );
                  case BlocStateEnum.loading:
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  case BlocStateEnum.error:
                    return Expanded(
                      child: Center(
                        child: TextWidget(
                          text: context.read<TikonBloc>().state.error,
                          textSize: 25.sp,
                          textWeight: TextWeight.extraBold,
                        ),
                      ),
                    );
                  case BlocStateEnum.loaded:
                    return TikonListWidget(
                      tikonList: context.read<TikonBloc>().state.value,
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
