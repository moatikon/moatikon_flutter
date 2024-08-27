import 'package:moatikon_flutter/data/tikon/dto/response/tikon_dto.dart';
import 'package:moatikon_flutter/domain/tikon/entity/tikons_entity.dart';

class TikonsDto {
  final List<TikonDto> tikons;

  const TikonsDto({required this.tikons});

  factory TikonsDto.fromJson(Map<String, dynamic> json) {
    return TikonsDto(
      tikons: json['tikons'].map<TikonDto>((i) => TikonDto.fromJson(i)).toList(),
    );
  }

  TikonsEntity toEntity() {
    return TikonsEntity(
      tikons: tikons.map((e) => e.toEntity()).toList(),
    );
  }
}
