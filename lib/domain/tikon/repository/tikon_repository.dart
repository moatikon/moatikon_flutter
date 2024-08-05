import 'package:moatikon_flutter/domain/tikon/entity/tikon_entity.dart';

abstract class TikonRepository{
  Future<List<TikonEntity>> getAllTikonList();
}