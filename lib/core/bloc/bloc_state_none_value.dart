import 'package:dio/dio.dart';

import 'bloc_state_enum.dart';
import 'exception_response_model.dart';

abstract class BlocState {
  BlocStateEnum blocState;
  DioException? errorOfNull;

  BlocState({
    required this.blocState,
    this.errorOfNull,
  });

  ExceptionResponseModel get error =>
      ExceptionResponseModel.fromJson(errorOfNull!.response!);
}

class Empty extends BlocState {
  Empty() : super(blocState: BlocStateEnum.empty);
}

class Loading extends BlocState {
  Loading() : super(blocState: BlocStateEnum.loading);
}

class Error extends BlocState {
  final DioException exception;

  Error({required this.exception})
      : super(blocState: BlocStateEnum.error, errorOfNull: exception);
}

class Loaded extends BlocState {
  Loaded() : super(blocState: BlocStateEnum.loaded);
}
