import 'package:moatikon_flutter/data/auth/dto/request/auth_request.dart';

class AuthEvent {}

class EmptyEvent extends AuthEvent {}

class SignInEvent extends AuthEvent {
  final AuthRequest authRequest;

  SignInEvent({required this.authRequest});
}

class SignUpEvent extends AuthEvent {
  final AuthRequest authRequest;

  SignUpEvent({required this.authRequest});
}
