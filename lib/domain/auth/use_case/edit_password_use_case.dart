import 'package:moatikon_flutter/domain/auth/repository/auth_repository.dart';

class EditPasswordUseCase {
  final AuthRepository _authRepository;

  EditPasswordUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<void> execute({
    required String email,
    required String successCode,
    required String password,
  }) =>
      _authRepository.editPassword(
        email: email,
        successCode: successCode,
        password: password,
      );
}
