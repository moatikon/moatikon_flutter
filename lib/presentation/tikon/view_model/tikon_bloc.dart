import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatikon_flutter/core/bloc/bloc_state_value.dart';
import 'package:moatikon_flutter/domain/tikon/use_case/get_all_tikon_list_use_case.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/tikon_event.dart';
import '../../../domain/tikon/entity/tikons_entity.dart';
import '../../../domain/tikon/use_case/complete_tikon_use_case.dart';

class TikonBloc extends Bloc<TikonEvent, BlocState<TikonsEntity>> {
  final GetAllTikonListUseCase _getAllTikonListUseCase;
  final CompleteTikonUseCase _completeTikonUseCase;

  TikonBloc({
    required GetAllTikonListUseCase getAllTikonListUseCase,
    required CompleteTikonUseCase completeTikonUseCase,
  })  : _getAllTikonListUseCase = getAllTikonListUseCase,
        _completeTikonUseCase = completeTikonUseCase,
        super(Empty()) {
    on<CompleteTikonEvent>(_completeTikonHandler);
  }

  Future<void> _completeTikonHandler(
    CompleteTikonEvent event,
    Emitter<BlocState<TikonsEntity>> emit,
  ) async {
    emit(Loading());
    await _completeTikonUseCase.execute(id: event.id);
    final TikonsEntity tikonEntity = await _getAllTikonListUseCase.execute();
    emit(Loaded(data: tikonEntity));
  }
}

