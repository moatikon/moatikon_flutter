import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatikon_flutter/core/token_secure_storage.dart';
import 'package:moatikon_flutter/domain/auth/entity/token_entity.dart';
import 'package:moatikon_flutter/presentation/auth/view_model/auth_event.dart';
import 'package:moatikon_flutter/presentation/auth/view_model/auth_state.dart';

import '../../../domain/auth/use_case/sign_in_use_case.dart';
import '../../../domain/auth/use_case/sign_up_use_case.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase _signInUsecase;
  final SignUpUseCase _signUpUsecase;

  AuthBloc({
    required SignInUseCase signInUseCase,
    required SignUpUseCase signUpUseCase,
  })  : _signInUsecase = signInUseCase,
        _signUpUsecase = signUpUseCase,
        super(Empty()) {
    on<SignUpEvent>(_signUpHandler);
    on<SignInEvent>(_signInHandler);
  }

  void _signUpHandler(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(Loading());

    try {
      await _signUpUsecase.execute(authRequest: event.authRequest);
      emit(Loaded());
    } catch (err) {
      emit(Error(exception: err));
    }
  }

  void _signInHandler(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(Loading());

    try {
      TokenEntity tokenEntity = await _signInUsecase.execute(authRequest: event.authRequest);
      TokenSecureStorage.writeAccessToken(tokenEntity.accessToken);
      TokenSecureStorage.writeRefreshToken(tokenEntity.refreshToken);

      emit(Loaded());
    } catch (err) {
      emit(Error(exception: err));
    }
  }
}
