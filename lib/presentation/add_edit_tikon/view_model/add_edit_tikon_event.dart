import 'package:moatikon_flutter/data/tikon/dto/request/add_tikon_request.dart';

abstract class AddEditTikonEvent {}

class AddTikonEvent extends AddEditTikonEvent {
  final AddTikonRequest addTikonRequest;

  AddTikonEvent({required this.addTikonRequest});
}


