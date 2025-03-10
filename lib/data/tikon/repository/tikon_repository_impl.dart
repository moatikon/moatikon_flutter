import 'package:moatikon_flutter/data/tikon/data_source/remote/remote_tikon_data_source.dart';
import 'package:moatikon_flutter/data/tikon/dto/request/add_tikon_request.dart';
import 'package:moatikon_flutter/data/tikon/dto/request/edit_tikon_request.dart';
import 'package:moatikon_flutter/domain/tikon/entity/tikons_entity.dart';
import 'package:moatikon_flutter/domain/tikon/repository/tikon_repository.dart';

class TikonRepositoryImpl implements TikonRepository {
  final RemoteTikonDataSource _remoteTikonDataSource;

  const TikonRepositoryImpl({
    required RemoteTikonDataSource remoteTikonDataSource,
  }) : _remoteTikonDataSource = remoteTikonDataSource;

  @override
  Future<TikonsEntity> getAllTikonList({int? page, int? available}) {
    return _remoteTikonDataSource.getAllTikonList(
      page: page,
      available: available,
    );
  }

  @override
  Future<void> addTikon(AddTikonRequest request) {
    return _remoteTikonDataSource.addTikon(request);
  }

  @override
  Future<void> deleteTikon({required String id}) {
    return _remoteTikonDataSource.deleteTikon(id: id);
  }

  @override
  Future<void> editTikon(EditTikonRequest request) {
    return _remoteTikonDataSource.editTikon(request);
  }

  @override
  Future<void> toggleTikon({required String id}) {
    return _remoteTikonDataSource.toggleTikon(id: id);
  }
}
