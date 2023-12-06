import 'package:dio/dio.dart';
import 'package:network/network.dart';
import 'api_interceptors.dart';

class ApiUtil {
  static Dio? _dio;

  ApiUtil._internal();

  static final ApiUtil _apiUtil = ApiUtil._internal();

  factory ApiUtil() {
    return _apiUtil;
  }

  Dio getDio({
    Function(NetworkDioException, NetworkErrorInterceptorHandler)? handleError,
    Future<String?> Function()? getToken,
    Function({
      String method,
      String uri,
      dynamic token,
      dynamic data,
    })? requestResult,
    Function({
      int? statusCode,
      String uri,
      dynamic data,
    })? responseResult,
  }) {
    if (_dio == null) {
      _dio = Dio();

      _dio!.options.connectTimeout = const Duration(seconds: 60);

      _dio!.interceptors.add(
        ApiInterceptors(
          handleError: handleError,
          getToken: getToken,
          requestResult: requestResult,
          responseResult: responseResult,
        ),
      );
    }
    return _dio!;
  }

  ApiClient getApiClient({
    void Function(NetworkDioException, NetworkErrorInterceptorHandler)?
        handlerError,
    required String baseUrl,
    Future<String?> Function()? getToken,
    Function({
      required String method,
      required String uri,
      dynamic token,
      dynamic data,
    })? requestResult,
    Function({
      int? statusCode,
      required String uri,
      dynamic data,
    })? responseResult,
  }) {
    final apiClient = ApiClient(
      getDio(
        handleError: handlerError,
        getToken: getToken,
      ),
      baseUrl: baseUrl,
    );

    return apiClient;
  }
}
