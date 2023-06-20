import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/logger.dart';

class ApiInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final method = options.method;

    final uri = options.uri;

    final data = options.data;

    // final tokenDataStore = await AuthRepository().getTokenSharePerferences();

    if (!uri.path.contains("login")) {
      // options.headers['Authorization'] = 'Bearer ${tokenDataStore.token}';
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
        // apiLogger.log(
        //     "✈️ REQUEST[$method] => PATH: $uri \n Token: ${tokenDataStore?.token} \n DATA: ${jsonEncode(data)}",
        //     printFullText: true);
      } catch (e) {
        apiLogger.log("✈️ REQUEST[$method] => PATH: $uri \n DATA: $data",
            printFullText: true);
        // apiLogger.log(
        //     "✈️ REQUEST[$method] => PATH: $uri \n Token: ${tokenDataStore?.token} \n DATA: $data",
        //     printFullText: true);
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
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;
    final uri = err.requestOptions.path;
    var data = "";
    try {
      Fluttertoast.showToast(msg: err.response?.data["msg"]);

      data = jsonEncode(err.response.toString());
    } catch (e) {
      logger.e(e);
    }
    apiLogger.log("⚠️ ERROR[$statusCode] => PATH: $uri\n DATA: $data");
    super.onError(err, handler);
  }
}
