import 'package:moatikon_flutter/domain/tikon/entity/tikon_entity.dart';

class TikonDto {
  final String image, storeName, tikonName, category;
  final int dDay, disCount;

  const TikonDto({
    required this.image,
    required this.storeName,
    required this.tikonName,
    required this.category,
    required this.dDay,
    required this.disCount,
  });

  factory TikonDto.fromJson(Map<String, dynamic> json){


    return TikonDto(
      image: json['image'],
      storeName: json['storeName'],
      tikonName: json['tikonName'],
      category: json['category'],
      dDay: DateTime.now().difference(DateTime.parse(json['finishedTikon'])).inDays,
      disCount: json['disCount'],
    );
  }

  TikonEntity toEntity(){
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