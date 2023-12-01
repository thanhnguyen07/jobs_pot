import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/database/entities/error_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/failures/failure.dart';
import 'package:jobs_pot/features/setting/domain/repositories/setting_respository_interface.dart';
import 'package:jobs_pot/networks/api_client.dart';
import 'package:jobs_pot/networks/api_util.dart';

class SettingRepository implements SettingRepositoryInterface {
  late ApiClient _apiClient;

  SettingRepository() {
    _apiClient = ApiUtil().getApiClient();
  }

  @override
  Future<Either<Failure, UserResponseEntity>> accountLink(
      UserInfo providerData, String id) async {
    try {
      final Map<String, dynamic> body = {
        "provider_data": {
          "displayName": providerData.displayName,
          "email": providerData.email,
          "phoneNumber": providerData.phoneNumber,
          "photoURL": providerData.photoURL,
          "providerId": providerData.providerId,
          "uid": providerData.uid,
        },
        "id": id,
      };

      final accountLinkRes = await _apiClient.accountLink(body);

      return right(UserResponseEntity.fromJson(accountLinkRes));
    } catch (error) {
      return left(const Failure.empty());
    }
  }

  @override
  Future<Either<Failure, UserResponseEntity>> accountUnLink(
      String providerId, String id) async {
    try {
      final Map<String, dynamic> body = {
        "provider_id": providerId,
        "id": id,
      };

      final accountLinkRes = await _apiClient.accountUnLink(body);

      return right(UserResponseEntity.fromJson(accountLinkRes));
    } catch (error) {
      return left(const Failure.empty());
    }
  }

  @override
  Future<Either<Failure, ErrorResponseEntity>> deleteAccount(String id) async {
    try {
      final Map<String, dynamic> body = {
        "id": id,
      };

      final deleteAccountRes = await _apiClient.deleteAccount(body);

      return right(ErrorResponseEntity.fromJson(deleteAccountRes));
    } catch (error) {
      return left(const Failure.empty());
    }
  }
}
