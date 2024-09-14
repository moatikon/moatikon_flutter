import '../../../data/auth/dto/request/auth_request.dart';
import '../entity/token_entity.dart';

abstract class AuthRepository {
  Future<void> signup({required AuthRequest authRequest});

  Future<TokenEntity> signin({required AuthRequest authRequest});

  Future<TokenEntity> reIssue();

  Future<void> sendPwCode({required String email});
}
