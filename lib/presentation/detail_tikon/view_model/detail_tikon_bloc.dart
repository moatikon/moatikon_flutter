import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_none_value.dart';
import 'package:moatikon_flutter/domain/tikon/use_case/delete_tikon_use_case.dart';
import 'package:moatikon_flutter/presentation/detail_tikon/view_model/detail_tikon_event.dart';

class DetailTikonBloc extends Bloc<DetailTikonEvent, BlocStateNoneValue> {
  final DeleteTikonUseCase _deleteTikonUseCase;

  DetailTikonBloc({required DeleteTikonUseCase deleteTikonUseCase})
      : _deleteTikonUseCase = deleteTikonUseCase,
        super(Empty()) {
    on<DeleteTikonEvent>(_deleteTikonEventHandler);
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
}
