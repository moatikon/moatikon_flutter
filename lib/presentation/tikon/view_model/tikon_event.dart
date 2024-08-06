import 'package:moatikon_flutter/data/tikon/dto/request/add_tikon_request.dart';

abstract class TikonEvent {}

class GetAllTikonListEvent extends TikonEvent {}

class AddTikon extends TikonEvent {
  final AddTikonRequest addTikonRequest;

  AddTikon({required this.addTikonRequest});
}