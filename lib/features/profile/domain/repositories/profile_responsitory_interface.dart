import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/failures/failure.dart';

abstract class ProfileResponsitoryInterface {
  Future<Either<Failure, UserResponseEntity>> updateAvatar(
    String avatarLink,
  );
  Future<Either<Failure, UserResponseEntity>> updateInformations({
    required String userName,
    required String dateOfBirth,
    required String gender,
    required String email,
    required String phoneNumber,
    required String location,
  });
}
