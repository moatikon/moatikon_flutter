import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moatikon_flutter/component/moa_dialog.dart';
import 'package:moatikon_flutter/component/my_scaffold.dart';
import 'package:moatikon_flutter/component/toast_message.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_enum.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_none_value.dart';
import 'package:moatikon_flutter/core/moa_color.dart';
import 'package:moatikon_flutter/core/moa_navigator.dart';
import 'package:moatikon_flutter/core/token_secure_storage.dart';
import 'package:moatikon_flutter/presentation/on_boarding/ui/view/on_boarding_screen.dart';
import 'package:moatikon_flutter/presentation/profile/ui/widget/profile_action_button.dart';
import 'package:moatikon_flutter/presentation/profile/ui/widget/profile_app_bar.dart';
import 'package:moatikon_flutter/presentation/profile/view_model/profile_bloc.dart';
import 'package:moatikon_flutter/presentation/profile/view_model/profile_event.dart';
import 'package:moatikon_flutter/presentation/using_tikon/ui/using_tikon_screen.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileBloc, BlocStateNoneValue>(
          listenWhen: (_, current) => current.blocState == BlocStateEnum.loaded,
          listener: (context, state) async {
            await TokenSecureStorage.writeAccessToken(null);
            await TokenSecureStorage.writeRefreshToken(null);

            if (context.mounted) {
              MoaNavigator.teleporting(context, const OnBoardingScreen());
            }
          },
        ),
        BlocListener<ProfileBloc, BlocStateNoneValue>(
          listenWhen: (_, current) => current.blocState == BlocStateEnum.error,
          listener: (context, state) => showTopSnackBar(
            Overlay.of(context),
            ToastMessage(
              title: state.error.message,
              isError: true,
            ),
          ),
        ),
      ],
      child: MyScaffold(
        appbar: const UserAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
          child: Column(
            children: [
              ProfileActionButton(
                onTap: () =>
                    MoaNavigator.push(context, const UsingTikonScreen()),
                title: "사용한 기프티콘",
              ),
              SizedBox(height: 10.h),
              ProfileActionButton(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return MoaDialog(
                        title: "로그아웃",
                        contents: "정말 로그아웃 하실건가요?",
                        onNo: () => MoaNavigator.pop(context),
                        onYes: () async {
                          await TokenSecureStorage.writeAccessToken(null);
                          await TokenSecureStorage.writeRefreshToken(null);

                          if (context.mounted) {
                            MoaNavigator.teleporting(
                                context, const OnBoardingScreen());
                          }
                        },
                      );
                    },
                  );
                },
                title: "로그아웃",
                fontColor: MoaColor.red200,
              ),
              SizedBox(height: 10.h),
              ProfileActionButton(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return MoaDialog(
                        title: "회원탈퇴",
                        contents: "정말 회원탈퇴 하실건가요?\n현재 가지고 있는 정보는 30일 후에 삭제됩니다.",
                        onNo: () => MoaNavigator.pop(context),
                        onYes: () {
                          context.read<ProfileBloc>().add(WithdrawEvent());
                          MoaNavigator.pop(context);
                        },
                      );
                    },
                  );
                },
                title: "회원 탙퇴",
                fontColor: MoaColor.red200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
