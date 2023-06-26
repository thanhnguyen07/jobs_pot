import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/database/entities/error_response_entity.dart';
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
  Future saveBothToken(String token, String refreshToken) {
    return LocalStorageHelper.saveBothToken(token, refreshToken);
  }

  @override
  Future saveToken(String token) {
    return LocalStorageHelper.saveToken(token);
  }

  @override
  Future saveRefreshToken(String token) {
    return LocalStorageHelper.saveRefreshToken(token);
  }

  @override
  Future saveOnboadingStatus() {
    return LocalStorageHelper.saveOnboadingStatus();
  }

  @override
  Future<String?> getToken() {
    return LocalStorageHelper.getToken();
  }

  @override
  Future<String?> getRefreshToken() {
    return LocalStorageHelper.getRefreshToken();
  }

  @override
  Future<bool?> getOnboadingStatus() {
    return LocalStorageHelper.getOnboadingStatus();
  }

  @override
  Future removeBothToken() {
    return LocalStorageHelper.removeBothToken();
  }

  @override
  Future removeToken() {
    return LocalStorageHelper.removeToken();
  }

  @override
  Future removeRefreshToken() {
    return LocalStorageHelper.removeRefreshToken();
  }

  @override
  Future removeOnboadingStatus() {
    return LocalStorageHelper.removeOnboadingStatus();
  }

  @override
  Future<Either<Failure, UserResponseEntity>> signUpWithEmail(
      String fullName, String email, String password) async {
    try {
      final Map<String, String> body = {
        "userName": fullName,
        "email": email,
        "password": password
      };
      final signUpRes = await _apiClient.signUpWithEmail(body);

      return right(UserResponseEntity.fromJson(signUpRes));
    } catch (error) {
      if (error is DioException) {
        final resError = ErrorResponseEntity.fromJson(error.response?.data);

        return left(Failure.message(message: resError.msg));
      }
      return left(Failure.message(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, UserResponseEntity>> signInWithEmail(
      String email, String password) async {
    try {
      final Map<String, String> body = {"email": email, "password": password};
      final signUpRes = await _apiClient.signInWithEmail(body);

      return right(UserResponseEntity.fromJson(signUpRes));
    } catch (error) {
      if (error is DioException) {
        final resError = ErrorResponseEntity.fromJson(error.response?.data);

        return left(Failure.message(message: resError.msg));
      }
      return left(Failure.message(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, UserResponseEntity>> getUserProfile() async {
    try {
      final userProfileResponse = await _apiClient.getUserProfile();

      return right(UserResponseEntity.fromJson(userProfileResponse));
    } catch (error) {
      if (error is DioException) {
        final resError = ErrorResponseEntity.fromJson(error.response?.data);

        return left(Failure.message(message: resError.msg));
      }
      return left(Failure.message(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> refreshToken() async {
    try {
      final String? refreshToken = await getRefreshToken();

      final Map<String, String?> body = {"refreshToken": refreshToken};

      final userProfileResponse = await _apiClient.refreshToken(body);

      final dataRes = UserResponseEntity.fromJson(userProfileResponse);

      await saveBothToken(dataRes.token, dataRes.refreshToken);

      return right(dataRes.token);
    } catch (error) {
      return left(const Failure.message(
          message: "An error occurred. Please login again!!!"));
    }
  }
}
