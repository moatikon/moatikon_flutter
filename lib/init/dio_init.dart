import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../core/dio.dart';
import '../core/ignore/base_url.dart';
import '../core/token_secure_storage.dart';

void dioInit() => dio.interceptors.add(
      InterceptorsWrapper(
        // 요청을 보낼 떄
        onRequest: (options, handler) {
          debugPrint('[REQ] [${options.method}] ${options.uri}');
          return handler.next(options);
        },

        onError: (error, handler) async {
          final Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

          debugPrint('[ERR] [${error.requestOptions.method}] ${error.requestOptions.uri}');

          if (error.response?.statusCode == 401) {
            final String? storageRefreshToken = await TokenSecureStorage.readRefreshToken();
            if (storageRefreshToken == null) return handler.reject(error); // 실패하면 reject

            try{
              Map<String, dynamic> header = {"Authorization": "Bearer $storageRefreshToken"};
              final response = await dio.get('/auth/re-issue', options: Options(headers: header));

              final String accessToken = response.data['accessToken'];
              final String refreshToken = response.data['refreshToken'];

              TokenSecureStorage.writeAccessToken(accessToken);
              TokenSecureStorage.writeRefreshToken(refreshToken);

              final options = error.requestOptions;
              options.headers.addAll({'Authorization': accessToken});
              final fetchData = await dio.fetch(options);
              return handler.resolve(fetchData);
            } on DioException catch(err){
              return handler.reject(err);
            }
          }

          return handler.reject(error);
        },
      ),
    );