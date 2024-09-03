import 'package:dio/dio.dart';
import 'package:moatikon_flutter/core/dio_init.dart';
import 'package:moatikon_flutter/core/token_secure_storage.dart';
import 'package:moatikon_flutter/data/tikon/dto/request/add_tikon_request.dart';
import 'package:moatikon_flutter/data/tikon/dto/response/tikons_dto.dart';
import 'package:moatikon_flutter/domain/tikon/entity/tikons_entity.dart';

final Map<String, List<Map<String, dynamic>>> dummyData = {
  "tikons": [
    {
      "image": "https://www.contis.ph/cdn/shop/products/CokeinCan.jpg?v=1689558538&width=1200",
      "storeName": "코카콜라",
      "tikonName": "코카콜라가 무료!",
      "category": "음료",
      "finishedTikon": "2024-08-27",
      "disCount": 100,
    },
    {
      "image": "https://www.contis.ph/cdn/shop/products/CokeinCan.jpg?v=1689558538&width=1200",
      "storeName": "코카콜라",
      "tikonName": "코카콜라가 무료!",
      "category": "음료",
      "finishedTikon": "2024-08-27",
      "disCount": 100,
    },
    {
      "image": "https://www.contis.ph/cdn/shop/products/CokeinCan.jpg?v=1689558538&width=1200",
      "storeName": "코카콜라",
      "tikonName": "코카콜라가 무료!",
      "category": "음료",
      "finishedTikon": "2024-08-28",
      "disCount": 100,
    },
  ]
};

class RemoteTikonDataSource {
  Future<TikonsEntity> getAllTikonList() async {
    String? accessToken = await TokenSecureStorage.readAccessToken();
    Map<String, dynamic> header = {"Authorization": "Bearer $accessToken"};

    try {
      final response = await dio.get('/tikon', options: Options(headers: header));
      return TikonsDto.fromJson(response.data).toEntity();
    } on DioException catch(_) {
      throw Exception("Invalid Token");
    }
  }

  Future<void> addTikon(AddTikonRequest addTikonRequest) async {
    dummyData['tikons']!.add(addTikonRequest.toJson());
  }
}
