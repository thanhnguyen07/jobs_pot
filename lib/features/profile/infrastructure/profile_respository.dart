import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/failures/failure.dart';
import 'package:jobs_pot/features/profile/domain/repositories/profile_responsitory_interface.dart';
import 'package:jobs_pot/networks/api_client.dart';
import 'package:jobs_pot/networks/api_util.dart';
import 'package:jobs_pot/utils/utils.dart';

class ProfileResponsitory implements ProfileResponsitoryInterface {
  late ApiClient _apiClient;

  ProfileResponsitory() {
    _apiClient = ApiUtil().getApiClient();
  }

  @override
  Future<Either<Failure, UserResponseEntity>> updateAvatar(
      String imageUrl, String id) async {
    try {
      final Map<String, String> body = {"image_url": imageUrl, "id": id};
      final signUpRes = await _apiClient.updateAvatar(body);
      return right(UserResponseEntity.fromJson(signUpRes));
    } catch (error) {
      return left(const Failure.empty());
    }
  }

  @override
  Future<Either<Failure, UserResponseEntity>> updateInformations({
    required String? userName,
    required String? dateOfBirth,
    required String? gender,
    required String? email,
    required String? phoneNumber,
    required String? location,
  }) async {
    try {
      final Map<String, String?> body = {
        "userName": userName,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
        "email": email,
        "phoneNumber": phoneNumber,
        "location": location,
      };
      final updateInformationsRes = await _apiClient.updateInformations(body);

      return right(UserResponseEntity.fromJson(updateInformationsRes));
    } catch (error) {
      String errorMessage = Utils.getErrorMessageResponse(error);

      return left(Failure.message(message: errorMessage));
    }
  }
}
