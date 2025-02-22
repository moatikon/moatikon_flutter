import '../repository/tikon_repository.dart';

class DeleteTikonUseCase {
  final TikonRepository _tikonRepository;

  const DeleteTikonUseCase({required TikonRepository tikonRepository})
      : _tikonRepository = tikonRepository;

  Future<void> execute({required String id}) async {
    return _tikonRepository.deleteTikon(id: id);
  }
}
