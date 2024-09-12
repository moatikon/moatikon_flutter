import 'package:moatikon_flutter/data/tikon/dto/request/add_tikon_request.dart';

abstract class TikonEvent {}

class GetAllTikonListEvent extends TikonEvent {}

class AddTikonEvent extends TikonEvent {
  final AddTikonRequest addTikonRequest;

  AddTikonEvent({required this.addTikonRequest});
}

class CompleteTikonEvent extends TikonEvent {
  final int id;

  CompleteTikonEvent({required this.id});
}