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
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<TokenEntity> signin({required AuthRequest authRequest}) async {
    try{
      final response = await dio.post('/auth/signin', data: authRequest.toJson());
      return TokenDto.fromJson(response.data).toEntity();
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<TokenEntity> reIssue() async {
    String? refreshToken = await TokenSecureStorage.readRefreshToken();
    Map<String, dynamic> header = {"RE-TOKEN": refreshToken};

    try{
      final response = await dio.get('/auth/re-issue', options: Options(headers: header));
      return TokenDto.fromJson(response.data).toEntity();
    } on DioException catch (_) {
      rethrow;
    }
  }
}