import 'package:moatikon_flutter/data/tikon/dto/request/add_tikon_request.dart';
import 'package:moatikon_flutter/data/tikon/dto/request/edit_tikon_request.dart';
import '../entity/tikons_entity.dart';

abstract class TikonRepository {
  Future<TikonsEntity> getAllTikonList({int? page, int? available});

  Future<void> addTikon(AddTikonRequest request);

  Future<void> editTikon(EditTikonRequest request);

  Future<void> toggleTikon({required String id});

  Future<void> deleteTikon({required String id});
}
