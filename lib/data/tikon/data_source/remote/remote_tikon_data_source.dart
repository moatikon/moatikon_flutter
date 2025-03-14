import 'package:dio/dio.dart';
import 'package:moatikon_flutter/core/dio.dart';
import 'package:moatikon_flutter/core/token_secure_storage.dart';
import 'package:moatikon_flutter/data/tikon/dto/request/add_tikon_request.dart';
import 'package:moatikon_flutter/data/tikon/dto/request/edit_tikon_request.dart';
import 'package:moatikon_flutter/data/tikon/dto/response/tikons_dto.dart';
import 'package:moatikon_flutter/domain/tikon/entity/tikons_entity.dart';

class RemoteTikonDataSource {
  Future<TikonsEntity> getAllTikonList({
    int? page,
    int? available,
  }) async {
    String? accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> header = {"Authorization": "Bearer $accessToken"};
    Map<String, dynamic> query = {"page": page ?? 0, "available": available ?? 1};

    try {
      final response = await dio.get(
        '/tikon',
        options: Options(headers: header),
        queryParameters: query,
      );
      return TikonsDto.fromJson(response.data).toEntity();
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<void> addTikon(AddTikonRequest addTikonRequest) async {
    String? accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> header = {"Authorization": "Bearer $accessToken"};
    FormData formData = await addTikonRequest.toForm();

    try {
      await dio.post(
        '/tikon',
        options: Options(
          headers: header,
          contentType: Headers.multipartFormDataContentType,
        ),
        data: formData,
      );
      return;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<void> editTikon(EditTikonRequest editTikonRequest) async {
    String? accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> header = {"Authorization": "Bearer $accessToken"};
    FormData formData = await editTikonRequest.toForm();

    try {
      await dio.patch(
        '/tikon/${editTikonRequest.id}',
        options: Options(
          headers: header,
          contentType: Headers.multipartFormDataContentType,
        ),
        data: formData,
      );
      return;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<void> toggleTikon({required String id}) async {
    String? accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> header = {"Authorization": "Bearer $accessToken"};

    try {
      await dio.patch(
        '/tikon/toggle/$id',
        options: Options(headers: header),
      );
      return;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<void> deleteTikon({required String id}) async {
    String? accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> header = {"Authorization": "Bearer $accessToken"};

    try {
      await dio.delete(
        '/tikon/$id',
        options: Options(headers: header),
      );
      return;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
