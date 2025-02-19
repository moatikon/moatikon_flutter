import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/moa_button.dart';
import 'package:moatikon_flutter/component/my_scaffold.dart';
import 'package:moatikon_flutter/component/text_widget.dart';
import 'package:moatikon_flutter/component/toast_message.dart';
import 'package:moatikon_flutter/core/moa_color.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/data/auth/dto/request/signin_request.dart';
import 'package:moatikon_flutter/presentation/auth/ui/view/send_code_screen.dart';
import 'package:moatikon_flutter/presentation/auth/ui/view/sign_up_screen.dart';
import 'package:moatikon_flutter/presentation/auth/ui/widget/auth_app_bar.dart';
import 'package:moatikon_flutter/presentation/auth/ui/widget/auth_rich_text_widget.dart';
import 'package:moatikon_flutter/presentation/auth/ui/widget/auth_text_field_widget.dart';
import 'package:moatikon_flutter/presentation/auth/view_model/auth_bloc.dart';
import 'package:moatikon_flutter/presentation/auth/view_model/auth_event.dart';
import 'package:moatikon_flutter/presentation/splash/ui/view/splash_screen.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../core/bloc/bloc_state_none_value.dart';
import '../../../../core/bloc/bloc_state_enum.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late final FocusNode _emailNode;
  late final FocusNode _passwordNode;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _emailNode = FocusNode();
    _passwordNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    _emailNode.dispose();
    _passwordNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appbar: const AuthAppBar(title: "로그인"),
      bottomSheet: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: GestureDetector(
          onTap: () => MoaNavigator.pushReplacement(context, const SignUpScreen()),
          child: const AuthRichTextWidget(
            firstText: "모아티콘이 처음이라면?",
            secondText: "회원가입",
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
                  title: state.error.message,
                ),
              );
            },
          ),
        ],
        child: BlocBuilder<AuthBloc, BlocState>(builder: (_, state) {
          return Padding(
            padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
            child: Column(
              children: [
                AuthTextFieldWidget(
                  controller: _emailController,
                  node: _emailNode,
                  hintText: "이메일",
                ),
                SizedBox(height: 20.h),
                AuthTextFieldWidget(
                  controller: _passwordController,
                  node: _passwordNode,
                  hintText: "비밀번호",
                  isObscure: true,
                ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     GestureDetector(
                //       onTap: () => MoaNavigator.push(context, const SendCodeScreen()),
                //       child: TextWidget(
                //         text: "비밀번호를 잊으셨나요?",
                //         textSize: 15.sp,
                //         textWeight: TextWeight.bold,
                //         color: MoaColor.red100,
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 30.h),
                MoaButton(
                  onTap: () {
                    if (_emailController.text.isNotEmpty &&
                        _passwordController.text.isNotEmpty) {
                      context.read<AuthBloc>().add(
                            SignInEvent(
                              authRequest: SignInRequest(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            ),
                          );
                    } else {
                      showTopSnackBar(
                        Overlay.of(context),
                        const ToastMessage(
                          isError: true,
                          title: "아이디와 비밀번호 모두 입력해 주세요.",
                        ),
                      );
                    }
                  },
                  text: "로그인",
                  textSize: 20.sp,
                  textWeight: TextWeight.medium,
                  fontColor: MoaColor.white,
                  height: 58.h,
                  color: MoaColor.red100,
                  borderRadius: 8.r,
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
