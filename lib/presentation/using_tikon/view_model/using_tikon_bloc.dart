import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_value.dart';
import 'package:moatikon_flutter/domain/tikon/entity/tikons_entity.dart';
import 'package:moatikon_flutter/domain/tikon/use_case/get_all_tikon_list_use_case.dart';
import 'package:moatikon_flutter/presentation/using_tikon/view_model/using_tikon_event.dart';

class UsingTikonBloc extends Bloc<UsingTikonEvent, BlocState<TikonsEntity>> {
  final GetAllTikonListUseCase _getAllTikonListUseCase;

  UsingTikonBloc({required GetAllTikonListUseCase getAllTikonListUseCase})
      : _getAllTikonListUseCase = getAllTikonListUseCase,
        super(Empty()) {
    on<InitGetAllUsingTikonsEvent>(_initGetAllUsingTikonEventHandler);
    on<GetAllUsingTikonsEvent>(_getAllUsingTikonEventHandler);
  }

  void _initGetAllUsingTikonEventHandler(
    InitGetAllUsingTikonsEvent event,
    Emitter<BlocState<TikonsEntity>> emit,
  ) async {
    emit(Loading());

    try {
      TikonsEntity tikons = await _getAllTikonListUseCase.execute(available: 1);
      emit(Loaded(data: tikons));
    } on DioException catch (error) {
      emit(Error(exception: error));
    }
  }

  void _getAllUsingTikonEventHandler(
    GetAllUsingTikonsEvent event,
    Emitter<BlocState<TikonsEntity>> emit,
  ) async {
    try {
      TikonsEntity currentTikons = state.value;
      TikonsEntity tikons = await _getAllTikonListUseCase.execute(
        page: event.page,
        available: 1,
      );

      emit(Loaded(data: TikonsEntity(tikons: currentTikons.tikons + tikons.tikons)));
    } on DioException catch (error) {
      emit(Error(exception: error));
    }
  }
}
