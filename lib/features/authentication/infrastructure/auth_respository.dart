import 'package:jobs_pot/database/local_storage.dart';
import 'package:jobs_pot/features/authentication/domain/entities/token_entity.dart';
import 'package:jobs_pot/features/authentication/domain/repositories/auth_respository_interface.dart';
import 'package:jobs_pot/networks/api_client.dart';
import 'package:jobs_pot/networks/api_util.dart';

class AuthRepository implements AuthRepositoryInterface {
  late ApiClient _apiClient;

  AuthRepository() {
    _apiClient = ApiUtil().getApiClient();
  }

  @override
  Future saveToken(TokenEntity token) {
    return LocalStorageHelper.saveToken(token);
  }

  @override
  Future saveRefreshToken(TokenEntity token) {
    return LocalStorageHelper.saveRefreshToken(token);
  }

  @override
  Future<TokenEntity?> getToken() {
    return LocalStorageHelper.getToken();
  }

  @override
  Future<TokenEntity?> getRefreshToken() {
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

  // @override
  // Future<Either<Failure, TokenEntity>> signinWithMail(
  //     String userName, String password) async {
  //   try {
  //     String credentials = "$userName:$password";

  //     Codec<String, String> stringToBase64 = utf8.fuse(base64);

  //     String encodedCredential = stringToBase64.encode(credentials);

  //     final tokenEntityResponse =
  //         await _apiClient.authLogin('Basic $encodedCredential', 't63esC9kE56');

  //     return right(TokenEntity.fromJson(tokenEntityResponse));
  //   } catch (error) {
  //     return left(Failure.message(message: error.toString()));
  //   }
  // }

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
