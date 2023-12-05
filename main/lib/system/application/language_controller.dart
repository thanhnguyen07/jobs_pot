import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/config/app_configs.dart';
import 'package:jobs_pot/utils/utils.dart';

class LanguageController extends StateNotifier<bool> {
  LanguageController() : super(true);

  void changeLanguege(BuildContext context) async {
    if (Localizations.localeOf(context) == AppConfigs.appLanguageEn) {
      context.setLocale(AppConfigs.appLanguageVi);

      await Utils.localStorage.save
          .defaultLanguage(AppConfigs.appLanguageVi.toString());

      await FirebaseAuth.instance
          .setLanguageCode(AppConfigs.appLanguageVi.toString());

      state = !state;
    } else {
      context.setLocale(AppConfigs.appLanguageEn);

      await Utils.localStorage.save
          .defaultLanguage(AppConfigs.appLanguageEn.toString());

      await FirebaseAuth.instance
          .setLanguageCode(AppConfigs.appLanguageEn.toString());

      state = !state;
    }
  }
}
