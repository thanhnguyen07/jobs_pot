import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http_parser/http_parser.dart';
import 'package:jobs_pot/common/app_keys.dart';
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
  Future<Either<Failure, UserResponseEntity>> updateImage({
    required String filePath,
    required String fileName,
    required MediaType contentType,
    required String id,
  }) async {
    try {
      FormData body = FormData.fromMap({
        ApiParameterKeyName.file: await MultipartFile.fromFile(
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
      String errorMessage = Utils.getErrorMessageResponse(error);

      return left(Failure.message(message: errorMessage));
    }
  }
}
