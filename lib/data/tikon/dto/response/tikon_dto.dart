import 'package:moatikon_flutter/domain/tikon/entity/tikon_entity.dart';

class TikonDto {
  final String id, image, storeName, tikonName, category;
  final int disCount;
  final DateTime dDay;

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
    return TikonDto(
      id: json['id'],
      image: json['image'],
      storeName: json['storeName'],
      tikonName: json['tikonName'],
      category: json['category'],
      dDay: DateTime.parse(json['dDay']),
      disCount: json['discount'],
    );
  }

  TikonEntity toEntity() {
    return TikonEntity(
      id: id,
      image: image,
      storeName: storeName,
      tikonName: tikonName,
      category: category,
      dDay: dDay,
      disCount: disCount,
    );
  }
}
