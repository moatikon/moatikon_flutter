import '../repository/tikon_repository.dart';

class CompleteTikonUseCase {
  final TikonRepository _tikonRepository;

  const CompleteTikonUseCase({required TikonRepository tikonRepository})
      : _tikonRepository = tikonRepository;

  Future<void> execute({required int id}) async {
    return _tikonRepository.completeTikon(id: id);
  }
}
