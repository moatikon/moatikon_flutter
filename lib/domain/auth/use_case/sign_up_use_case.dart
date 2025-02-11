import 'package:moatikon_flutter/data/auth/dto/request/signup_request.dart';
import 'package:moatikon_flutter/domain/auth/repository/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository _authRepository;

  SignUpUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<void> execute({required SignupRequest signupRequest}) =>
      _authRepository.signup(signupRequest: signupRequest);
}