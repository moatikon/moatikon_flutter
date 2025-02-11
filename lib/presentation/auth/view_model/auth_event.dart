import 'package:moatikon_flutter/data/auth/dto/request/auth_request.dart';
import 'package:moatikon_flutter/data/auth/dto/request/signup_request.dart';

class AuthEvent {}

class EmptyEvent extends AuthEvent {}

class SignInEvent extends AuthEvent {
  final AuthRequest authRequest;

  SignInEvent({required this.authRequest});
}

class SignUpEvent extends AuthEvent {
  final SignupRequest signupRequest;

  SignUpEvent({required this.signupRequest});
}
