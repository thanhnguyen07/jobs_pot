import 'package:fluttertoast/fluttertoast.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/database/local_storage.dart';
import 'package:jobs_pot/features/authentication/domain/entities/token_entity.dart';
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
  Future saveRefreshToken(String token) {
    return LocalStorageHelper.saveRefreshToken(token);
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
  Future removeToken() {
    return LocalStorageHelper.removeToken();
  }

  @override
  Future removeRefreshToken() {
    return LocalStorageHelper.removeRefreshToken();
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
      return left(Failure.message(message: error.toString()));
    }
  }

  // @override
  // Future<Either<Failure, UserResponseEntity>> getUserProfile() async {
  //   try {
  //     final userProfileResponse = await _apiClient.getUserProfile();
  //     final user = UserResponseEntity.fromJson(userProfileResponse);
  //     return right(user);
  //   } catch (error) {
  //     return left(Failure.message(message: error.toString()));
  //   }
  // }
}
