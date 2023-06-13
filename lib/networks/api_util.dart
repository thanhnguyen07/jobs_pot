import 'package:dio/dio.dart';

import '../config/app_configs.dart';
import 'api_client.dart';
import 'api_interceptors.dart';

class ApiUtil {
  static Dio? dio;

  ApiUtil._internal();

  static final ApiUtil _apiUtil = ApiUtil._internal();

  factory ApiUtil() {
    return _apiUtil;
  }

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      dio!.options.connectTimeout = const Duration(seconds: 60);
      dio!.interceptors.add(ApiInterceptors());
    }
    return dio!;
  }

  ApiClient getApiClient() {
    final apiClient = ApiClient(getDio(), baseUrl: AppConfigs.baseUrl);
    return apiClient;
  }
}
