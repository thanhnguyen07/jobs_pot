import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/logger.dart';
import 'package:jobs_pot/utils/utils.dart';
import '../domain/entities/app_state_entity.dart';

class SystemController extends StateNotifier<AppStateEntity> {
  final Ref ref;

  SystemController(this.ref) : super(const AppStateEntity(message: ""));

  void showLoading() {
    EasyLoading.show();
  }

  void hideLoading() {
    EasyLoading.dismiss();
  }

  void showToastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  void showToastMessageWithLocaleKeys(String localeKeys) {
    Fluttertoast.showToast(msg: Utils.getLocaleMessage(localeKeys));
  }

  void showToastGeneralError() {
    showToastMessageWithLocaleKeys(LocaleKeys.generalError);
  }

  void handlerFirebaseError(String errorCode) {
    switch (errorCode) {
      case FirebaseKeys.userNotFound:
        return showToastMessageWithLocaleKeys(
          LocaleKeys.authenticationSignUpError3,
        );
      case FirebaseKeys.wrongPassword:
        return showToastMessageWithLocaleKeys(
          LocaleKeys.authenticationSignUpError4,
        );
      case FirebaseKeys.tooManyRequests:
        return showToastMessageWithLocaleKeys(
          LocaleKeys.authenticationSignUpError5,
        );
      case FirebaseKeys.emailAlreadyInUse:
        return showToastMessageWithLocaleKeys(
          LocaleKeys.authenticationSignUpError,
        );
      default:
        return showToastGeneralError();
    }
  }

  void handlerDioException(DioException error) {
    final statusCode = error.response?.statusCode;

    final uri = error.requestOptions.path;

    var data = "";

    if (error.response != null) {
      try {
        data = jsonEncode(error.response.toString());
      } catch (e) {
        logger.e(e);
      }
    }
    if (error.error != null) {
      final newErr = error.error as SocketException;

      showToastMessage(newErr.message);
    }

    apiLogger.log("⚠️ ERROR[$statusCode] => PATH: $uri\n DATA: $data");

    // if (statusCode == 401) {
    // final newToken =
    //     await appContainer.read(authControllerProvider).refreshToken();

    // if (newToken != null) {
    //   err.requestOptions.headers['Authorization'] = 'Bearer $newToken';

    //   final opts = Options(
    //     method: err.requestOptions.method,
    //     headers: err.requestOptions.headers,
    //   );

    //   final cloneReq = await ApiUtil().getDio().request(
    //       err.requestOptions.uri.toString(),
    //       options: opts,
    //       data: err.requestOptions.data,
    //       queryParameters: err.requestOptions.queryParameters);

    //   return handler.resolve(cloneReq);
    // }
    // }
  }
}
