import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/networks/api_util.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:logger/logger.dart';
import '../domain/entities/app_state_entity.dart';

class SystemController extends StateNotifier<AppStateEntity> {
  final Ref ref;

  SystemController(this.ref) : super(const AppStateEntity(message: ""));

  Future handlerDioException(
      DioException error, ErrorInterceptorHandler handler) async {
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

  void handleShowError(DioException error) {
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
