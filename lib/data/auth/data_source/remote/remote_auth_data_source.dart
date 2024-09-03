import 'package:dio/dio.dart';
import 'package:moatikon_flutter/core/dio_init.dart';
import 'package:moatikon_flutter/core/token_secure_storage.dart';
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
    try{
      final response = await dio.post('/auth/signin', data: authRequest.toJson());
      return TokenDto.fromJson(response.data).toEntity();
    } catch (err) {
      throw Exception("유저 정보가 일치하지 않습니다.");
    }
  }

  Future<TokenEntity> reIssue() async {
    String? refreshToken = await TokenSecureStorage.readRefreshToken();
    Map<String, dynamic> header = {"RE-TOKEN": refreshToken};

    try{
      final response = await dio.get('/auth/re-issue', options: Options(headers: header));
      return TokenDto.fromJson(response.data).toEntity();
    } catch (err) {
      throw Exception("Refresh Token 만료");
    }
  }
}