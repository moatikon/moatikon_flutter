import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_none_value.dart';
import 'package:moatikon_flutter/domain/tikon/use_case/add_tikon_use_case.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_tikon_event.dart';

class AddTikonBloc extends Bloc<AddTikonEvent, BlocStateNoneValue> {
  final AddTikonUseCase _addTikonUseCase;

  AddTikonBloc({required AddTikonUseCase addTikonUseCase})
      : _addTikonUseCase = addTikonUseCase,
        super(Empty()) {
    on<AddTikonEvent>(_addTikonEventHandler);
  }

  void _addTikonEventHandler(AddTikonEvent event, Emitter<BlocStateNoneValue> emit) async {
    emit(Loading());

    try {
      await _addTikonUseCase.execute(event.addTikonRequest);
      emit(Loaded());
    } on DioException catch (error) {
      emit(Error(exception: error));
    }
  }
}
