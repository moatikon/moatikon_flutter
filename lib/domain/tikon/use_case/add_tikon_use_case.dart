import 'package:moatikon_flutter/data/tikon/dto/request/add_tikon_request.dart';
import 'package:moatikon_flutter/domain/tikon/repository/tikon_repository.dart';

class AddTikonUseCase {
  final TikonRepository _tikonRepository;

  const AddTikonUseCase({required TikonRepository tikonRepository})
      : _tikonRepository = tikonRepository;

  Future<void> execute(AddTikonRequest request) async {
    _tikonRepository.addTikon(request);
  }
}