import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatikon_flutter/data/auth/data_source/remote/remote_auth_data_source.dart';
import 'package:moatikon_flutter/data/auth/repository/auth_repository_impl.dart';
import 'package:moatikon_flutter/data/tikon/data_source/remote/remote_tikon_data_source.dart';
import 'package:moatikon_flutter/data/tikon/repository/tikon_repository_impl.dart';
import 'package:moatikon_flutter/domain/auth/use_case/re_issue_use_case.dart';
import 'package:moatikon_flutter/domain/auth/use_case/re_setting_pw_use_case.dart';
import 'package:moatikon_flutter/domain/auth/use_case/send_pw_code_check_use_case.dart';
import 'package:moatikon_flutter/domain/auth/use_case/send_pw_code_use_case.dart';
import 'package:moatikon_flutter/domain/auth/use_case/sign_up_use_case.dart';
import 'package:moatikon_flutter/domain/tikon/use_case/add_tikon_use_case.dart';
import 'package:moatikon_flutter/domain/tikon/use_case/complete_tikon_use_case.dart';
import 'package:moatikon_flutter/domain/tikon/use_case/get_all_tikon_list_use_case.dart';
import 'package:moatikon_flutter/presentation/auth/view_model/auth_bloc.dart';
import 'package:moatikon_flutter/presentation/splash/view_model/splash_bloc.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/add/add_tikon_calender_state_cubit.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/add/add_tikon_image_state_cubit.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/home/home_screen_tag_state.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/tikon_bloc.dart';
import '../../presentation/tikon/view_model/add/add_screen_slider_state.dart';
import '../../presentation/tikon/view_model/add/add_screen_category_state.dart';
import '../domain/auth/use_case/sign_in_use_case.dart';
import '../presentation/auth/view_model/resetting_pw_state_cubit.dart';

Future<List<BlocProvider>> di() async {
  // auth
  RemoteAuthDataSource remoteAuthDataSource = RemoteAuthDataSource();
  AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl(remoteAuthDataSource: remoteAuthDataSource);
  // auth_use_case
  SignUpUseCase signUpUseCase = SignUpUseCase(authRepository: authRepositoryImpl);
  SignInUseCase signInUseCase = SignInUseCase(authRepository: authRepositoryImpl);
  ReIssueUseCase reIssueUseCase = ReIssueUseCase(authRepository: authRepositoryImpl);
  SendPwCodeUseCase sendPwCodeUseCase = SendPwCodeUseCase(authRepository: authRepositoryImpl);
  SendPwCodeCheckUseCase sendPwCodeCheckUseCase = SendPwCodeCheckUseCase(authRepository: authRepositoryImpl);
  ResettingPwUseCase resettingPwUseCase = ResettingPwUseCase(authRepository: authRepositoryImpl);

  // tikon
  RemoteTikonDataSource remoteTikonDataSource = RemoteTikonDataSource();
  TikonRepositoryImpl tikonRepositoryImpl = TikonRepositoryImpl(remoteTikonDataSource: remoteTikonDataSource);
  // tikon_use_case
  GetAllTikonListUseCase getAllTikonListUseCase = GetAllTikonListUseCase(tikonRepository: tikonRepositoryImpl);
  AddTikonUseCase addTikonUseCase = AddTikonUseCase(tikonRepository: tikonRepositoryImpl);
  CompleteTikonUseCase completeTikonUseCase = CompleteTikonUseCase(tikonRepository: tikonRepositoryImpl);

  return [
    //auth
    BlocProvider<AuthBloc>(create: (context) => AuthBloc(signInUseCase: signInUseCase, signUpUseCase: signUpUseCase)),
    BlocProvider<SplashBloc>(create: (context) => SplashBloc(reIssueUseCase: reIssueUseCase)),
    BlocProvider<ResettingPwStateCubit>(
      create: (context) => ResettingPwStateCubit(
        sendPwCodeUseCase: sendPwCodeUseCase,
        sendPwCodeCheckUseCase: sendPwCodeCheckUseCase,
        resettingPwUseCase: resettingPwUseCase,
      ),
    ),

    // tikon
    BlocProvider<AddTikonImageStateCubit>(create: (context) => AddTikonImageStateCubit()),
    BlocProvider<AddTikonCalenderStateCubit>(create: (context) => AddTikonCalenderStateCubit()),
    BlocProvider<HomeScreenTagState>(create: (context) => HomeScreenTagState()),
    BlocProvider<AddScreenSliderState>(create: (context) => AddScreenSliderState()),
    BlocProvider<AddScreenCategoryState>(create: (context) => AddScreenCategoryState()),
    BlocProvider<TikonBloc>(
      create: (context) => TikonBloc(
        getAllTikonListUseCase: getAllTikonListUseCase,
        addTikonUseCase: addTikonUseCase,
        completeTikonUseCase: completeTikonUseCase,
      ),
    )
  ];
}