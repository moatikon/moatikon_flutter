import 'package:moatikon_flutter/data/tikon/dto/response/tikon_dto.dart';

import '../../../../core/util/dummy_data.dart';
import '../../../../domain/tikon/entity/tikon_entity.dart';

class RemoteTikonDataSource{
  Future<List<TikonEntity>> getAllTikonList() async {
    List<TikonEntity> dummyToEntity = dummyData.map((e) => TikonDto.fromJson(e).toEntity()).toList();

    return Future.delayed(const Duration(seconds: 5), () => dummyToEntity);
  }
}