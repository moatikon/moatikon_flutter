import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/moa_loading_Indicator.dart';
import 'package:moatikon_flutter/component/my_scaffold.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_enum.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_none_value.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_value.dart';
import 'package:moatikon_flutter/domain/tikon/entity/tikons_entity.dart';
import 'package:moatikon_flutter/presentation/add_tikon/view_model/add_tikon_bloc.dart';
import 'package:moatikon_flutter/presentation/detail_tikon/view_model/detail_tikon_bloc.dart';
import 'package:moatikon_flutter/presentation/home/ui/widget/home_category_widget.dart';
import 'package:moatikon_flutter/presentation/home/ui/widget/home_screen_app_bar.dart';
import 'package:moatikon_flutter/presentation/home/ui/widget/home_screen_floating_action_button.dart';
import 'package:moatikon_flutter/presentation/home/ui/widget/home_tikons_grid_widget.dart';
import 'package:moatikon_flutter/presentation/home/view_model/home_bloc.dart';
import 'package:moatikon_flutter/presentation/home/view_model/home_event.dart';

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

  void _listener() {
    if (_tikonListController.position.pixels ==
        _tikonListController.position.maxScrollExtent) {
      int tikonsLength = context.read<HomeBloc>().state.value.tikons.length;
      if (tikonsLength % 10 == 0) {
        context
            .read<HomeBloc>()
            .add(GetAllTikonsEvent(page: tikonsLength ~/ 10));
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
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: const HomeCategoryWidget(),
            ),
            MultiBlocListener(
              listeners: [
                BlocListener<AddTikonBloc, BlocStateNoneValue>(
                  listenWhen: (_, current) => current.blocState == BlocStateEnum.loaded,
                  listener: (_, __) => context.read<HomeBloc>().add(InitGetAllTikonsEvent()),
                ),

                BlocListener<DetailTikonBloc, BlocStateNoneValue>(
                  listenWhen: (_, current) => current.blocState == BlocStateEnum.loaded,
                  listener: (_, __) => context.read<HomeBloc>().add(InitGetAllTikonsEvent()),
                ),
              ],
              child: BlocBuilder<HomeBloc, BlocState<TikonsEntity>>(
                builder: (context, state) {
                  if (state.blocState == BlocStateEnum.loading) {
                    return const MoaLoadingIndicator();
                  } else if (state.blocState == BlocStateEnum.error) {
                    return Text("Error :: ${state.error.message}");
                  } else {
                    return HomeTikonsGridWidget(tikonsEntity: state.value);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
