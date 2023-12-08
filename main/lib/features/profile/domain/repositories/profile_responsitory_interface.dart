import 'package:fpdart/fpdart.dart';
import 'package:http_parser/http_parser.dart';
import 'package:jobs_pot/features/authentication/domain/entities/UserResponse/user_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/failures/failure.dart';

abstract class ProfileResponsitoryInterface {
  Future<Either<Failure, UserResponseEntity>> updateImage({
    required String filePath,
    required String fileName,
    required MediaType contentType,
    required String id,
  });
  Future<Either<Failure, UserResponseEntity>> updateInformations({
    required String? userName,
    required String? dateOfBirth,
    required String? gender,
    required String userId,
    required Map? phoneNumber,
    required String? location,
  });
}
