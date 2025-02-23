import 'package:moatikon_flutter/domain/tikon/repository/tikon_repository.dart';
import '../entity/tikons_entity.dart';

class GetAllTikonListUseCase {
  final TikonRepository _tikonRepository;

  GetAllTikonListUseCase({
    required TikonRepository tikonRepository,
  }) : _tikonRepository = tikonRepository;

  Future<TikonsEntity> execute({int? page, int? available}) async =>
      _tikonRepository.getAllTikonList(page: page, available: available);
}
