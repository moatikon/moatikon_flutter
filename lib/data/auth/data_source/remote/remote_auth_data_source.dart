import 'package:moatikon_flutter/core/dio_init.dart';
import 'package:moatikon_flutter/data/auth/dto/request/auth_request.dart';
import 'package:moatikon_flutter/data/auth/dto/response/token_dto.dart';
import 'package:moatikon_flutter/domain/auth/entity/token_entity.dart';

class RemoteAuthDataSource {
  Future<void> signup({required AuthRequest authRequest}) async {
    try{
      await dio.post('/auth/signup', data: authRequest.toJson());
    } catch (err) {
      throw Exception("이미 있는 아이디거나 비밀번호에 오류가 생겼습니다.");
    }
  }

  Future<TokenEntity> signin({required AuthRequest authRequest}) async {
    return const TokenDto(accessToken: '', refreshToken: '').toEntity();
  }
}