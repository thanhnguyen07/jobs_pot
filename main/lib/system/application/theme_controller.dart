import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/home/home_porvider.dart';
import 'package:jobs_pot/utils/utils.dart';

class ThemeController extends StateNotifier<ThemeMode> {
  ThemeController(this.ref) : super(ThemeMode.system);

  final Ref ref;

  late ColorScheme appColorScheme;

  void setColorScheme(ColorScheme colorScheme) {
    appColorScheme = colorScheme;
  }

  ColorScheme getColorScheme() {
    return appColorScheme;
  }

  Future initTheme() async {
    bool? darkModeStatus = await Utils.localStorage.get.darkMode();
    if (darkModeStatus != null) {
      darkModeStatus ? state = ThemeMode.dark : state = ThemeMode.light;
    } else {
      state = ThemeMode.system;
    }
  }

  void changeTheme(ThemeMode themeMode) async {
    if (state != themeMode) {
      state = themeMode;
      Future.delayed(const Duration(milliseconds: 300), () {
        ref.read(recentListController.notifier).reState();
      });
    }
    switch (themeMode) {
      case ThemeMode.dark:
        Utils.localStorage.save.darkMode(true);
      case ThemeMode.light:
        Utils.localStorage.save.darkMode(false);
      default:
        Utils.localStorage.remove.darkMode();
    }
  }
}
