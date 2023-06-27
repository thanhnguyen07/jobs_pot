import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/infrastructure/auth_respository.dart';
import 'package:jobs_pot/main.dart';
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
    final statusCode = err.response?.statusCode;
    final uri = err.requestOptions.path;
    var data = "";
    try {
      data = jsonEncode(err.response.toString());
    } catch (e) {
      logger.e(e);
    }

    apiLogger.log("⚠️ ERROR[$statusCode] => PATH: $uri\n DATA: $data");

    if (statusCode == 401) {
      final newToken =
          await appContainer.read(authControllerProvider).refreshToken();

      if (newToken != null) {
        err.requestOptions.headers['Authorization'] = 'Bearer $newToken';

        final opts = Options(
          method: err.requestOptions.method,
          headers: err.requestOptions.headers,
        );

        final cloneReq = await Dio().request(err.requestOptions.uri.toString(),
            options: opts,
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters);

        return handler.resolve(cloneReq);
      }
    }
    super.onError(err, handler);
  }
}
