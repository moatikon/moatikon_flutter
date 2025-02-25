import '../repository/auth_repository.dart';

class WithdrawUseCase {
  final AuthRepository _authRepository;

  WithdrawUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<void> execute() => _authRepository.withdraw();
}
