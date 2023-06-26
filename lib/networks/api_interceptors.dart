import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/config/app_configs.dart';
import 'package:jobs_pot/features/authentication/domain/failures/failure.dart';
import 'package:jobs_pot/features/authentication/infrastructure/auth_respository.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/login/login_screen.dart';
import 'package:jobs_pot/main.dart';
import '../utils/logger.dart';

class ApiInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final method = options.method;

    final uri = options.uri;

    final data = options.data;

    // final token = await AuthRepository().getToken();
    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRoYW5oamFuZ0BnbWFpbC5jb20iLCJwYXNzd29yZCI6IjEyN2I1MGRlNmQwMDU0YWIwMjcyOTE1MmQzYjEzMjU0NzgxNTk3MzQzMTQzYmYzNDFhNGIyMjMzMDFhMTRiOWMiLCJpYXQiOjE2ODc2ODc0NTEsImV4cCI6MTY4NzY5ODI1MX0.vDeUXgfqIB4WwRnOhEjWCDbrVNq7cst0NCM6xK7XdsE';

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
            "✈️ REQUEST[$method] => PATH: $uri \n DATA: ${jsonEncode(data)}",
            printFullText: true);
        apiLogger.log(
            "✈️ REQUEST[$method] => PATH: $uri \n Token: $token \n DATA: ${jsonEncode(data)}",
            printFullText: true);
      } catch (e) {
        apiLogger.log("✈️ REQUEST[$method] => PATH: $uri \n DATA: $data",
            printFullText: true);
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
    apiLogger.log("✅ RESPONSE[$statusCode] => PATH: $uri\n DATA: $data");
    //Handle section expired
    if (response.statusCode == 401) {
      //refreshtoken
    }
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;

    final uri = err.requestOptions.path;

    var data = "";

    if (statusCode == 401) {
      final Either<Failure, String> resRefreshToken =
          await AuthRepository().refreshToken();

      await resRefreshToken.fold((l) {
        appRouter.removeLast();

        appRouter.pushNamed(LoginScreen.path);
      }, (r) async {
        err.requestOptions.headers['Authorization'] = 'Bearer $r';

        final opts = Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers);

        final cloneReq = await Dio().request(
            "${AppConfigs.baseUrl}${err.requestOptions.path}",
            options: opts,
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters);

        return handler.resolve(cloneReq);
      });
    }
    try {
      data = jsonEncode(err.response.toString());
    } catch (e) {
      logger.e(e);
    }

    apiLogger.log("⚠️ ERROR[$statusCode] => PATH: $uri\n DATA: $data");

    super.onError(err, handler);
  }
}
