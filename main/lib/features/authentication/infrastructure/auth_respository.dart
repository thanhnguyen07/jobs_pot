import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/features/authentication/domain/entities/resfresh_token_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_response_entity.dart';
import 'package:jobs_pot/features/authentication/domain/entities/verification_code_entity.dart';
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
