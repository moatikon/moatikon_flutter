import 'package:moatikon_flutter/domain/auth/repository/auth_repository.dart';

class ResettingPwUseCase {
  final AuthRepository _authRepository;

  ResettingPwUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<void> execute({
    required String email,
    required String successCode,
    required String password,
  }) =>
      _authRepository.resettingPw(
        email: email,
        successCode: successCode,
        password: password,
      );
}
