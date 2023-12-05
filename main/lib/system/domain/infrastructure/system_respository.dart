import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/features/authentication/domain/entities/resfresh_token_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/failures/failure.dart';
import 'package:jobs_pot/networks/api_client.dart';
import 'package:jobs_pot/system/domain/repositories/system_respository_interface.dart';

class SytemRepository implements SystemRepositoryInterface {
  late ApiClient _apiClient;

  @override
  Future<Either<Failure, RefreshTokenResponseEntity>> refreshToken(
      String refreshToken) async {
    try {
      final Map<String, dynamic> body = {
        ApiParameterKeyName.refreshTokenSnake: refreshToken,
      };
      final refreshTokenRes = await _apiClient.refreshToken(body);

      return right(RefreshTokenResponseEntity.fromJson(refreshTokenRes));
    } catch (error) {
      return left(const Failure.empty());
    }
  }
}
