import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/config/app_configs.dart';

class LanguageController extends StateNotifier<bool> {
  LanguageController() : super(true);

  void changeLanguege(BuildContext context) {
    if (Localizations.localeOf(context) == AppConfigs.appLanguageEn) {
      context.setLocale(AppConfigs.appLanguageVi);
      state = !state;
    } else {
      context.setLocale(AppConfigs.appLanguageEn);
      state = !state;
    }
  }
}
