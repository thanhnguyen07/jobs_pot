import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../config/app_configs.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConfigs.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  ///User
  @POST("user/signup-with-email")
  Future<dynamic> signUpWithEmail(@Body() Map<String, dynamic> body);

  @POST("user/update-avatar")
  Future<dynamic> updateAvatar(@Body() Map<String, dynamic> body);

  @GET("user/profile")
  Future<dynamic> getUserProfile();

  @GET("user/signin-with-google")
  Future<dynamic> signInWithGoogle();
}
