import 'package:moatikon_flutter/domain/auth/entity/token_entity.dart';

class TokenDto {
  final String accessToken;
  final String refreshToken;

  const TokenDto({
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokenDto.fromJson(Map<String, dynamic> json){
    return TokenDto(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }

  TokenEntity toEntity(){
    return TokenEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}