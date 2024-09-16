import 'package:moatikon_flutter/domain/tikon/repository/tikon_repository.dart';
import '../entity/tikons_entity.dart';

class GetAllTikonListUseCase{
  final TikonRepository _tikonRepository;

  GetAllTikonListUseCase({
    required TikonRepository tikonRepository,
  }) : _tikonRepository = tikonRepository;

  Future<TikonsEntity> execute({int page = 0}) async =>
      _tikonRepository.getAllTikonList(page: page);
}