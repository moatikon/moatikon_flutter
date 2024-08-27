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
    TikonsEntity dummyToEntity = TikonsDto.fromJson(dummyData).toEntity();

    return Future.delayed(const Duration(seconds: 2), () => dummyToEntity);
  }

  Future<void> addTikon(AddTikonRequest addTikonRequest) async {
    dummyData['tikons']!.add(addTikonRequest.toJson());
  }
}
