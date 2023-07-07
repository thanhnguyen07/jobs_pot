import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/failures/failure.dart';

abstract class AuthRepositoryInterface {
  void saveToken(String token);

  void saveOnboadingStatus();

  void saveRememberStatus();

  Future<String?> getToken();

  Future<bool?> getOnboadingStatus();

  Future<bool?> getRememberStatus();

  void removeToken();

  void removeOnboadingStatus();

  void removeRememberStatus();

  Future<Either<Failure, UserResponseEntity>> signInWithEmail(
    String email,
    String password,
  );

  Future<Either<Failure, UserResponseEntity>> signUpWithEmail(
    String fullName,
  );

  Future<Either<Failure, UserResponseEntity>> getUserProfile();

  Future<Either<Failure, UserResponseEntity>> signInWithGoogle(
      String idToken, String uid);
}
