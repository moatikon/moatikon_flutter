import 'package:moatikon_flutter/data/tikon/dto/response/tikon_dto.dart';

import '../../../../domain/tikon/entity/tikon_entity.dart';

class RemoteTikonDataSource{
  Future<List<TikonEntity>> getAllTikonList() async {
    final List<TikonDto> dumyData = [
      const TikonDto(
        image: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/500px-Pizza-3007395.jpg",
        storeName: "Pizza Hut",
        tikonName: "맛있는 피자 할인권",
        category: "식사류",
        dDay: 1,
        disCount: 100,
      ),

      const TikonDto(
        image: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/500px-Pizza-3007395.jpg",
        storeName: "Pizza Hut",
        tikonName: "맛있는 피자 할인권",
        category: "식사류",
        dDay: 1,
        disCount: 100,
      ),

      const TikonDto(
        image: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/500px-Pizza-3007395.jpg",
        storeName: "Pizza Hut",
        tikonName: "맛있는 피자 할인권",
        category: "식사류",
        dDay: 1,
        disCount: 100,
      ),
    ];

    return Future.delayed(const Duration(seconds: 5), () => dumyData.map((e) => TikonDto.fromJson(e).toEntity()).toList());
  }
}