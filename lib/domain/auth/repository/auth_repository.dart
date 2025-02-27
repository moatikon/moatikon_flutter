import 'package:moatikon_flutter/data/auth/dto/request/send_change_pw_code_request.dart';
import 'package:moatikon_flutter/data/auth/dto/request/signup_request.dart';

import '../../../data/auth/dto/request/signin_request.dart';
import '../entity/token_entity.dart';

abstract class AuthRepository {
  Future<void> signup({required SignupRequest signupRequest});

  Future<TokenEntity> signin({required SignInRequest authRequest});

  Future<TokenEntity> reIssue();

  Future<void> withdraw();

  Future<void> sendChangePWCode({required SendChangePwCodeRequest request});

  Future<void> editPassword({
    required String email,
    required String successCode,
    required String password,
  });
}
