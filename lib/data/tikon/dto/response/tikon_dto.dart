import 'package:moatikon_flutter/domain/tikon/entity/tikon_entity.dart';

class TikonDto {
  final String image, storeName, tikonName, category;
  final int id, dDay, disCount;

  const TikonDto({
    required this.id,
    required this.image,
    required this.storeName,
    required this.tikonName,
    required this.category,
    required this.dDay,
    required this.disCount,
  });

  factory TikonDto.fromJson(Map<String, dynamic> json) {
    int genDDay() {
      DateTime targetDate = DateTime.parse(json['finishedTikon']);
      DateTime now = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      );

      return targetDate.difference(now).inDays;
    }

    return TikonDto(
      id: json['id'],
      image: json['image'],
      storeName: json['storeName'],
      tikonName: json['tikonName'],
      category: json['category'],
      dDay: genDDay(),
      disCount: json['discount'],
    );
  }

  TikonEntity toEntity() {
    return TikonEntity(
      image: image,
      storeName: storeName,
      tikonName: tikonName,
      category: category,
      dDay: dDay,
      disCount: disCount,
    );
  }
}
