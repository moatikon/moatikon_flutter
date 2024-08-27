import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/moa_button.dart';
import 'package:moatikon_flutter/component/my_scaffold.dart';
import 'package:moatikon_flutter/component/text_widget.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/presentation/auth/ui/view/sign_up_screen.dart';
import 'package:moatikon_flutter/presentation/auth/ui/widget/auth_app_bar.dart';
import 'package:moatikon_flutter/presentation/auth/ui/widget/auth_text_field_widget.dart';
import 'package:moatikon_flutter/presentation/tikon/ui/view/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController _nicknameController;
  late final TextEditingController _passwordController;

  late final FocusNode _nickNameNode;
  late final FocusNode _passwordNode;

  @override
  void initState() {
    super.initState();
    _nicknameController = TextEditingController();
    _passwordController = TextEditingController();

    _nickNameNode = FocusNode();
    _passwordNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _nicknameController.dispose();
    _passwordController.dispose();

    _nickNameNode.dispose();
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
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "모아티콘이 처음이시라면?",
                  style: TextStyle(
                    fontFamily: "Pretendard",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF000000),
                  ),
                ),
                TextSpan(
                  text: "회원가입",
                  style: TextStyle(
                    fontFamily: "Pretendard",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFEA4E46),
                  ),
                ),
              ]
            )
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
            
            SizedBox(height: 30.h),

            MoaButton(
              onTap: () => MoaNavigator.go(context, const HomeScreen()),
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
      ),
    );
  }
}
