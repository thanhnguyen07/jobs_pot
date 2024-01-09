import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:models/failures/failure.dart';
import 'package:models/entities/export.dart';

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
    String tokenFirebase,
  );
}
