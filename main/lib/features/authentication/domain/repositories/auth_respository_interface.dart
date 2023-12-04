import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/features/authentication/domain/entities/resfresh_token_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/entities/verification_code_entity.dart';
import 'package:jobs_pot/features/authentication/domain/failures/failure.dart';

abstract class AuthRepositoryInterface {
  void saveToken(String token);

  void saveDataUser(String token, String refreshToken, String idUser);

  void saveOnboadingStatus();

  void saveRememberStatus();

  Future<String?> getToken();

  Future<String?> getRefreshToken();

  Future<String?> getIdUser();

  Future<bool?> getOnboadingStatus();

  Future<bool?> getRememberStatus();

  void removeToken();

  void removeOnboadingStatus();

  void removeRememberStatus();

  Future removeDataUser();

  Future<Either<Failure, UserResponseEntity>> signUpWithEmail(
    String fullName,
    String tokenFirebase,
  );

  Future<Either<Failure, UserResponseEntity>> getUserProfile(String id);

  Future<Either<Failure, UserResponseEntity>> signInWithFirebase(
      String tokenFirebase);

  Future<Either<Failure, VerificationCodeEntity>> sendVerificationCode(
      String email);

  Future<Either<Failure, VerificationCodeEntity>> sendVerifyCode(String code);

  Future<Either<Failure, RefreshTokenResponseEntity>> refreshToken(
      String refreshToken);

  Future<Either<Failure, RefreshTokenResponseEntity>> checkAccount(
      String providerId, String email);
}
