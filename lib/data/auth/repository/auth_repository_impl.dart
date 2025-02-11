import 'package:moatikon_flutter/data/auth/data_source/remote/remote_auth_data_source.dart';
import 'package:moatikon_flutter/data/auth/dto/request/signup_request.dart';
import 'package:moatikon_flutter/domain/auth/entity/token_entity.dart';
import 'package:moatikon_flutter/domain/auth/repository/auth_repository.dart';

import '../dto/request/signin_request.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteAuthDataSource _remoteAuthDataSource;

  AuthRepositoryImpl({required RemoteAuthDataSource remoteAuthDataSource})
      : _remoteAuthDataSource = remoteAuthDataSource;

  @override
  Future<TokenEntity> signin({required SignInRequest authRequest}) {
    return _remoteAuthDataSource.signin(authRequest: authRequest);
  }

  @override
  Future<void> signup({required SignupRequest signupRequest}) {
    return _remoteAuthDataSource.signup(signupRequest: signupRequest);
  }

  @override
  Future<TokenEntity> reIssue() {
    return _remoteAuthDataSource.reIssue();
  }

  @override
  Future<void> sendPwCode({required String email}) {
    return _remoteAuthDataSource.sendPwCode(email: email);
  }

  @override
  Future<String> sendPwCodeCheck({
    required String email,
    required String code,
  }) {
    return _remoteAuthDataSource.sendPwCodeCheck(email: email, code: code);
  }

  @override
  Future<void> resettingPw({
    required String email,
    required String successCode,
    required String password,
  }) async {
    return _remoteAuthDataSource.resettingPw(
        email: email, successCode: successCode, password: password);
  }
}
