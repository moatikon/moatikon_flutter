import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatikon_flutter/data/auth/data_source/remote/remote_auth_data_source.dart';
import 'package:moatikon_flutter/data/auth/repository/auth_repository_impl.dart';
import 'package:moatikon_flutter/data/tikon/data_source/remote/remote_tikon_data_source.dart';
import 'package:moatikon_flutter/data/tikon/repository/tikon_repository_impl.dart';
import 'package:moatikon_flutter/domain/auth/use_case/sign_up_use_case.dart';
import 'package:moatikon_flutter/domain/tikon/use_case/add_tikon_use_case.dart';
import 'package:moatikon_flutter/domain/tikon/use_case/get_all_tikon_list_use_case.dart';
import 'package:moatikon_flutter/presentation/auth/view_model/auth_bloc.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/add/add_tikon_calender_state_cubit.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/home/home_screen_tag_state.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/tikon_bloc.dart';
import '../../presentation/tikon/view_model/add/add_screen_slider_state.dart';
import '../../presentation/tikon/view_model/add/add_screen_tag_state.dart';
import '../domain/auth/use_case/sign_in_use_case.dart';

Future<List<BlocProvider>> di() async {
  // auth
  RemoteAuthDataSource remoteAuthDataSource = RemoteAuthDataSource();
  AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl(remoteAuthDataSource: remoteAuthDataSource);
  // auth_use_case
  SignUpUseCase signUpUseCase = SignUpUseCase(authRepository: authRepositoryImpl);
  SignInUseCase signInUseCase = SignInUseCase(authRepository: authRepositoryImpl);

  // tikon
  RemoteTikonDataSource remoteTikonDataSource = RemoteTikonDataSource();
  TikonRepositoryImpl tikonRepositoryImpl = TikonRepositoryImpl(remoteTikonDataSource: remoteTikonDataSource);
  // tikon_use_case
  GetAllTikonListUseCase getAllTikonListUseCase = GetAllTikonListUseCase(tikonRepository: tikonRepositoryImpl);
  AddTikonUseCase addTikonUseCase = AddTikonUseCase(tikonRepository: tikonRepositoryImpl);

  return [
    //auth
    BlocProvider<AuthBloc>(create: (context) => AuthBloc(signInUseCase: signInUseCase, signUpUseCase: signUpUseCase)),

    // tikon
    BlocProvider<AddTikonCalenderStateCubit>(create: (context) => AddTikonCalenderStateCubit()),
    BlocProvider<HomeScreenTagState>(create: (context) => HomeScreenTagState()),
    BlocProvider<AddScreenSliderState>(create: (context) => AddScreenSliderState()),
    BlocProvider<AddScreenTagState>(create: (context) => AddScreenTagState()),
    BlocProvider<TikonBloc>(
      create: (context) => TikonBloc(
        getAllTikonListUseCase: getAllTikonListUseCase,
        addTikonUseCase: addTikonUseCase,
      ),
    )
  ];
}