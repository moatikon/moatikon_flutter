import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatikon_flutter/domain/tikon/use_case/get_all_tikon_list_use_case.dart';
import 'package:moatikon_flutter/presentation/home/view_model/tikon_event.dart';
import 'package:moatikon_flutter/presentation/home/view_model/tikon_model.dart';
import 'package:moatikon_flutter/presentation/home/view_model/tikon_state.dart';

class TikonBloc extends Bloc<TikonEvent, TikonState<TikonModel>> {
  final GetAllTikonListUseCase _getAllTikonList;

  TikonBloc({required GetAllTikonListUseCase getAllTikonListUseCase})
      : _getAllTikonList = getAllTikonListUseCase,
        super(Empty()) {
    on<GetAllTikonListEvent>(_getAllTikonListHandler);
  }

  void _getAllTikonListHandler(GetAllTikonListEvent event,
      Emitter<TikonState<TikonModel>> emit) async {
    try{
      emit(Loading());
      final newEntity = await _getAllTikonList.execute();
      final newModel = TikonModel(tikonList: newEntity);
      emit(Loaded(data: newModel));
    } catch(err){
      emit(Error(exception: err));
    }
  }
}

