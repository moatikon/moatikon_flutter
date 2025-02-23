abstract class UsingTikonEvent {}

class InitGetAllUsingTikonsEvent extends UsingTikonEvent {}

class GetAllUsingTikonsEvent extends UsingTikonEvent {
  int page;

  GetAllUsingTikonsEvent({required this.page});
}
