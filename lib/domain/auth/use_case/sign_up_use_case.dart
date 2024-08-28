import 'package:moatikon_flutter/domain/auth/repository/auth_repository.dart';

import '../../../data/auth/dto/request/auth_request.dart';

class SignUpUseCase {
  final AuthRepository _authRepository;

  SignUpUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<void> execute({required AuthRequest authRequest}) =>
      _authRepository.signup(authRequest: authRequest);
}