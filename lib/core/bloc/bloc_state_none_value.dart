import 'package:dio/dio.dart';

import 'bloc_state_enum.dart';
import 'exception_response_model.dart';

abstract class BlocStateNoneValue {
  BlocStateEnum blocState;
  DioException? errorOfNull;

  BlocStateNoneValue({
    required this.blocState,
    this.errorOfNull,
  });

  ExceptionResponseModel get error =>
      ExceptionResponseModel.fromJson(errorOfNull!.response!);
}

class Empty extends BlocStateNoneValue {
  Empty() : super(blocState: BlocStateEnum.empty);
}

class Loading extends BlocStateNoneValue {
  Loading() : super(blocState: BlocStateEnum.loading);
}

class Error extends BlocStateNoneValue {
  final DioException exception;

  Error({required this.exception})
      : super(blocState: BlocStateEnum.error, errorOfNull: exception);
}

class Loaded extends BlocStateNoneValue {
  Loaded() : super(blocState: BlocStateEnum.loaded);
}
