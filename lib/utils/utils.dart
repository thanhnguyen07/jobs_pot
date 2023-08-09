import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jobs_pot/database/entities/error_response_entity.dart';
import 'package:jobs_pot/features/home/domain/entities/job_summary_entity.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';

class Utils {
  static String getLocaleMessage(String key) {
    return key.tr();
  }

  static String encryptPassword(String password) {
    final bytes = utf8.encode(password);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }

  static String converDateOfBirth(String date) {
    try {
      return DateFormat('dd MMMM yyyy')
          .format(DateTime.parse(date.toString()).toLocal());
    } catch (e) {
      EasyLoading.showToast(getLocaleMessage(LocaleKeys.generalError));
      return '';
    }
  }

  static String getErrorMessageResponse(error) {
    error as DioException;

    final dataError = ErrorResponseEntity.fromJson(error.response?.data);

    return dataError.msg;
  }

  static String getNumberOfJob(JobSummaryEntity? data) {
    if (data?.count != null) {
      return "${data!.count / 1000}k";
    }
    return '';
  }
}
