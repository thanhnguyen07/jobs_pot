import 'package:flutter/material.dart';
import 'package:jobs_pot/flavors.dart';

class AppConfigs {
  static const localUrl = "http://localhost:7002/";
  static const productionUrl = "http://localhost:7002/";
  static String baseUrl = FLAVER.baseUrl;

  ///Locale Language
  static const appLanguageVi = Locale('vi');
  static const appLanguageEn = Locale('en');
  static const pathLanguage = 'lib/resources/i18n/langs';

  ///Phone Number code
  static const defaultCodePhoneNumber = "VN";
}
