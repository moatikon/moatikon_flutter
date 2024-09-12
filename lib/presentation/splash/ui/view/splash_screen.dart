import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/core/bloc_state_enum.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/presentation/on_boarding/ui/view/on_boarding_screen.dart';
import 'package:moatikon_flutter/presentation/splash/view_model/splash_bloc.dart';
import 'package:moatikon_flutter/presentation/splash/view_model/splash_event.dart';
import 'package:moatikon_flutter/presentation/splash/view_model/splash_state.dart';
import 'package:moatikon_flutter/presentation/tikon/ui/view/home_screen.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/tikon_bloc.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/tikon_event.dart';

import '../../../../component/bhs_text_widget.dart';
import '../../../../component/image_widget.dart';
import '../../../../component/my_scaffold.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(ReIssueEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SplashBloc, SplashState>(
          listenWhen: (_, current) => current.splashState == BlocStateEnum.loaded,
          listener: (_, __) {
            context.read<TikonBloc>().add(GetAllTikonListEvent());
            MoaNavigator.teleporting(context, const HomeScreen());
          },
        ),

        BlocListener<SplashBloc, SplashState>(
          listenWhen: (_, current) => current.splashState == BlocStateEnum.error,
          listener: (_, __) => MoaNavigator.teleporting(context, const OnBoardingScreen()),
        )
      ],
      child: MyScaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageWidget(
                image: "assets/image/logo.png",
                width: 200.w,
                height: 200.h,
              ),
              BHSTextWidget(text: "모아티콘", textSize: 40.sp)
            ],
          ),
        ),
      ),
    );
  }
}
