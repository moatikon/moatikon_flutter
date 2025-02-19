import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_none_value.dart';
import 'package:moatikon_flutter/core/token_secure_storage.dart';
import 'package:moatikon_flutter/domain/auth/entity/token_entity.dart';
import 'package:moatikon_flutter/presentation/auth/view_model/auth_event.dart';

import '../../../domain/auth/use_case/sign_in_use_case.dart';
import '../../../domain/auth/use_case/sign_up_use_case.dart';

class AuthBloc extends Bloc<AuthEvent, BlocStateNoneValue> {
  final SignInUseCase _signInUsecase;
  final SignUpUseCase _signUpUsecase;

  AuthBloc({
    required SignInUseCase signInUseCase,
    required SignUpUseCase signUpUseCase,
  })  : _signInUsecase = signInUseCase,
        _signUpUsecase = signUpUseCase,
        super(Empty()) {
    on<SignUpEvent>(_signUpHandler, transformer: droppable());
    on<SignInEvent>(_signInHandler, transformer: droppable());
    on<EmptyEvent>(_emptyHandler);
  }

  void _emptyHandler(
      EmptyEvent event,
      Emitter<BlocStateNoneValue> emit,
      ) async {
    emit(Empty());
  }

  void _signUpHandler(
    SignUpEvent event,
    Emitter<BlocStateNoneValue> emit,
  ) async {
    emit(Loading());

    try {
      await _signUpUsecase.execute(signupRequest: event.signupRequest);
      emit(Loaded());
    } on DioException catch (err) {
      emit(Error(exception: err));
    }
  }

  void _signInHandler(
    SignInEvent event,
    Emitter<BlocStateNoneValue> emit,
  ) async {
    emit(Loading());

    try {
      TokenEntity tokenEntity = await _signInUsecase.execute(authRequest: event.authRequest);
      TokenSecureStorage.writeAccessToken(tokenEntity.accessToken);
      TokenSecureStorage.writeRefreshToken(tokenEntity.refreshToken);

      emit(Loaded());
    } on DioException catch (err) {
      emit(Error(exception: err));
    }
  }
}
