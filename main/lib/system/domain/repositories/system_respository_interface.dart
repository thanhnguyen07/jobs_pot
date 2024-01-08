import 'package:fpdart/fpdart.dart';
import 'package:models/failures/failure.dart';
import 'package:models/entities/refresh_token_response/resfresh_token_response_entity.dart';

abstract class SystemRepositoryInterface {
  Future<Either<Failure, RefreshTokenResponseEntity>> refreshToken(
      String refreshToken);
}
