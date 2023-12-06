import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:network/src/network_dio.dart';

class ApiInterceptors extends InterceptorsWrapper {
  ApiInterceptors({
    this.getToken,
    this.handleError,
    this.requestResult,
    this.responseResult,
  });

  Function(NetworkDioException, NetworkErrorInterceptorHandler)? handleError;

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
      // if (!uri.path.contains("login")) {
      options.headers['Authorization'] = "Bearer $token";
      // }
    }

    if (requestResult != null) {
      requestResult!(
        method: method,
        uri: uri.toString(),
        token: token,
        data: data,
      );
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final statusCode = response.statusCode;
    final uri = response.requestOptions.uri;
    final data = jsonEncode(response.data);

    if (responseResult != null) {
      responseResult!(
        statusCode: statusCode,
        uri: uri.toString(),
        data: data,
      );
    }

    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (handleError != null) {
      handleError!(err as NetworkDioException,
          handler as NetworkErrorInterceptorHandler);
    }

    super.onError(err, handler);
  }
}
