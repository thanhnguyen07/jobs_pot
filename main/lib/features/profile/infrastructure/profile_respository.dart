import 'package:fpdart/fpdart.dart';
import 'package:http_parser/http_parser.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/database/entities/error_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/failures/failure.dart';
import 'package:jobs_pot/features/profile/domain/repositories/profile_responsitory_interface.dart';
import 'package:jobs_pot/main.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:network/network.dart';

class ProfileResponsitory implements ProfileResponsitoryInterface {
  late ApiClient _apiClient;

  ProfileResponsitory() {
    _apiClient =
        appContainer.read(systemControllerProvider.notifier).getAppApiClient();
  }

  @override
  Future<Either<Failure, UserResponseEntity>> updateImage({
    required String filePath,
    required String fileName,
    required MediaType contentType,
    required String id,
  }) async {
    try {
      NetworkFormData body = NetworkFormData.fromMap({
        ApiParameterKeyName.file: await NetworkMultipartFile.fromFile(
          filePath,
          filename: fileName,
          contentType: contentType,
        ),
        ApiParameterKeyName.id: id,
      });
      final signUpRes = await _apiClient.updateImage(body);
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
        ApiParameterKeyName.userNameCamel: userName,
        ApiParameterKeyName.dateOfBirthCamel: dateOfBirth,
        ApiParameterKeyName.gender: gender,
        ApiParameterKeyName.email: email,
        ApiParameterKeyName.phoneNumberCamel: phoneNumber,
        ApiParameterKeyName.location: location,
      };
      final updateInformationsRes = await _apiClient.updateInformations(body);

      return right(UserResponseEntity.fromJson(updateInformationsRes));
    } catch (error) {
      error as NetworkDioException;

      String errorMessage =
          ErrorResponseEntity.fromJson(error.response?.data).msg;

      return left(Failure.message(message: errorMessage));
    }
  }
}
