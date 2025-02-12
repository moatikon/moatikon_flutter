import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/presentation/tikon/ui/widget/home/home_screen_floating_action_button.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/tikon_bloc.dart';
import 'package:moatikon_flutter/presentation/tikon/ui/widget/home/tag_list_widget.dart';
import 'package:moatikon_flutter/presentation/tikon/ui/widget/home/tikon_list_widget.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/tikon_event.dart';
import '../../../../component/my_scaffold.dart';
import '../../../../component/text_widget.dart';
import '../../../../core/bloc/bloc_state_value.dart';
import '../../../../core/bloc/bloc_state_enum.dart';
import '../../../../domain/tikon/entity/tikons_entity.dart';
import '../widget/home/home_screen_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _tikonListController;

  @override
  void initState() {
    super.initState();
    _tikonListController = ScrollController();
    _tikonListController.addListener(_listener);
  }

  void _listener(){
    if (_tikonListController.position.pixels ==
        _tikonListController.position.maxScrollExtent) {
      int tikonsLength = context.read<TikonBloc>().state.value.tikons.length;
      if (tikonsLength % 15 == 0) {
        context.read<TikonBloc>().add(GetAllTikonListEvent(page: tikonsLength ~/ 15));
      }
    }
  }


  @override
  void dispose() {
    super.dispose();
    _tikonListController.dispose();
  }

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
            BlocBuilder<TikonBloc, BlocState<TikonsEntity>>(
              builder: (context, state) {
                if (state.blocState == BlocStateEnum.empty ||
                    state.blocState == BlocStateEnum.loading) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state.blocState == BlocStateEnum.error) {
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
                    controller: _tikonListController,
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
