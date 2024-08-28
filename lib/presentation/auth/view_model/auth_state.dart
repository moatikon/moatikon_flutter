import '../../../core/bloc_state_enum.dart';

abstract class AuthState<T> {
  BlocStateEnum tikonState;
  T? valueOfNull;
  Object? errorOfNull;

  AuthState({
    required this.tikonState,
    this.valueOfNull,
    this.errorOfNull,
  });

  T get value => valueOfNull!;
  String get error => errorOfNull!.toString().substring(11);
}

class Empty<T> extends AuthState<T> {
  Empty() : super(tikonState: BlocStateEnum.empty);
}

class Loading<T> extends AuthState<T> {
  Loading() : super(tikonState: BlocStateEnum.loading);
}

class Error<T> extends AuthState<T> {
  final Object exception;

  Error({required this.exception})
      : super(tikonState: BlocStateEnum.error, errorOfNull: exception);
}

class Loaded<T> extends AuthState<T> {
  final T? data;

  Loaded({required this.data})
      : super(tikonState: BlocStateEnum.loaded, valueOfNull: data);
}