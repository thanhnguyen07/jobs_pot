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
  Future saveToken(String token) {
    return LocalStorageHelper.saveToken(token);
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
      String fullName) async {
    try {
      final Map<String, String> body = {
        "fullName": fullName,
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
  Future<Either<Failure, UserResponseEntity>> signInWithGoogle() async {
    try {
      final signInWithGoogleRes = await _apiClient.signInWithGoogle();

      return right(UserResponseEntity.fromJson(signInWithGoogleRes));
    } catch (error) {
      if (error is DioException) {
        final resError = ErrorResponseEntity.fromJson(error.response?.data);

        return left(Failure.message(message: resError.msg));
      }
      return left(Failure.message(message: error.toString()));
    }
  }
}
