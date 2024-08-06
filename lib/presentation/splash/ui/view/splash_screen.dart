import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/core/component/bhs_text_widget.dart';
import 'package:moatikon_flutter/core/component/image_widget.dart';
import 'package:moatikon_flutter/core/component/my_scaffold.dart';
import 'package:moatikon_flutter/presentation/tikon/ui/view/home/home_screen.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/tikon_bloc.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/tikon_event.dart';

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
    Future.delayed(const Duration(seconds: 1)).then((value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ), (route) => false);
      },
    );
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
