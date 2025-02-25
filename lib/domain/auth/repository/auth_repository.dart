import 'package:moatikon_flutter/data/auth/dto/request/signup_request.dart';

import '../../../data/auth/dto/request/signin_request.dart';
import '../entity/token_entity.dart';

abstract class AuthRepository {
  Future<void> signup({required SignupRequest signupRequest});

  Future<TokenEntity> signin({required SignInRequest authRequest});

  Future<TokenEntity> reIssue();

  Future<void> withdraw();

  Future<void> sendPwCode({required String email});

  Future<String> sendPwCodeCheck({required String email, required String code});

  Future<void> resettingPw({
    required String email,
    required String successCode,
    required String password,
  });
}
