import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/moa_button.dart';
import 'package:moatikon_flutter/component/my_scaffold.dart';
import 'package:moatikon_flutter/component/text_widget.dart';
import 'package:moatikon_flutter/component/toast_message.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/data/auth/dto/request/auth_request.dart';
import 'package:moatikon_flutter/presentation/auth/ui/view/sign_up_screen.dart';
import 'package:moatikon_flutter/presentation/auth/ui/widget/auth_app_bar.dart';
import 'package:moatikon_flutter/presentation/auth/ui/widget/auth_rich_text_widget.dart';
import 'package:moatikon_flutter/presentation/auth/ui/widget/auth_text_field_widget.dart';
import 'package:moatikon_flutter/presentation/auth/view_model/auth_bloc.dart';
import 'package:moatikon_flutter/presentation/auth/view_model/auth_event.dart';
import 'package:moatikon_flutter/presentation/splash/ui/view/splash_screen.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../core/bloc/bloc_state_none_value.dart';
import '../../../../core/bloc_state_enum.dart';

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
                  title: state.error.message[0],
                ),
              );
            },
          ),
        ],
        child: BlocBuilder<AuthBloc, BlocState>(builder: (_, state) {
          return Padding(
            padding: EdgeInsets.all(20.w),
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
                SizedBox(height: 30.h),
                MoaButton(
                  onTap: () {
                    if (_emailController.text.isNotEmpty &&
                        _passwordController.text.isNotEmpty) {
                      context.read<AuthBloc>().add(
                            SignInEvent(
                              authRequest: AuthRequest(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            ),
                          );
                    }
                  },
                  text: "로그인",
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
        }),
      ),
    );
  }
}
