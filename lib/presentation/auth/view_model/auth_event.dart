import 'package:moatikon_flutter/data/auth/dto/request/signin_request.dart';
import 'package:moatikon_flutter/data/auth/dto/request/signup_request.dart';

class AuthEvent {}

class EmptyEvent extends AuthEvent {}

class SignInEvent extends AuthEvent {
  final SignInRequest authRequest;

  SignInEvent({required this.authRequest});
}

class SignUpEvent extends AuthEvent {
  final SignupRequest signupRequest;

  SignUpEvent({required this.signupRequest});
}
