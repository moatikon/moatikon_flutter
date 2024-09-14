import 'package:moatikon_flutter/domain/auth/repository/auth_repository.dart';

class SendPwCodeUseCase {
  final AuthRepository _authRepository;

  SendPwCodeUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<void> execute({required String email}) =>
      _authRepository.sendPwCode(email: email);
}