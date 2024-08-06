import 'package:moatikon_flutter/data/tikon/dto/request/add_tikon_request.dart';
import 'package:moatikon_flutter/domain/tikon/entity/tikon_entity.dart';

abstract class TikonRepository{
  Future<List<TikonEntity>> getAllTikonList();
  Future<void> addTikon(AddTikonRequest request);
}