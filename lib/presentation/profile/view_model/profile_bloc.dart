import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_none_value.dart';
import 'package:moatikon_flutter/domain/auth/use_case/withdraw_use_case.dart';
import 'package:moatikon_flutter/presentation/profile/view_model/profile_event.dart';

class ProfileBloc extends Bloc<ProfileEvent, BlocStateNoneValue> {
  final WithdrawUseCase _withdrawUseCase;

  ProfileBloc({required WithdrawUseCase withdrawUseCase})
      : _withdrawUseCase = withdrawUseCase,
        super(Empty()) {
    on<WithdrawEvent>(_withdrawEventHandler);
  }

  void _withdrawEventHandler(
    WithdrawEvent event,
    Emitter<BlocStateNoneValue> emit,
  ) async {
    emit(Loading());

    try {
      await _withdrawUseCase.execute();

      emit(Loaded());
    } on DioException catch (error) {
      emit(Error(exception: error));
    }
  }
}
