import 'package:moatikon_flutter/data/auth/data_source/remote/remote_auth_data_source.dart';
import 'package:moatikon_flutter/domain/auth/entity/token_entity.dart';
import 'package:moatikon_flutter/domain/auth/repository/auth_repository.dart';

import '../dto/request/auth_request.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteAuthDataSource _remoteAuthDataSource;

  AuthRepositoryImpl({required RemoteAuthDataSource remoteAuthDataSource})
      : _remoteAuthDataSource = remoteAuthDataSource;

  @override
  Future<TokenEntity> signin({required AuthRequest authRequest}) {
    return _remoteAuthDataSource.signin(authRequest: authRequest);
  }

  @override
  Future<void> signup({required AuthRequest authRequest}) {
    return _remoteAuthDataSource.signup(authRequest: authRequest);
  }

  @override
  Future<TokenEntity> reIssue() {
    return _remoteAuthDataSource.reIssue();
  }
}
