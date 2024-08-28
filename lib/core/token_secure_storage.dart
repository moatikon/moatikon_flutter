import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'ignore/secure_token_keys.dart';

const _storage = FlutterSecureStorage(
  aOptions: AndroidOptions(encryptedSharedPreferences: true),
);

class TokenSecureStorage {
  static const String _accessTokenKey = secureAccessTokenKey;
  static const String _refreshTokenKey = secureRefreshTokenKey;

  static Future<void> writeAccessToken(String? accessToken) async {
    debugPrint('access : $accessToken');
    await _storage.write(key: _accessTokenKey, value: accessToken);
  }

  static Future<void> writeRefreshToken(String? refreshToken) async {
    debugPrint('refresh : $refreshToken');
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  static Future<String?> readAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  static Future<String?> readRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }
}
