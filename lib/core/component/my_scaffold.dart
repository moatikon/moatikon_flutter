import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyScaffold extends StatelessWidget {
  final PreferredSizeWidget? appbar;
  final Widget? body, floatingActionButton, bottomSheet;

  const MyScaffold({
    super.key,
    this.appbar,
    this.body,
    this.floatingActionButton,
    this.bottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Scaffold(
            appBar: appbar,
            body: body,
            floatingActionButton: floatingActionButton,
            bottomSheet: bottomSheet,
          ),
        ),
      ),
    );
  }
}
