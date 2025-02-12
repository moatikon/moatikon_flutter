import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/moa_button.dart';
import 'package:moatikon_flutter/component/my_scaffold.dart';
import 'package:moatikon_flutter/component/text_widget.dart';
import 'package:moatikon_flutter/component/toast_message.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_value.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_enum.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/presentation/auth/ui/view/resetting_password_screen.dart';
import 'package:moatikon_flutter/presentation/auth/ui/widget/auth_app_bar.dart';
import 'package:moatikon_flutter/presentation/auth/ui/widget/auth_text_field_widget.dart';
import 'package:moatikon_flutter/presentation/auth/view_model/resetting_pw_state_cubit.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SendCodeScreen extends StatefulWidget {
  const SendCodeScreen({super.key});

  @override
  State<SendCodeScreen> createState() => _SendCodeScreenState();
}

class _SendCodeScreenState extends State<SendCodeScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _codeController;

  late final FocusNode _emailNode;
  late final FocusNode _codeNode;

  bool sendAble = false;
  bool sendNow = false;

  @override
  void initState() {
    super.initState();
    RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    _emailController = TextEditingController()..addListener(() {
      setState(() => sendAble = regex.hasMatch(_emailController.text));
    });
    _codeController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });

    _emailNode = FocusNode();
    _codeNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _codeController.dispose();

    _emailNode.dispose();
    _codeNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLoading = context.watch<ResettingPwStateCubit>().state.blocState == BlocStateEnum.loading;

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
          listenWhen: (_, current) => current.blocState == BlocStateEnum.loaded,
          listener: (_, state) {
            if(state.value == ""){
              sendNow = true;
              showTopSnackBar(
                Overlay.of(context),
                const ToastMessage(
                  title: "인증코드가 정상적으로 보내졌어요",
                ),
              );
            } else {
              MoaNavigator.push(context, ResettingPasswordScreen(
                email: _emailController.text,
              ));
            }
          }
        ),
      ],
      child: MyScaffold(
        appbar: const AuthAppBar(title: "비밀번호 재설정"),
        body: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              AuthTextFieldWidget(
                controller: _emailController,
                node: _emailNode,
                hintText: "이메일",
              ),

              SizedBox(height: 20.h),

              Row(
                children: [
                  Flexible(
                    flex: 5,
                    child: AuthTextFieldWidget(
                      controller: _codeController,
                      node: _codeNode,
                      hintText: "인증코드",
                    ),
                  ),

                  SizedBox(width: 10.w),

                  Flexible(
                    flex: 4,
                    child: Builder(
                        builder: (_) {
                          if(sendAble){
                            return MoaButton(
                              onTap: () {
                                if (!isLoading) {
                                  context
                                      .read<ResettingPwStateCubit>()
                                      .sendPwCode(email: _emailController.text);
                                }
                              },
                              isLoading: isLoading,
                              loadingIndicatorColor: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                              text: "인증번호 발송하기",
                              textSize: 15.sp,
                              textWeight: TextWeight.medium,
                              fontColor: Colors.white,
                              color: const Color(0xFFEA4E46),
                              borderRadius: 10.r,
                            );
                          } else {
                            return MoaButton(
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                              text: "인증번호 발송하기",
                              isLoading: context.watch<ResettingPwStateCubit>().state.blocState == BlocStateEnum.loading,
                              textSize: 15.sp,
                              textWeight: TextWeight.medium,
                              fontColor: const Color(0xFFEA4E46),
                              color: Colors.white,
                              border: Border.all(color: const Color(0xFFEA4E46)),
                              borderRadius: 10.r,
                            );
                          }
                        }
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              Builder(
                builder: (_) {
                  if (sendNow) {
                    return MoaButton(
                      onTap: () {
                        context.read<ResettingPwStateCubit>().sendPwCodeCheck(
                              email: _emailController.text,
                              code: _codeController.text,
                            );
                      },
                      padding: EdgeInsets.symmetric(vertical: 17.h),
                      text: "인증번호 확인하기",
                      textSize: 20.sp,
                      textWeight: TextWeight.medium,
                      fontColor: Colors.white,
                      color: const Color(0xFFEA4E46),
                      borderRadius: 10.r,
                    );
                  } else {
                    return MoaButton(
                      padding: EdgeInsets.symmetric(vertical: 17.h),
                      text: "인증번호 확인하기",
                      textSize: 20.sp,
                      textWeight: TextWeight.medium,
                      fontColor: const Color(0xFFEA4E46),
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFEA4E46)),
                      borderRadius: 10.r,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
