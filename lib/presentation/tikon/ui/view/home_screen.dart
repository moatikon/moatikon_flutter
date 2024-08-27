import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/presentation/tikon/ui/widget/home/home_screen_floating_action_button.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/tikon_bloc.dart';
import 'package:moatikon_flutter/presentation/tikon/ui/widget/home/tag_list_widget.dart';
import 'package:moatikon_flutter/presentation/tikon/ui/widget/home/tikon_list_widget.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/tikon_state.dart';
import '../../../../component/my_scaffold.dart';
import '../../../../component/text_widget.dart';
import '../../../../core/bloc_state_enum.dart';
import '../../../../domain/tikon/entity/tikons_entity.dart';
import '../widget/home/home_screen_app_bar.dart';

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
            BlocBuilder<TikonBloc, TikonState<TikonsEntity>>(
              builder: (context, state) {
                if (state.tikonState == BlocStateEnum.empty ||
                    state.tikonState == BlocStateEnum.loading) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state.tikonState == BlocStateEnum.error) {
                  debugPrint(state.errorOfNull.toString());
                  return Expanded(
                    child: Center(
                      child: TextWidget(
                        text: "값을 불러오지 못했어요.",
                        textSize: 25.sp,
                        textWeight: TextWeight.extraBold,
                      ),
                    ),
                  );
                } else {
                  return TikonListWidget(
                    tikonList: context.read<TikonBloc>().state.value.tikons,
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
