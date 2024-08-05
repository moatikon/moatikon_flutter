import 'package:moatikon_flutter/domain/tikon/entity/tikon_entity.dart';

class TikonModel{
  final List<TikonEntity> tikonList;

  TikonModel({required this.tikonList});

  TikonModel copyWith(List<TikonEntity>? tikonList){
    return TikonModel(
      tikonList: tikonList ?? this.tikonList,
    );
  }
}