import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:jobs_pot/features/authentication/infrastructure/auth_respository.dart';
import 'package:jobs_pot/main.dart';
import 'package:jobs_pot/system/system_providers.dart';
import '../utils/logger.dart';

class ApiInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final method = options.method;

    final uri = options.uri;

    final data = options.data;

    final token = await AuthRepository().getToken();

    if (!uri.path.contains("login")) {
      options.headers['Authorization'] = "Bearer $token";
    }

    apiLogger.log(
        "\n\n--------------------------------------------------------------------------------------------------------");
    if (method == 'GET') {
      apiLogger.log(
          "✈️ REQUEST[$method] => PATH: $uri \n Token: ${options.headers}",
          printFullText: true);
    } else {
      try {
        apiLogger.log(
            "✈️ REQUEST[$method] => PATH: $uri \n Token: $token \n DATA: ${jsonEncode(data)}",
            printFullText: true);
      } catch (e) {
        apiLogger.log(
            "✈️ REQUEST[$method] => PATH: $uri \n Token: $token \n DATA: $data",
            printFullText: true);
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final statusCode = response.statusCode;
    final uri = response.requestOptions.uri;
    final data = jsonEncode(response.data);

    apiLogger.log(
        "\n\n--------------------------------------------------------------------------------------------------------");

    apiLogger.log("✅ RESPONSE[$statusCode] => PATH: $uri\n DATA: $data");

    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    appContainer
        .read(systemControllerProvider.notifier)
        .handlerDioException(err);

    super.onError(err, handler);
  }
}
