import 'package:fpdart/fpdart.dart';
import 'package:models/failures/failure.dart';
import 'package:models/entities/refresh_token_response/resfresh_token_response_entity.dart';
import 'package:models/entities/user_response/user_response_entity.dart';
import 'package:models/entities/verification_code/verification_code_entity.dart';

abstract class AuthRepositoryInterface {
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

  Future<Either<Failure, RefreshTokenResponseEntity>> checkAccount(
      String providerId, String email);
}
