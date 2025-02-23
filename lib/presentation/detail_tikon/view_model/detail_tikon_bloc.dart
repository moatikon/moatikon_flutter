import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_none_value.dart';
import 'package:moatikon_flutter/domain/tikon/use_case/delete_tikon_use_case.dart';
import 'package:moatikon_flutter/domain/tikon/use_case/toggle_tikon_use_case.dart';
import 'package:moatikon_flutter/presentation/detail_tikon/view_model/detail_tikon_event.dart';

class DetailTikonBloc extends Bloc<DetailTikonEvent, BlocStateNoneValue> {
  final DeleteTikonUseCase _deleteTikonUseCase;
  final ToggleTikonUseCase _toggleTikonUseCase;

  DetailTikonBloc(
      {required DeleteTikonUseCase deleteTikonUseCase,
      required ToggleTikonUseCase toggleTikonUseCase})
      : _deleteTikonUseCase = deleteTikonUseCase,
        _toggleTikonUseCase = toggleTikonUseCase,
        super(Empty()) {
    on<DeleteTikonEvent>(_deleteTikonEventHandler);
    on<ToggleTikonEvent>(_toggleTikonEventHandler);
  }

  void _deleteTikonEventHandler(
    DeleteTikonEvent event,
    Emitter<BlocStateNoneValue> emit,
  ) async {
    emit(Loading());

    try {
      await _deleteTikonUseCase.execute(id: event.id);
      emit(Loaded());
    } on DioException catch (error) {
      emit(Error(exception: error));
    }
  }

  void _toggleTikonEventHandler(
    ToggleTikonEvent event,
    Emitter<BlocStateNoneValue> emit,
  ) async {
    emit(Loading());

    try {
      await _toggleTikonUseCase.execute(id: event.id);
      emit(Loaded());
    } on DioException catch (error) {
      emit(Error(exception: error));
    }
  }
}
