import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/failures/failure.dart';
import 'package:jobs_pot/features/profile/domain/repositories/profile_responsitory_interface.dart';
import 'package:jobs_pot/networks/api_client.dart';
import 'package:jobs_pot/networks/api_util.dart';

class ProfileResponsitory implements ProfileResponsitoryInterface {
  late ApiClient _apiClient;

  ProfileResponsitory() {
    _apiClient = ApiUtil().getApiClient();
  }

  @override
  Future<Either<Failure, UserResponseEntity>> updateAvatar(
      String avatarLink) async {
    try {
      final Map<String, String> body = {
        "avatarLink": avatarLink,
      };
      final signUpRes = await _apiClient.updateAvatar(body);

      return right(UserResponseEntity.fromJson(signUpRes));
    } catch (error) {
      return left(const Failure.empty());
    }
  }
}
