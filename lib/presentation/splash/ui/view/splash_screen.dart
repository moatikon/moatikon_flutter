import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/presentation/on_boarding/ui/view/on_boarding_screen.dart';
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
    context.read<TikonBloc>().add(GetAllTikonListEvent());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 1)).then((_) => MoaNavigator.teleporting(context, const OnBoardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
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
    );
  }
}
