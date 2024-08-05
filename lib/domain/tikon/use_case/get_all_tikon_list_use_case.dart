import 'package:moatikon_flutter/domain/tikon/entity/tikon_entity.dart';
import 'package:moatikon_flutter/domain/tikon/repository/tikon_repository.dart';

class GetAllTikonListUseCase{
  final TikonRepository _tikonRepository;

  GetAllTikonListUseCase({
    required TikonRepository tikonRepository,
  }) : _tikonRepository = tikonRepository;

  Future<List<TikonEntity>> execute() => _tikonRepository.getAllTikonList();
}