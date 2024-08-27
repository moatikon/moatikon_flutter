import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatikon_flutter/domain/tikon/use_case/add_tikon_use_case.dart';
import 'package:moatikon_flutter/domain/tikon/use_case/get_all_tikon_list_use_case.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/tikon_event.dart';
import 'package:moatikon_flutter/presentation/tikon/view_model/tikon_state.dart';
import '../../../domain/tikon/entity/tikons_entity.dart';

class TikonBloc extends Bloc<TikonEvent, TikonState<TikonsEntity>> {
  final GetAllTikonListUseCase _getAllTikonListUseCase;
  final AddTikonUseCase _addTikonUseCase;

  TikonBloc({
    required GetAllTikonListUseCase getAllTikonListUseCase,
    required AddTikonUseCase addTikonUseCase,
  })  : _getAllTikonListUseCase = getAllTikonListUseCase,
        _addTikonUseCase = addTikonUseCase,
        super(Empty()) {
    on<GetAllTikonListEvent>(_getAllTikonListHandler);
    on<AddTikon>(_addTikonHandler);
  }

  void _getAllTikonListHandler(GetAllTikonListEvent event,
      Emitter<TikonState<TikonsEntity>> emit) async {
    try{
      emit(Loading());
      final newEntity = await _getAllTikonListUseCase.execute();
      emit(Loaded(data: newEntity));
    } catch(err){
      emit(Error(exception: err));
    }
  }

  Future<void> _addTikonHandler(
    AddTikon event,
    Emitter<TikonState<TikonsEntity>> emit,
  ) async {
    emit(Loading());
    await _addTikonUseCase.execute(event.addTikonRequest);
    final newEntity = await _getAllTikonListUseCase.execute();
    emit(Loaded(data: newEntity));
  }
}

