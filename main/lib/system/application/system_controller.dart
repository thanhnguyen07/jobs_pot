import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/config/app_configs.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:logger/logger.dart';
import 'package:network/network.dart';

class SystemController extends StateNotifier {
  final Ref ref;

  SystemController(this.ref) : super(null);

  ApiClient getAppApiClient() {
    return ApiUtil().getApiClient(
      handlerError: handlerDioException,
      baseUrl: AppConfigs.baseUrl,
      getToken: _getToken,
      requestResult: _requestResult,
      responseResult: _responseResult,
    );
  }

  Future<String?> _getToken() {
    return Utils.localStorage.get.token();
  }

  void _requestResult({
    required String method,
    required String uri,
    dynamic token,
    dynamic data,
  }) {
    MyLogger.apiRequest(
      method: method,
      uri: uri.toString(),
      token: token,
      data: data,
    );
  }

  void _responseResult({
    int? statusCode,
    required String uri,
    dynamic data,
  }) {
    MyLogger.apiResponse(
      statusCode: statusCode,
      uri: uri.toString(),
      data: data,
    );
  }

  Future handlerDioException(
      NetworkDioException error, NetworkErrorInterceptorHandler handler) async {
    final statusCode = error.response?.statusCode;

    handleShowError(error);

    if (statusCode == 401) {
      final bool refreshTokenRes = await refreshToken();

      if (refreshTokenRes) {
        final cloneReq = await ApiUtil().getDio().fetch(error.requestOptions);
        return handler.resolve(cloneReq);
      } else {
        Utils.showToastGeneralError();
        ref.read(authControllerProvider.notifier).onLogOut();
      }
    }
    if (statusCode == 403) {
      Utils.showToastGeneralError();
      ref.read(authControllerProvider.notifier).onLogOut();
    }
  }

  void handleShowError(NetworkDioException error) {
    final statusCode = error.response?.statusCode;

    final uri = error.requestOptions.path;

    String? data;

    if (error.response != null) {
      try {
        if (statusCode != 401) {
          final res = error.response?.data;
          Utils.showToastMessage(res!["msg"]);
        }

        data = jsonEncode(error.response.toString());
      } catch (e) {
        MyLogger.debugLog(e);
      }
    }
    if (error.error != null) {
      final newErr = error.error as SocketException;

      Utils.showToastMessage(newErr.message);
    }

    MyLogger.apiError(statusCode: statusCode, uri: uri, data: data);
  }

  Future<bool> refreshToken() async {
    String? refreshToken = await Utils.localStorage.get.refreshToken();
    if (refreshToken != null) {
      final refreshTokenRes =
          await ref.read(systemRepositoryProvider).refreshToken(refreshToken);

      return refreshTokenRes.fold((l) {
        return false;
      }, (r) async {
        await Utils.localStorage.save.dataUser(r.token, r.refreshToken);
        return true;
      });
    } else {
      return false;
    }
  }
}
