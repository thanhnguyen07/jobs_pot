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

  @POST("user/update-informations")
  Future<dynamic> updateInformations(@Body() Map<String, dynamic> body);

  @GET("user/profile")
  Future<dynamic> getUserProfile();

  @POST("user/signin-with-firebase")
  Future<dynamic> signInWithFirebase(@Body() Map<String, dynamic> body);

  @GET("job/summary")
  Future<dynamic> getJobsSummary();
}
