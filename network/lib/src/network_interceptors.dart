import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ApiInterceptors extends InterceptorsWrapper {
  ApiInterceptors({
    this.getToken,
    this.handleError,
    this.requestResult,
    this.responseResult,
  });

  Function(DioException, ErrorInterceptorHandler)? handleError;

  Future<String?> Function()? getToken;

  Function({
    String method,
    String uri,
    dynamic token,
    dynamic data,
  })? requestResult;

  Function({
    int? statusCode,
    String uri,
    dynamic data,
  })? responseResult;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final method = options.method;

    final uri = options.uri;

    final data = options.data;

    String? token;

    if (getToken != null) {
      token = await getToken!();
      options.headers['Authorization'] = "Bearer $token";
    }

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
    if (handleError != null) {
      await handleError!(err, handler);
    }

    super.onError(err, handler);
  }
}
