import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_value.dart';
import 'package:moatikon_flutter/domain/auth/use_case/send_pw_code_use_case.dart';

class ResettingPwStateCubit extends Cubit<BlocState<String>> {
  final SendPwCodeUseCase _sendPwCodeUseCase;

  ResettingPwStateCubit({required SendPwCodeUseCase sendPwCodeUseCase})
      : _sendPwCodeUseCase = sendPwCodeUseCase,
        super(Empty());

  Future<void> sendPwCode({required String email}) async {
    emit(Loading());
    try{
      await _sendPwCodeUseCase.execute(email: email);
      emit(Empty());
    } on DioException catch(err){
      emit(Error(exception: err));
    }
  }
}
