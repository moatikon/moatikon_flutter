import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/moa_loading_Indicator.dart';
import 'package:moatikon_flutter/component/my_scaffold.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_enum.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_value.dart';
import 'package:moatikon_flutter/domain/tikon/entity/tikons_entity.dart';
import 'package:moatikon_flutter/presentation/using_tikon/ui/widget/using_tikon_app_bar.dart';
import 'package:moatikon_flutter/presentation/using_tikon/ui/widget/using_tikon_grid_widget.dart';
import 'package:moatikon_flutter/presentation/using_tikon/view_model/using_tikon_bloc.dart';
import 'package:moatikon_flutter/presentation/using_tikon/view_model/using_tikon_event.dart';

class UsingTikonScreen extends StatefulWidget {
  const UsingTikonScreen({super.key});

  @override
  State<UsingTikonScreen> createState() => _UsingTikonScreenState();
}

class _UsingTikonScreenState extends State<UsingTikonScreen> {
  late final ScrollController _tikonListController;

  @override
  void initState() {
    super.initState();
    context.read<UsingTikonBloc>().add(InitGetAllUsingTikonsEvent());
    _tikonListController = ScrollController();
    _tikonListController.addListener(_listener);
  }

  void _listener() {
    if (_tikonListController.position.pixels ==
        _tikonListController.position.maxScrollExtent) {
      int tikonsLength =
          context.read<UsingTikonBloc>().state.value.tikons.length;
      if (tikonsLength % 10 == 0) {
        context
            .read<UsingTikonBloc>()
            .add(GetAllUsingTikonsEvent(page: tikonsLength ~/ 10));
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
      appbar: const UsingTikonAppBar(),
      body: BlocBuilder<UsingTikonBloc, BlocState<TikonsEntity>>(
        builder: (context, state) {
          if (state.blocState == BlocStateEnum.empty || state.blocState == BlocStateEnum.loading) {
            return const MoaLoadingIndicator();
          } else if (state.blocState == BlocStateEnum.error) {
            return Text("Error :: ${state.error.message}");
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
              child: UsingTikonGridWidget(
                scrollController: _tikonListController,
                tikonsEntity: state.value,
              ),
            );
          }
        },
      ),
    );
  }
}
