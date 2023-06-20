import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../config/app_configs.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConfigs.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  ///User
  @POST("user/signup")
  Future<dynamic> signUpWithEmail(@Body() Map<String, dynamic> body);

  @POST("user/signin")
  Future<dynamic> signInWithEmail(@Body() Map<String, dynamic> body);
}
