import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/failures/failure.dart';

abstract class AuthRepositoryInterface {
  void saveBothToken(String token, String refreshToken);

  void saveToken(String token);

  void saveRefreshToken(String token);

  void saveOnboadingStatus();

  Future<String?> getToken();

  Future<String?> getRefreshToken();

  Future<bool?> getOnboadingStatus();

  void removeBothToken();

  void removeToken();

  void removeRefreshToken();

  void removeOnboadingStatus();

  Future<Either<Failure, UserResponseEntity>> signInWithEmail(
    String email,
    String password,
  );

  Future<Either<Failure, UserResponseEntity>> signUpWithEmail(
    String fullName,
    String email,
    String password,
  );

  Future<Either<Failure, UserResponseEntity>> getUserProfile();

  Future<Either<Failure, String>> refreshToken();
}
