import 'package:moatikon_flutter/data/auth/dto/request/auth_request.dart';
import 'package:moatikon_flutter/data/auth/dto/response/token_dto.dart';
import 'package:moatikon_flutter/domain/auth/entity/token_entity.dart';

class RemoteAuthDataSource {
  Future<void> signup({required AuthRequest authRequest}) async {}

  Future<TokenEntity> signin({required AuthRequest authRequest}) async {
    return const TokenDto(accessToken: '', refreshToken: '').toEntity();
  }
}