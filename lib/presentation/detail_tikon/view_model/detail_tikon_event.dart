abstract class DetailTikonEvent {}

class DeleteTikonEvent extends DetailTikonEvent {
  final String id;

  DeleteTikonEvent({required this.id});
}

class ToggleTikonEvent extends DetailTikonEvent {
  final String id;

  ToggleTikonEvent({required this.id});
}
