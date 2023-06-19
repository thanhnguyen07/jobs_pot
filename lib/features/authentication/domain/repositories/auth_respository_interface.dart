import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/features/authentication/domain/entities/token_entity.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/failures/failure.dart';

abstract class AuthRepositoryInterface {
  void saveToken(TokenEntity token);

  void saveRefreshToken(TokenEntity token);

  Future<TokenEntity?> getToken();

  Future<TokenEntity?> getRefreshToken();

  void removeToken();

  void removeRefreshToken();

  // Future<Either<Failure, UserResponseEntity>> getUserProfile();

  Future<Either<Failure, UserResponseEntity>> signUpWithMail(
    String fullName,
    String email,
    String password,
  );
}
