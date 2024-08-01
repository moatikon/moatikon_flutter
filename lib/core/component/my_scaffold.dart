import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyScaffold extends StatelessWidget {
  final PreferredSizeWidget? appbar;
  final Widget? body, floatingActionButton;

  const MyScaffold({
    super.key,
    this.appbar,
    this.body,
    this.floatingActionButton,
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
          ),
        ),
      ),
    );
  }
}
