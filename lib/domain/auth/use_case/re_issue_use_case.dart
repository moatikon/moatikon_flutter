import '../entity/token_entity.dart';
import '../repository/auth_repository.dart';

class ReIssueUseCase {
  final AuthRepository _authRepository;

  ReIssueUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<TokenEntity> execute() => _authRepository.reIssue();
}
