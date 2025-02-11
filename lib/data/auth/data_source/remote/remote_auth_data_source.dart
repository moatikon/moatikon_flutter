import 'package:dio/dio.dart';
import 'package:moatikon_flutter/core/dio_init.dart';
import 'package:moatikon_flutter/core/token_secure_storage.dart';
import 'package:moatikon_flutter/data/auth/dto/request/signin_request.dart';
import 'package:moatikon_flutter/data/auth/dto/request/signup_request.dart';
import 'package:moatikon_flutter/data/auth/dto/response/token_dto.dart';
import 'package:moatikon_flutter/domain/auth/entity/token_entity.dart';

class RemoteAuthDataSource {
  Future<void> signup({required SignupRequest signupRequest}) async {
    try {
      await dio.post('/auth/signup', data: signupRequest.toJson());
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<TokenEntity> signin({required SignInRequest authRequest}) async {
    try {
      final response = await dio.post('/auth/signin', data: authRequest.toJson());
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

  Future<void> sendPwCode({required String email}) async {
    try {
      await dio.post('/auth/pw-code', data: {"email": email});
      return;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<String> sendPwCodeCheck({
    required String email,
    required String code,
  }) async {
    try {
      final response = await dio
          .post('/auth/pw-code-check', data: {"email": email, "code": code});
      return response.data;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<void> resettingPw({
    required String email,
    required String successCode,
    required String password,
  }) async {
    try {
      await dio.post('/auth/edit-pw', data: {
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
