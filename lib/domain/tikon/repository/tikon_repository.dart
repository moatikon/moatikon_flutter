import 'package:moatikon_flutter/data/tikon/dto/request/add_tikon_request.dart';
import '../entity/tikons_entity.dart';

abstract class TikonRepository{
  Future<TikonsEntity> getAllTikonList();
  Future<void> addTikon(AddTikonRequest request);
}