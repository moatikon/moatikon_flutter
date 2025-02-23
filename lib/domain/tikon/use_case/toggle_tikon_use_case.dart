import '../repository/tikon_repository.dart';

class ToggleTikonUseCase {
  final TikonRepository _tikonRepository;

  const ToggleTikonUseCase({required TikonRepository tikonRepository})
      : _tikonRepository = tikonRepository;

  Future<void> execute({required String id}) async {
    return _tikonRepository.toggleTikon(id: id);
  }
}
