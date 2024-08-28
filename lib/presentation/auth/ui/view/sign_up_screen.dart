import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/moa_button.dart';
import 'package:moatikon_flutter/component/my_scaffold.dart';
import 'package:moatikon_flutter/component/text_widget.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/presentation/auth/ui/view/sign_in_screen.dart';
import 'package:moatikon_flutter/presentation/auth/ui/widget/auth_app_bar.dart';
import 'package:moatikon_flutter/presentation/auth/ui/widget/auth_text_field_widget.dart';
import 'package:moatikon_flutter/presentation/auth/view_model/auth_bloc.dart';
import 'package:moatikon_flutter/presentation/tikon/ui/view/home_screen.dart';

import '../../../../core/bloc_state_enum.dart';
import '../../view_model/auth_state.dart';
import '../widget/auth_rich_text_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController _nicknameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordCompareController;

  late final FocusNode _nickNameNode;
  late final FocusNode _passwordNode;
  late final FocusNode _passwordCompareNode;

  @override
  void initState() {
    super.initState();
    _nicknameController = TextEditingController();
    _passwordController = TextEditingController()
      ..addListener(() => setState(() {}));
    _passwordCompareController = TextEditingController()
      ..addListener(() => setState(() {}));

    _nickNameNode = FocusNode();
    _passwordNode = FocusNode();
    _passwordCompareNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _nicknameController.dispose();
    _passwordController.dispose();
    _passwordCompareController.dispose();

    _nickNameNode.dispose();
    _passwordNode.dispose();
    _passwordCompareNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextWidget? usernameErrorText(AuthState state) {
      if (state.authState == BlocStateEnum.error) {
        return TextWidget(
          text: "동일한 유저 이름이 존재합니다.",
          textSize: 12.sp,
          textWeight: TextWeight.regular,
          color: const Color(0xFFF5290A),
        );
      }

      return null;
    }

    TextWidget? passWordErrorText() {
      if (_passwordController.text.isNotEmpty && _passwordController.text != _passwordCompareController.text) {
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
          )
        ),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (_, state) {
          return Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                AuthTextFieldWidget(
                  controller: _nicknameController,
                  node: _nickNameNode,
                  hintText: "닉네임",
                  errorWidget: usernameErrorText(state),
                ),

                SizedBox(height: 20.h),

                AuthTextFieldWidget(
                  controller: _passwordController,
                  node: _passwordNode,
                  hintText: "비밀번호",
                  isObscure: true,
                ),

                SizedBox(height: 20.h),

                AuthTextFieldWidget(
                  controller: _passwordCompareController,
                  node: _passwordCompareNode,
                  hintText: "비밀번호 재입력",
                  isObscure: true,
                  errorWidget: passWordErrorText(),
                ),

                SizedBox(height: 30.h),

                MoaButton(
                  onTap: () => MoaNavigator.go(context, const HomeScreen()),
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
        }
      ),
    );
  }
}
