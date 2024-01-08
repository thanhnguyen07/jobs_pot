import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/common/constant/app_keys.dart';
import 'package:models/failures/failure.dart';
import 'package:models/entities/user_response/user_response_entity.dart';
import 'package:jobs_pot/features/setting/domain/repositories/setting_respository_interface.dart';
import 'package:jobs_pot/main.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:models/entities/error_response/error_response_entity.dart';
import 'package:network/network.dart';

class SettingRepository implements SettingRepositoryInterface {
  late ApiClient _apiClient;

  SettingRepository() {
    _apiClient =
        appProvider.read(apiControllerProvider.notifier).getAppApiClient();
  }

  @override
  Future<Either<Failure, UserResponseEntity>> accountLink(
      UserInfo providerData, String id) async {
    try {
      final Map<String, dynamic> body = {
        ApiParameterKeyName.providerDataSnake: {
          ApiParameterKeyName.displayNameCamel: providerData.displayName,
          ApiParameterKeyName.email: providerData.email,
          ApiParameterKeyName.phoneNumberCamel: providerData.phoneNumber,
          ApiParameterKeyName.photoURLCamel: providerData.photoURL,
          ApiParameterKeyName.providerIdSnake: providerData.providerId,
          ApiParameterKeyName.uid: providerData.uid,
        },
        ApiParameterKeyName.id: id,
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
        ApiParameterKeyName.providerIdSnake: providerId,
        ApiParameterKeyName.id: id,
      };

      final accountLinkRes = await _apiClient.accountUnLink(body);

      return right(UserResponseEntity.fromJson(accountLinkRes));
    } catch (error) {
      return left(const Failure.empty());
    }
  }

  @override
  Future<Either<Failure, ErrorResponseEntity>> deleteAccount(
      String tokenFirebase) async {
    try {
      final Map<String, dynamic> body = {
        ApiParameterKeyName.tokenFirebaseSnake: tokenFirebase,
      };

      final deleteAccountRes = await _apiClient.deleteAccount(body);

      return right(ErrorResponseEntity.fromJson(deleteAccountRes));
    } catch (error) {
      return left(const Failure.empty());
    }
  }
}
