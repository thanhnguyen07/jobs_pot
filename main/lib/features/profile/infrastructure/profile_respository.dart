import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http_parser/http_parser.dart';
import 'package:jobs_pot/common/constant/app_keys.dart';
import 'package:models/failures/failure.dart';
import 'package:models/entities/export.dart';
import 'package:jobs_pot/features/profile/domain/repositories/profile_responsitory_interface.dart';
import 'package:jobs_pot/main.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:network/network.dart';

class ProfileResponsitory implements ProfileResponsitoryInterface {
  late ApiClient _apiClient;

  ProfileResponsitory() {
    _apiClient =
        appProvider.read(apiControllerProvider.notifier).getAppApiClient();
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
    required String userId,
    required Map? phoneNumber,
    required String? location,
  }) async {
    try {
      final Map<String, dynamic> body = {
        ApiParameterKeyName.userNameCamel: userName,
        ApiParameterKeyName.dateOfBirthCamel: dateOfBirth,
        ApiParameterKeyName.gender: gender,
        ApiParameterKeyName.id: userId,
        ApiParameterKeyName.phoneNumberCamel: phoneNumber,
        ApiParameterKeyName.location: location,
      };
      final updateInformationsRes = await _apiClient.updateInformations(body);

      return right(UserResponseEntity.fromJson(updateInformationsRes));
    } catch (error) {
      error as DioException;

      String errorMessage =
          ErrorResponseEntity.fromJson(error.response?.data).msg;

      return left(Failure.message(message: errorMessage));
    }
  }
}
