import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../config/app_configs.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConfigs.defaultUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("user/check-account")
  Future<dynamic> checkAccount(@Body() Map<String, dynamic> body);

  @POST("user/signup-with-email")
  Future<dynamic> signUpWithEmail(@Body() Map<String, dynamic> body);

  @POST("user/signin-with-firebase")
  Future<dynamic> signInWithFirebase(@Body() Map<String, dynamic> body);

  @POST("user/send-verification-code")
  Future<dynamic> sendVerificationCode(@Body() Map<String, dynamic> body);

  @PUT("user/verify-code")
  Future<dynamic> sendVerifyCode(@Body() Map<String, dynamic> body);

  @GET("user/profile")
  Future<dynamic> getUserProfile(@Query("id") String id);

  @PUT("user/update-image")
  Future<dynamic> updateImage(@Body() Map<String, dynamic> body);

  @POST("user/update-informations")
  Future<dynamic> updateInformations(@Body() Map<String, dynamic> body);

  @POST("user/refresh-token")
  Future<dynamic> refreshToken(@Body() Map<String, dynamic> body);

  @GET("job/summary")
  Future<dynamic> getJobsSummary();
}
