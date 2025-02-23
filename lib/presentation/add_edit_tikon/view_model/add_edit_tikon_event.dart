import 'package:moatikon_flutter/data/tikon/dto/request/add_tikon_request.dart';
import 'package:moatikon_flutter/data/tikon/dto/request/edit_tikon_request.dart';

abstract class AddEditTikonEvent {}

class AddTikonEvent extends AddEditTikonEvent {
  final AddTikonRequest addTikonRequest;

  AddTikonEvent({required this.addTikonRequest});
}

class EditTikonEvent extends AddEditTikonEvent {
  final EditTikonRequest editTikonRequest;

  EditTikonEvent({required this.editTikonRequest});
}
