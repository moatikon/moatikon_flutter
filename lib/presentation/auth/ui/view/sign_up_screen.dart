import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/moa_button.dart';
import 'package:moatikon_flutter/component/my_scaffold.dart';
import 'package:moatikon_flutter/component/text_widget.dart';
import 'package:moatikon_flutter/core/bloc_state_enum.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/data/auth/dto/request/auth_request.dart';
import 'package:moatikon_flutter/presentation/auth/ui/view/sign_in_screen.dart';
import 'package:moatikon_flutter/presentation/auth/ui/widget/auth_app_bar.dart';
import 'package:moatikon_flutter/presentation/auth/ui/widget/auth_text_field_widget.dart';
import 'package:moatikon_flutter/presentation/auth/view_model/auth_bloc.dart';
import 'package:moatikon_flutter/presentation/auth/view_model/auth_event.dart';
import 'package:moatikon_flutter/presentation/auth/view_model/text_field_error_func.dart';

import '../../../tikon/ui/view/home_screen.dart';
import '../../view_model/auth_state.dart';
import '../widget/auth_rich_text_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordCompareController;

  late final FocusNode _emailNode;
  late final FocusNode _passwordNode;
  late final FocusNode _passwordCompareNode;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController()
      ..addListener(() => setState(() {}));
    _passwordController = TextEditingController()
      ..addListener(() => setState(() {}));
    _passwordCompareController = TextEditingController()
      ..addListener(() => setState(() {}));

    _emailNode = FocusNode();
    _passwordNode = FocusNode();
    _passwordCompareNode = FocusNode();
  }

  @override
  void deactivate() {
    super.deactivate();
    context.read<AuthBloc>().add(EmptyEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordCompareController.dispose();

    _emailNode.dispose();
    _passwordNode.dispose();
    _passwordCompareNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool textFieldAllCorrect(AuthState authState) {
      if(_emailController.text.isEmpty && _passwordController.text.isEmpty && _passwordCompareController.text.isEmpty){
        return false;
      }

      TextWidget? duplicationUserText = TextFieldErrorFunc.emailText(
        state: authState,
        emailController: _emailController,
      );
      TextWidget? passwordNotMatchText =
          TextFieldErrorFunc.passwordNotMatchText(
        passwordController: _passwordController,
      );
      TextWidget? passWordNotCompareText =
          TextFieldErrorFunc.passWordNotCompareText(
        passwordController: _passwordController,
        passwordCompareController: _passwordCompareController,
      );

      return duplicationUserText == null &&
          passwordNotMatchText == null &&
          passWordNotCompareText == null;
    }

    return MyScaffold(
      appbar: const AuthAppBar(title: "회원가입"),
      bottomSheet: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: GestureDetector(
          onTap: () =>
              MoaNavigator.pushReplacement(context, const SignInScreen()),
          child: const AuthRichTextWidget(
            firstText: "모아티콘을 사용했었다면?",
            secondText: "로그인",
          ),
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listenWhen: (_, current) => current.authState == BlocStateEnum.loaded,
        listener: (_, __) => MoaNavigator.go(context, const HomeScreen()),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (_, state) {
            return Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                children: [
                  AuthTextFieldWidget(
                    controller: _emailController,
                    node: _emailNode,
                    hintText: "이메일",
                    errorWidget: TextFieldErrorFunc.emailText(
                      state: state,
                      emailController: _emailController,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  AuthTextFieldWidget(
                    controller: _passwordController,
                    node: _passwordNode,
                    hintText: "비밀번호",
                    isObscure: true,
                    errorWidget: TextFieldErrorFunc.passwordNotMatchText(
                      passwordController: _passwordController,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  AuthTextFieldWidget(
                    controller: _passwordCompareController,
                    node: _passwordCompareNode,
                    hintText: "비밀번호 재입력",
                    isObscure: true,
                    errorWidget: TextFieldErrorFunc.passWordNotCompareText(
                      passwordController: _passwordController,
                      passwordCompareController: _passwordCompareController,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  MoaButton(
                    onTap: () {
                      context.read<AuthBloc>().add(EmptyEvent());
                      if (textFieldAllCorrect(state)) {
                        context.read<AuthBloc>().add(SignUpEvent(
                                authRequest: AuthRequest(
                              email: _emailController.text,
                              password: _passwordController.text,
                            )));
                      }
                    },
                    text: "회원가입",
                    textSize: 20.sp,
                    textWeight: TextWeight.medium,
                    fontColor: Colors.white,
                    height: 58.h,
                    color: const Color(0xFFEA4E46),
                    borderRadius: 8.r,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
