import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/failures/failure.dart';

abstract class ProfileResponsitoryInterface {
  Future<Either<Failure, UserResponseEntity>> updateAvatar(
    String avatarLink,
  );
}
