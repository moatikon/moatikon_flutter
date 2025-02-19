import 'package:moatikon_flutter/domain/tikon/entity/tikon_entity.dart';

class TikonDto {
  final String id, image, storeName, tikonName, category;
  final int dDay, disCount;

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
      DateTime targetDate = DateTime.parse(json['dDay']);
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
    String dDayFactory(int dDay){
      if(dDay == 0){
        return "D-Day";
      } else if (dDay > 30){
        return "D-30+";
      }

      return "D-$dDay";
    }

    return TikonEntity(
      id: id,
      image: image,
      storeName: storeName,
      tikonName: tikonName,
      category: category,
      dDay: dDayFactory(dDay),
      disCount: disCount == 100
          ? "FREE"
          : "$disCount%",
    );
  }
}
