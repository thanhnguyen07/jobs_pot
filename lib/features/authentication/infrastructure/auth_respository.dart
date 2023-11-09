import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/database/local_storage.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/failures/failure.dart';
import 'package:jobs_pot/features/authentication/domain/repositories/auth_respository_interface.dart';
import 'package:jobs_pot/networks/api_client.dart';
import 'package:jobs_pot/networks/api_util.dart';

class AuthRepository implements AuthRepositoryInterface {
  late ApiClient _apiClient;

  AuthRepository() {
    _apiClient = ApiUtil().getApiClient();
  }

  @override
  Future saveToken(String token) {
    return LocalStorageHelper.saveToken(token);
  }

  @override
  Future saveBothToken(String token, String refreshToken) {
    return LocalStorageHelper.saveBothToken(token, refreshToken);
  }

  @override
  Future saveOnboadingStatus() {
    return LocalStorageHelper.saveOnboadingStatus();
  }

  @override
  Future saveRememberStatus() {
    return LocalStorageHelper.saveRememberStatus();
  }

  @override
  Future<String?> getToken() {
    return LocalStorageHelper.getToken();
  }

  @override
  Future<bool?> getOnboadingStatus() {
    return LocalStorageHelper.getOnboadingStatus();
  }

  @override
  Future<bool?> getRememberStatus() {
    return LocalStorageHelper.getRememberStatus();
  }

  @override
  Future removeToken() {
    return LocalStorageHelper.removeToken();
  }

  @override
  Future removeOnboadingStatus() {
    return LocalStorageHelper.removeOnboadingStatus();
  }

  @override
  Future removeRememberStatus() {
    return LocalStorageHelper.removeRememberStatus();
  }

  @override
  Future<Either<Failure, UserResponseEntity>> signUpWithEmail(
      String fullName, String tokenFirebase) async {
    try {
      final Map<String, String> body = {
        "user_name": fullName,
        "token_firebase": tokenFirebase,
      };

      final signUpRes = await _apiClient.signUpWithEmail(body);

      return right(UserResponseEntity.fromJson(signUpRes));
    } catch (error) {
      return left(const Failure.empty());
    }
  }

  @override
  Future<Either<Failure, UserResponseEntity>> getUserProfile() async {
    try {
      final userProfileResponse = await _apiClient.getUserProfile();

      return right(UserResponseEntity.fromJson(userProfileResponse));
    } catch (error) {
      return left(const Failure.empty());
    }
  }

  @override
  Future<Either<Failure, UserResponseEntity>> signInWithFirebase(
      String tokenFirebase) async {
    try {
      final Map<String, dynamic> body = {
        "token_firebase": tokenFirebase,
      };
      final signInWithGoogleRes = await _apiClient.signInWithFirebase(body);

      return right(UserResponseEntity.fromJson(signInWithGoogleRes));
    } catch (error) {
      return left(const Failure.empty());
    }
  }
}
