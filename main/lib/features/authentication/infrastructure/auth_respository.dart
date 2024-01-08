import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/common/constant/app_keys.dart';
import 'package:models/failures/failure.dart';
import 'package:jobs_pot/features/authentication/domain/repositories/auth_respository_interface.dart';
import 'package:jobs_pot/main.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:models/entities/refresh_token_response/resfresh_token_response_entity.dart';
import 'package:models/entities/user_response/user_response_entity.dart';
import 'package:models/entities/verification_code/verification_code_entity.dart';
import 'package:network/network.dart';

class AuthRepository implements AuthRepositoryInterface {
  late ApiClient _apiClient;

  AuthRepository() {
    _apiClient =
        appProvider.read(apiControllerProvider.notifier).getAppApiClient();
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
  Future<Either<Failure, UserResponseEntity>> getUserProfile(String id) async {
    try {
      final userProfileResponse = await _apiClient.getUserProfile(id);

      UserResponseEntity userDataResponse =
          UserResponseEntity.fromJson(userProfileResponse);

      String? token = userDataResponse.token;
      String? refreshToken = userDataResponse.refreshToken;

      if (token != null && refreshToken != null) {
        Utils.localStorage.save.dataUser(userDataResponse.token,
            userDataResponse.refreshToken, userDataResponse.results.id);
      }

      return right(userDataResponse);
    } catch (error) {
      return left(const Failure.empty());
    }
  }

  @override
  Future<Either<Failure, UserResponseEntity>> signInWithFirebase(
      String tokenFirebase) async {
    try {
      final Map<String, dynamic> body = {
        ApiParameterKeyName.tokenFirebaseSnake: tokenFirebase,
      };
      final signInWithGoogleRes = await _apiClient.signInWithFirebase(body);

      return right(UserResponseEntity.fromJson(signInWithGoogleRes));
    } catch (error) {
      return left(const Failure.empty());
    }
  }

  @override
  Future<Either<Failure, VerificationCodeEntity>> sendVerificationCode(
      String email) async {
    try {
      final Map<String, dynamic> body = {
        ApiParameterKeyName.email: email,
      };
      final sendVerificationCodeRes =
          await _apiClient.sendVerificationCode(body);

      return right(VerificationCodeEntity.fromJson(sendVerificationCodeRes));
    } catch (error) {
      return left(const Failure.empty());
    }
  }

  @override
  Future<Either<Failure, VerificationCodeEntity>> sendVerifyCode(
      String code) async {
    try {
      final Map<String, dynamic> body = {
        ApiParameterKeyName.code: code,
      };
      final sendVerificationCodeRes = await _apiClient.sendVerifyCode(body);

      return right(VerificationCodeEntity.fromJson(sendVerificationCodeRes));
    } catch (error) {
      return left(const Failure.empty());
    }
  }

  @override
  Future<Either<Failure, RefreshTokenResponseEntity>> checkAccount(
      String providerId, String email) async {
    try {
      final Map<String, dynamic> body = {
        ApiParameterKeyName.providerIdSnake: providerId,
        ApiParameterKeyName.email: email,
      };
      final refreshTokenRes = await _apiClient.checkAccount(body);

      return right(RefreshTokenResponseEntity.fromJson(refreshTokenRes));
    } catch (error) {
      return left(const Failure.empty());
    }
  }
}
