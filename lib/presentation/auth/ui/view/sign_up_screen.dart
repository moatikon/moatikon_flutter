import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/moa_button.dart';
import 'package:moatikon_flutter/component/my_scaffold.dart';
import 'package:moatikon_flutter/component/text_widget.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/presentation/auth/ui/view/sign_in_screen.dart';
import 'package:moatikon_flutter/presentation/auth/ui/widget/auth_app_bar.dart';
import 'package:moatikon_flutter/presentation/auth/ui/widget/auth_text_field_widget.dart';
import 'package:moatikon_flutter/presentation/tikon/ui/view/home_screen.dart';

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
    _passwordController = TextEditingController();
    _passwordCompareController = TextEditingController();

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
    return MyScaffold(
      appbar: const AuthAppBar(title: "회원가입"),
      bottomSheet: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: GestureDetector(
          onTap: () => MoaNavigator.pushReplacement(context, const SignInScreen()),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "모아티콘을 사용헀었다면?",
                  style: TextStyle(
                    fontFamily: "Pretendard",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF000000),
                  ),
                ),
                TextSpan(
                  text: "로그인",
                  style: TextStyle(
                    fontFamily: "Pretendard",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFEA4E46),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            AuthTextFieldWidget(
              controller: _nicknameController,
              node: _nickNameNode,
              hintText: "닉네임",
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
      ),
    );
  }
}
