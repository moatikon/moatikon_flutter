abstract class HomeEvent {}

class InitGetAllTikonsEvent extends HomeEvent {}

class GetAllTikonsEvent extends HomeEvent {
  int page;

  GetAllTikonsEvent({required this.page});
}