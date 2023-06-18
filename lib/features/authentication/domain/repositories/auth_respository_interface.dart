import 'package:jobs_pot/features/authentication/domain/entities/token_entity.dart';

abstract class AuthRepositoryInterface {
  void saveToken(TokenEntity token);

  void saveRefreshToken(TokenEntity token);

  Future<TokenEntity?> getToken();

  Future<TokenEntity?> getRefreshToken();

  void removeToken();

  void removeRefreshToken();

  // Future<Either<Failure, UserResponseEntity>> getUserProfile();

  // Future<Either<Failure, TokenEntity>> signinWithMail(
  //     String userName, String password);
}
