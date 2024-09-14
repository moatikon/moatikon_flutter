import 'package:moatikon_flutter/domain/auth/repository/auth_repository.dart';

class SendPwCodeCheckUseCase {
  final AuthRepository _authRepository;

  SendPwCodeCheckUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<String> execute({required String email, required String code}) =>
      _authRepository.sendPwCodeCheck(email: email, code: code);
}
