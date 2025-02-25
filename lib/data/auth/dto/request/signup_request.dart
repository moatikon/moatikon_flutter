import 'package:moatikon_flutter/core/token_secure_storage.dart';

class SignupRequest {
  final String email;
  final String password;
  final String nickname;

  const SignupRequest({
    required this.email,
    required this.password,
    required this.nickname,
  });

  Future<Map<String, dynamic>> toJson() async {
    Map<String, dynamic> data = <String, dynamic>{};

    data['email'] = email;
    data['nickname'] = nickname;
    data['password'] = password;
    data['deviceToken'] = await TokenSecureStorage.readDeviceToken();

    return data;
  }
}