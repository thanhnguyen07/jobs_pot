import 'package:flutter/material.dart';

class AppConfigs {
  static const String appName = 'Jobs Pot';

  ///DEV

  ///STAGING
  static const envName = "Staging";
  static const baseUrl = "server-jobs-pot.vercel.app";

  ///PRODUCTION

  ///Paging
  static const pageSize = 20;
  static const pageSizeMax = 1000;

  ///Locale Language
  static const appLanguageVi = Locale('vi');
  static const appLanguageEn = Locale('en');
  static const pathLanguage = 'lib/resources/i18n/langs';

  ///DateFormat

  static const dateAPIFormat = 'dd/MM/yyyy';
  static const dateDisplayFormat = 'dd/MM/yyyy';

  static const dateTimeAPIFormat =
      "MM/dd/yyyy'T'hh:mm:ss.SSSZ"; //Use DateTime.parse(date) instead of ...
  static const dateTimeDisplayFormat = 'dd/MM/yyyy HH:mm';

  ///Date range
  static final identityMinDate = DateTime(1900, 1, 1);
  static final identityMaxDate = DateTime.now();
  static final birthMinDate = DateTime(1900, 1, 1);
  static final birthMaxDate = DateTime.now();

  ///Max file
  static const maxAttachFile = 5;
}

class FirebaseConfig {
  //Todo
}

class DatabaseConfig {
  //Todo
  static const int version = 1;
}

class MovieAPIConfig {
  static const String apiKey = '26763d7bf2e94098192e629eb975dab0';
}

class UpGraderAPIConfig {
  static const String apiKey = '';
}
