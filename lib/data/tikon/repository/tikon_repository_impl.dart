import 'package:moatikon_flutter/data/tikon/data_source/remote/remote_tikon_data_source.dart';
import 'package:moatikon_flutter/domain/tikon/entity/tikon_entity.dart';
import 'package:moatikon_flutter/domain/tikon/repository/tikon_repository.dart';

class TikonRepositoryImpl implements TikonRepository{
  final RemoteTikonDataSource _remoteTikonDataSource;

  const TikonRepositoryImpl({
    required RemoteTikonDataSource remoteTikonDataSource,
  }) : _remoteTikonDataSource = remoteTikonDataSource;

  @override
  Future<List<TikonEntity>> getAllTikonList() {
    return _remoteTikonDataSource.getAllTikonList();
  }
}