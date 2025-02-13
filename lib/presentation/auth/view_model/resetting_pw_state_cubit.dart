import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_value.dart';
import 'package:moatikon_flutter/domain/auth/use_case/send_pw_code_use_case.dart';

import '../../../domain/auth/use_case/re_setting_pw_use_case.dart';
import '../../../domain/auth/use_case/send_pw_code_check_use_case.dart';

class ResettingPwStateCubit extends Cubit<BlocState<String>> {
  final SendPwCodeUseCase _sendPwCodeUseCase;
  final SendPwCodeCheckUseCase _sendPwCodeCheckUseCase;
  final ResettingPwUseCase _resettingPwUseCase;

  ResettingPwStateCubit({
    required SendPwCodeUseCase sendPwCodeUseCase,
    required SendPwCodeCheckUseCase sendPwCodeCheckUseCase,
    required ResettingPwUseCase resettingPwUseCase,
  })  : _sendPwCodeUseCase = sendPwCodeUseCase,
        _sendPwCodeCheckUseCase = sendPwCodeCheckUseCase,
        _resettingPwUseCase = resettingPwUseCase,
        super(Empty());

  Future<void> sendPwCode({required String email}) async {
    emit(Loading());
    try {
      await _sendPwCodeUseCase.execute(email: email);
      emit(Loaded(data: ""));
    } on DioException catch (err) {
      emit(Error(exception: err));
    }
  }

  Future<void> sendPwCodeCheck({
    required String email,
    required String code,
  }) async {
    emit(Loading());
    try {
      final String checkCode = await _sendPwCodeCheckUseCase.execute(email: email, code: code);
      print("Check Code : $checkCode");
      emit(Loaded(data: checkCode));
    } on DioException catch (err) {
      emit(Error(exception: err));
    }
  }

  Future<void> resettingPw({
    required String email,
    required String password,
  }) async {
    String successCode = state.value;
    emit(Loading());

    try {
      await _resettingPwUseCase.execute(
        email: email,
        successCode: successCode,
        password: password,
      );
      emit(Empty());
    } on DioException catch (err) {
      emit(Error(exception: err));
    }
  }
}
