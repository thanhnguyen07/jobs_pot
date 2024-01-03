import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/database/entities/error_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/entities/UserResponse/user_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/entities/VerificationCode/verification_code_entity.dart';
import 'package:jobs_pot/features/authentication/domain/failures/failure.dart';

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

  Future<Either<Failure, ErrorResponseEntity>> checkAccount(
      String providerId, String email);
}
