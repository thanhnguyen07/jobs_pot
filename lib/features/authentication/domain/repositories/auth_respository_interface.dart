import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/failures/failure.dart';

abstract class AuthRepositoryInterface {
  void saveToken(String token);

  void saveRefreshToken(String token);

  Future<String?> getToken();

  Future<String?> getRefreshToken();

  void removeToken();

  void removeRefreshToken();

  Future<Either<Failure, UserResponseEntity>> signInWithEmail(
    String email,
    String password,
  );

  Future<Either<Failure, UserResponseEntity>> signUpWithEmail(
    String fullName,
    String email,
    String password,
  );
}
