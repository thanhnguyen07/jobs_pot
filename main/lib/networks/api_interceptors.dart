import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:jobs_pot/main.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:logger/logger.dart';

class ApiInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final method = options.method;

    final uri = options.uri;

    final data = options.data;

    final token = await Utils.localStorage.get.token();

    // if (!uri.path.contains("login")) {
    options.headers['Authorization'] = "Bearer $token";
    // }

    MyLogger.apiRequest(
      method: method,
      uri: uri.toString(),
      token: token,
      data: data,
    );

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final statusCode = response.statusCode;
    final uri = response.requestOptions.uri;
    final data = jsonEncode(response.data);
    MyLogger.apiResponse(
      statusCode: statusCode,
      uri: uri.toString(),
      data: data,
    );

    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    await appContainer
        .read(systemControllerProvider.notifier)
        .handlerDioException(err, handler);

    super.onError(err, handler);
  }
}
