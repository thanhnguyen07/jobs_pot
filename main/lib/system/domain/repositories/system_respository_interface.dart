import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/features/authentication/domain/entities/RefreshTokenResponse/resfresh_token_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/failures/failure.dart';

abstract class SystemRepositoryInterface {
  Future<Either<Failure, RefreshTokenResponseEntity>> refreshToken(
      String refreshToken);
}
