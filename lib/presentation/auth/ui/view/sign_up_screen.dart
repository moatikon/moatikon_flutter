import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/moa_button.dart';
import 'package:moatikon_flutter/component/my_scaffold.dart';
import 'package:moatikon_flutter/component/text_widget.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_none_value.dart';
import 'package:moatikon_flutter/core/bloc_state_enum.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/data/auth/dto/request/auth_request.dart';
import 'package:moatikon_flutter/presentation/auth/ui/view/sign_in_screen.dart';
import 'package:moatikon_flutter/presentation/auth/ui/widget/auth_app_bar.dart';
import 'package:moatikon_flutter/presentation/auth/ui/widget/auth_text_field_widget.dart';
import 'package:moatikon_flutter/presentation/auth/view_model/auth_bloc.dart';
import 'package:moatikon_flutter/presentation/auth/view_model/auth_event.dart';
import 'package:moatikon_flutter/presentation/splash/ui/view/splash_screen.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../component/toast_message.dart';
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
    RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    TextWidget? emailErrorText(){
      if(_emailController.text.isNotEmpty &&
          !regex.hasMatch(_emailController.text)){
        return TextWidget(
          text: "이메일 형식으로 입력해주세요",
          textSize: 12.sp,
          textWeight: TextWeight.regular,
          color: const Color(0xFFF5290A),
        );
      }

      return null;
    }

    TextWidget? passwordErrorText(){
      if(_passwordController.text != _passwordCompareController.text){
        return TextWidget(
          text: "비밀번호가 일치하지 않습니다.",
          textSize: 12.sp,
          textWeight: TextWeight.regular,
          color: const Color(0xFFF5290A),
        );
      }

      return null;
    }

    return MyScaffold(
      appbar: const AuthAppBar(title: "회원가입"),
      bottomSheet: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: GestureDetector(
          onTap: () => MoaNavigator.pushReplacement(context, const SignInScreen()),
          child: const AuthRichTextWidget(
            firstText: "모아티콘을 사용했었다면?",
            secondText: "로그인",
          ),
        ),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, BlocState>(
            listenWhen: (_, current) => current.blocState == BlocStateEnum.loaded,
            listener: (_, __) => MoaNavigator.go(context, const SplashScreen()),
          ),

          BlocListener<AuthBloc, BlocState>(
            listenWhen: (_, current) => current.blocState == BlocStateEnum.error,
            listener: (_, state) {
              showTopSnackBar(
                Overlay.of(context),
                ToastMessage(
                  isError: true,
                  title: state.error.message[0],
                ),
              );
            },
          ),
        ],
        child: BlocBuilder<AuthBloc, BlocState>(
          builder: (_, state) {
            return Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                children: [
                  AuthTextFieldWidget(
                    controller: _emailController,
                    node: _emailNode,
                    hintText: "이메일",
                    errorWidget: emailErrorText(),
                  ),
                  SizedBox(height: 20.h),
                  AuthTextFieldWidget(
                    controller: _passwordController,
                    node: _passwordNode,
                    hintText: "비밀번호",
                    isObscure: true,
                    errorWidget: passwordErrorText(),
                  ),
                  SizedBox(height: 20.h),
                  AuthTextFieldWidget(
                    controller: _passwordCompareController,
                    node: _passwordCompareNode,
                    hintText: "비밀번호 재입력",
                    isObscure: true,
                    errorWidget: passwordErrorText(),
                  ),
                  SizedBox(height: 30.h),
                  MoaButton(
                    onTap: () {
                      if (emailErrorText() == null &&
                          passwordErrorText() == null) {
                        context.read<AuthBloc>().add(
                              SignUpEvent(
                                authRequest: AuthRequest(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              ),
                            );
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