import 'package:dio/dio.dart';
import 'package:moatikon_flutter/core/dio_init.dart';
import 'package:moatikon_flutter/core/token_secure_storage.dart';
import 'package:moatikon_flutter/data/tikon/dto/request/add_tikon_request.dart';
import 'package:moatikon_flutter/data/tikon/dto/response/tikons_dto.dart';
import 'package:moatikon_flutter/domain/tikon/entity/tikons_entity.dart';

class RemoteTikonDataSource {
  Future<TikonsEntity> getAllTikonList() async {
    String? accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> header = {"Authorization": "Bearer $accessToken"};

    try {
      final response = await dio.get('/tikon', options: Options(headers: header));
      return TikonsDto.fromJson(response.data).toEntity();
    } on DioException catch(_) {
      rethrow;
    }
  }

  Future<void> addTikon(AddTikonRequest addTikonRequest) async {
    String? accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> header = {"Authorization": "Bearer $accessToken"};

    try {
      await dio.post(
        '/tikon',
        options: Options(headers: header, contentType: 'multipart/form-data'),
        data: addTikonRequest.toForm(),
      );
      return;
    } on DioException catch(err) {
      rethrow;
    }
  }
}
