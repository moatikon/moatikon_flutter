import 'package:dio/dio.dart';
import 'package:moatikon_flutter/core/dio.dart';
import 'package:moatikon_flutter/core/token_secure_storage.dart';
import 'package:moatikon_flutter/data/auth/dto/request/send_change_pw_code_request.dart';
import 'package:moatikon_flutter/data/auth/dto/request/signin_request.dart';
import 'package:moatikon_flutter/data/auth/dto/request/signup_request.dart';
import 'package:moatikon_flutter/data/auth/dto/response/token_dto.dart';
import 'package:moatikon_flutter/domain/auth/entity/token_entity.dart';

class RemoteAuthDataSource {
  Future<void> signup({required SignupRequest signupRequest}) async {
    try {
      await dio.post('/auth/signup', data: await signupRequest.toJson());
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<TokenEntity> signin({required SignInRequest authRequest}) async {
    try {
      final response = await dio.post('/auth/signin', data: await authRequest.toJson());
      return TokenDto.fromJson(response.data).toEntity();
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<TokenEntity> reIssue() async {
    String? refreshToken = await TokenSecureStorage.readRefreshToken();
    Map<String, dynamic> header = {"Authorization": "Bearer $refreshToken"};

    try {
      final response = await dio.get('/auth/re-issue', options: Options(headers: header));
      return TokenDto.fromJson(response.data).toEntity();
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<void> withdraw() async {
    String? accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> header = {"Authorization": "Bearer $accessToken"};

    try {
      await dio.post('/auth/withdraw', options: Options(headers: header));
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<void> sendChangePWCode({required SendChangePwCodeRequest request}) async {
    try {
      await dio.post('/auth/send/code', data: request.toJson());
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<void> editPassword({
    required String email,
    required String successCode,
    required String password,
  }) async {
    try {
      await dio.post('/auth/edit/password', data: {
        "email": email,
        "successCode": successCode,
        "password": password,
      });
      return;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
