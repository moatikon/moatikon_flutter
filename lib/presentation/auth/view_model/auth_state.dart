import '../../../core/bloc_state_enum.dart';

abstract class AuthState {
  BlocStateEnum authState;
  Object? errorOfNull;

  AuthState({
    required this.authState,
    this.errorOfNull,
  });

  String get error => errorOfNull!.toString().substring(11);
}

class Empty extends AuthState {
  Empty() : super(authState: BlocStateEnum.empty);
}

class Loading extends AuthState {
  Loading() : super(authState: BlocStateEnum.loading);
}

class Error extends AuthState {
  final Object exception;

  Error({required this.exception})
      : super(authState: BlocStateEnum.error, errorOfNull: exception);
}

class Loaded extends AuthState {
  Loaded() : super(authState: BlocStateEnum.loaded);
}
