import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_value.dart';
import 'package:moatikon_flutter/domain/tikon/entity/tikons_entity.dart';
import 'package:moatikon_flutter/domain/tikon/use_case/get_all_tikon_list_use_case.dart';
import 'package:moatikon_flutter/presentation/home/view_model/home_event.dart';

class HomeBloc extends Bloc<HomeEvent, BlocState<TikonsEntity>> {
  final GetAllTikonListUseCase _getAllTikonListUseCase;

  HomeBloc({
    required GetAllTikonListUseCase getAllTikonListUseCase,
  })  : _getAllTikonListUseCase = getAllTikonListUseCase,
        super(Empty()) {
    on<InitGetAllTikonsEvent>(_initGetAllTikonsEventHandler);
    on<GetAllTikonsEvent>(_getAllTikonsEventHandler);
  }

  void _initGetAllTikonsEventHandler(
    InitGetAllTikonsEvent event,
    Emitter<BlocState<TikonsEntity>> emit,
  ) async {
    emit(Loading());

    try {
      TikonsEntity tikons = await _getAllTikonListUseCase.execute();
      emit(Loaded(data: tikons));
    } on DioException catch (error) {
      emit(Error(exception: error));
    }
  }

  void _getAllTikonsEventHandler(
    GetAllTikonsEvent event,
    Emitter<BlocState<TikonsEntity>> emit,
  ) async {
    try {
      TikonsEntity currentTikons = state.value;
      TikonsEntity tikons =
          await _getAllTikonListUseCase.execute(page: event.page);

      emit(Loaded(
          data: TikonsEntity(tikons: currentTikons.tikons + tikons.tikons)));
    } on DioException catch (error) {
      emit(Error(exception: error));
    }
  }
}
