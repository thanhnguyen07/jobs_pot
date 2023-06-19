import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../config/app_configs.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConfigs.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  ///User
  @POST("user/login")
  Future<dynamic> signUpWithEmail(@Header("Authorization") String username,
      @Header("Fltoken") String token);
}
