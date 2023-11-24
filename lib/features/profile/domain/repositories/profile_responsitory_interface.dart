import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/common/app_enum.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/failures/failure.dart';

abstract class ProfileResponsitoryInterface {
  Future<Either<Failure, UserResponseEntity>> updateImage(
    String imageUrl,
    String id,
    UploadImageType type,
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
