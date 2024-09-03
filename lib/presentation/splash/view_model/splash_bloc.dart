import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moatikon_flutter/core/token_secure_storage.dart';
import 'package:moatikon_flutter/domain/auth/entity/token_entity.dart';
import 'package:moatikon_flutter/domain/auth/use_case/re_issue_use_case.dart';
import 'package:moatikon_flutter/presentation/splash/view_model/splash_event.dart';
import 'package:moatikon_flutter/presentation/splash/view_model/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final ReIssueUseCase _reIssueUseCase;

  SplashBloc({required ReIssueUseCase reIssueUseCase})
      : _reIssueUseCase = reIssueUseCase,
        super(Empty()) {
    on<ReIssueEvent>(reissueHandler);
  }

  void reissueHandler(ReIssueEvent event, Emitter<SplashState> emit) async {
    emit(Loading());

    try {
      final TokenEntity tokenEntity = await _reIssueUseCase.execute();
      await TokenSecureStorage.writeAccessToken(tokenEntity.accessToken);
      await TokenSecureStorage.writeRefreshToken(tokenEntity.refreshToken);

      emit(Loaded());
    } catch (err) {
      emit(Error(exception: err));
    }
  }
}
