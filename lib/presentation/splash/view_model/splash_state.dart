import '../../../core/bloc_state_enum.dart';

abstract class SplashState {
  BlocStateEnum splashState;
  Object? errorOfNull;

  SplashState({
    required this.splashState,
    this.errorOfNull,
  });
}

class Empty extends SplashState {
  Empty() : super(splashState: BlocStateEnum.empty);
}

class Loading extends SplashState {
  Loading() : super(splashState: BlocStateEnum.loading);
}

class Error extends SplashState {
  final Object exception;

  Error({required this.exception})
      : super(splashState: BlocStateEnum.error, errorOfNull: exception);
}

class Loaded extends SplashState {
  Loaded() : super(splashState: BlocStateEnum.loaded);
}
