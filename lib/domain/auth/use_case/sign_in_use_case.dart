import 'package:moatikon_flutter/domain/auth/entity/token_entity.dart';
import '../../../data/auth/dto/request/signin_request.dart';
import '../repository/auth_repository.dart';

class SignInUseCase {
  final AuthRepository _authRepository;

  SignInUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<TokenEntity> execute({required SignInRequest authRequest}) =>
      _authRepository.signin(authRequest: authRequest);
}