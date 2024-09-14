import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/my_scaffold.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/presentation/auth/ui/widget/auth_app_bar.dart';
import 'package:moatikon_flutter/presentation/auth/ui/widget/auth_text_field_widget.dart';
import 'package:moatikon_flutter/presentation/auth/view_model/resetting_pw_state_cubit.dart';
import 'package:moatikon_flutter/presentation/on_boarding/ui/view/on_boarding_screen.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../component/moa_button.dart';
import '../../../../component/text_widget.dart';
import '../../../../component/toast_message.dart';
import '../../../../core/bloc/bloc_state_value.dart';
import '../../../../core/bloc_state_enum.dart';

class ResettingPasswordScreen extends StatefulWidget {
  final String email;

  const ResettingPasswordScreen({
    super.key,
    required this.email,
  });

  @override
  State<ResettingPasswordScreen> createState() =>
      _ResettingPasswordScreenState();
}

class _ResettingPasswordScreenState extends State<ResettingPasswordScreen> {
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordCheckController;

  late final FocusNode _passwordNode;
  late final FocusNode _passwordCheckNode;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    _passwordCheckController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    ;

    _passwordNode = FocusNode();
    _passwordCheckNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _passwordCheckController.dispose();

    _passwordNode.dispose();
    _passwordCheckNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextWidget? passwordErrorText() {
      if (_passwordController.text != _passwordCheckController.text) {
        return TextWidget(
          text: "비밀번호가 일치하지 않습니다.",
          textSize: 12.sp,
          textWeight: TextWeight.regular,
          color: const Color(0xFFF5290A),
        );
      }

      return null;
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<ResettingPwStateCubit, BlocState<String>>(
          listenWhen: (_, current) => current.blocState == BlocStateEnum.error,
          listener: (_, state) {
            showTopSnackBar(
              Overlay.of(context),
              ToastMessage(
                title: state.error.message[0],
                isError: true,
              ),
            );
          },
        ),

        BlocListener<ResettingPwStateCubit, BlocState<String>>(
          listenWhen: (_, current) => current.blocState == BlocStateEnum.empty,
          listener: (_, state) => MoaNavigator.go(context, const OnBoardingScreen()),
        ),
      ],
      child: MyScaffold(
        appbar: const AuthAppBar(title: "비밀번호 재설정"),
        body: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              AuthTextFieldWidget(
                controller: _passwordController,
                node: _passwordNode,
                hintText: "새 비밀번호",
                errorWidget: passwordErrorText(),
              ),
              SizedBox(height: 20.h),
              AuthTextFieldWidget(
                controller: _passwordCheckController,
                node: _passwordCheckNode,
                hintText: "새 비밀번호 재입력",
                errorWidget: passwordErrorText(),
              ),
              SizedBox(height: 30.h),
              MoaButton(
                onTap: () {
                  if(passwordErrorText() == null){
                    context.read<ResettingPwStateCubit>().resettingPw(
                      email: widget.email,
                      password: _passwordController.text,
                    );
                  }
                },
                padding: EdgeInsets.symmetric(vertical: 17.h),
                text: "비밀번호 변경하기",
                textSize: 20.sp,
                textWeight: TextWeight.medium,
                fontColor: Colors.white,
                color: const Color(0xFFEA4E46),
                borderRadius: 10.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
