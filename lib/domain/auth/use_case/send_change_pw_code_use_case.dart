import 'package:moatikon_flutter/data/auth/dto/request/send_change_pw_code_request.dart';
import 'package:moatikon_flutter/domain/auth/repository/auth_repository.dart';

class SendChangePWCodeUseCase {
  final AuthRepository _authRepository;

  SendChangePWCodeUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<void> execute({required SendChangePwCodeRequest request}) =>
      _authRepository.sendChangePWCode(request: request);
}