import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatikon_flutter/data/tikon/data_source/remote/remote_tikon_data_source.dart';
import 'package:moatikon_flutter/data/tikon/repository/tikon_repository_impl.dart';
import 'package:moatikon_flutter/domain/tikon/use_case/get_all_tikon_list_use_case.dart';
import 'package:moatikon_flutter/presentation/add/view_model/slider_state.dart';
import 'package:moatikon_flutter/presentation/add/view_model/tag_state.dart';
import 'package:moatikon_flutter/presentation/home/view_model/tag_state.dart';
import 'package:moatikon_flutter/presentation/home/view_model/tikon_bloc.dart';

Future<List<BlocProvider>> di() async {

  // tikon
  RemoteTikonDataSource remoteTikonDataSource = RemoteTikonDataSource();
  TikonRepositoryImpl tikonRepositoryImpl = TikonRepositoryImpl(remoteTikonDataSource: remoteTikonDataSource);
  GetAllTikonListUseCase getAllTikonListUseCase = GetAllTikonListUseCase(tikonRepository: tikonRepositoryImpl);

  return [
    BlocProvider<TagState>(create: (context) => TagState()),
    BlocProvider<SliderState>(create: (context) => SliderState()),
    BlocProvider<AddScreenTagState>(create: (context) => AddScreenTagState()),
    BlocProvider<TikonBloc>(create: (context) => TikonBloc(getAllTikonListUseCase: getAllTikonListUseCase))
  ];
}