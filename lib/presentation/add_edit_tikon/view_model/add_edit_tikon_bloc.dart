import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_none_value.dart';
import 'package:moatikon_flutter/domain/tikon/use_case/add_tikon_use_case.dart';
import 'package:moatikon_flutter/domain/tikon/use_case/edit_tikon_use_case.dart';
import 'package:moatikon_flutter/presentation/add_edit_tikon/view_model/add_edit_tikon_event.dart';

class AddEditTikonBloc extends Bloc<AddEditTikonEvent, BlocStateNoneValue> {
  final AddTikonUseCase _addTikonUseCase;
  final EditTikonUseCase _editTikonUseCase;

  AddEditTikonBloc(
      {required AddTikonUseCase addTikonUseCase,
      required EditTikonUseCase editTikonUseCase})
      : _addTikonUseCase = addTikonUseCase,
        _editTikonUseCase = editTikonUseCase,
        super(Empty()) {
    on<AddTikonEvent>(_addTikonEventHandler);
    on<EditTikonEvent>(_editTikonEventHandler);
  }

  void _addTikonEventHandler(
      AddTikonEvent event, Emitter<BlocStateNoneValue> emit) async {
    emit(Loading());

    try {
      await _addTikonUseCase.execute(event.addTikonRequest);
      emit(Loaded());
    } on DioException catch (error) {
      emit(Error(exception: error));
    }
  }

  void _editTikonEventHandler(
      EditTikonEvent event, Emitter<BlocStateNoneValue> emit) async {
    emit(Loading());

    try {
      await _editTikonUseCase.execute(event.editTikonRequest);
      emit(Loaded());
    } on DioException catch (error) {
      emit(Error(exception: error));
    }
  }
}
