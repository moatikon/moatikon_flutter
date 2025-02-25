import 'package:moatikon_flutter/core/token_secure_storage.dart';

class SignInRequest {
  final String email;
  final String password;

  const SignInRequest({
    required this.email,
    required this.password,
  });

  Future<Map<String, dynamic>> toJson() async {
    Map<String, dynamic> data = <String, dynamic>{};

    data['email'] = email;
    data['password'] = password;
    data['deviceToken'] = await TokenSecureStorage.readDeviceToken();

    return data;
  }
}