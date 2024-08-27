import '../../../core/bloc_state_enum.dart';

abstract class TikonState<T> {
  BlocStateEnum tikonState;
  T? valueOfNull;
  Object? errorOfNull;

  TikonState({
    required this.tikonState,
    this.valueOfNull,
    this.errorOfNull,
  });

  T get value => valueOfNull!;
  String get error => errorOfNull!.toString().substring(11);
}

class Empty<T> extends TikonState<T> {
  Empty() : super(tikonState: BlocStateEnum.empty);
}

class Loading<T> extends TikonState<T> {
  Loading() : super(tikonState: BlocStateEnum.loading);
}

class Error<T> extends TikonState<T> {
  final Object exception;

  Error({required this.exception})
      : super(tikonState: BlocStateEnum.error, errorOfNull: exception);
}

class Loaded<T> extends TikonState<T> {
  final T? data;

  Loaded({required this.data})
      : super(tikonState: BlocStateEnum.loaded, valueOfNull: data);
}