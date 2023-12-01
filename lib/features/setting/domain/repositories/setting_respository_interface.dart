import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/database/entities/error_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/failures/failure.dart';

abstract class SettingRepositoryInterface {
  Future<Either<Failure, UserResponseEntity>> accountLink(
    UserInfo providerData,
    String id,
  );
  Future<Either<Failure, UserResponseEntity>> accountUnLink(
    String providerId,
    String id,
  );
  Future<Either<Failure, ErrorResponseEntity>> deleteAccount(
    String id,
  );
}
