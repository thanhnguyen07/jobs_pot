import 'package:fpdart/fpdart.dart';
import 'package:http_parser/http_parser.dart';
import 'package:models/failures/failure.dart';
import 'package:models/entities/user_response/user_response_entity.dart';

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
