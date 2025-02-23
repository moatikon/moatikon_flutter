import 'package:moatikon_flutter/data/tikon/dto/request/edit_tikon_request.dart';
import 'package:moatikon_flutter/domain/tikon/repository/tikon_repository.dart';

class EditTikonUseCase {
  final TikonRepository _tikonRepository;

  const EditTikonUseCase({required TikonRepository tikonRepository})
      : _tikonRepository = tikonRepository;

  Future<void> execute(EditTikonRequest request) async {
    return _tikonRepository.editTikon(request);
  }
}