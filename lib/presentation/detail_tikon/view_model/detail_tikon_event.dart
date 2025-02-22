abstract class DetailTikonEvent {}

class DeleteTikonEvent extends DetailTikonEvent {
  final String id;

  DeleteTikonEvent({required this.id});
}
