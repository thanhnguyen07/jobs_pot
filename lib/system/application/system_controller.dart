import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/networks/api_util.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
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
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.purpleColor,
      timeInSecForIosWeb: 5,
    );
  }

  void showToastMessageWithLocaleKeys(String localeKeys) {
    showToastMessage(Utils.getLocaleMessage(localeKeys));
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
      case FirebaseKeys.accountExistsWithDifferentCredential:
        return showToastMessageWithLocaleKeys(
          LocaleKeys.authenticationSignUpError,
        );
      case FirebaseKeys.invalidLoginCredentials:
        return showToastMessageWithLocaleKeys(
          LocaleKeys.authenticationSignUpError4,
        );
      default:
        return showToastGeneralError();
    }
  }

  Future handlerDioException(
      DioException error, ErrorInterceptorHandler handler) async {
    final statusCode = error.response?.statusCode;

    final uri = error.requestOptions.path;

    var data = "";

    if (error.response != null) {
      try {
        if (statusCode != 401) {
          final res = error.response?.data;
          showToastMessage(res!["msg"]);
        }

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

    if (statusCode == 401) {
      final bool refreshTokenRes =
          await ref.read(authControllerProvider.notifier).refreshToken();

      if (refreshTokenRes) {
        final cloneReq = await ApiUtil().getDio().fetch(error.requestOptions);
        return handler.resolve(cloneReq);
      } else {
        ref.read(systemControllerProvider.notifier).showToastGeneralError();
        ref.read(authControllerProvider.notifier).onLogOut();
      }
    }
    if (statusCode == 403) {
      ref.read(systemControllerProvider.notifier).showToastGeneralError();
      ref.read(authControllerProvider.notifier).onLogOut();
    }
  }
}
