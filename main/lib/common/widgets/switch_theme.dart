import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_icons.dart';
import 'package:jobs_pot/system/system_providers.dart';

class SwitchThemeMode extends ConsumerStatefulWidget {
  const SwitchThemeMode({Key? key}) : super(key: null);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SwitchThemeModeState();
}

class _SwitchThemeModeState extends ConsumerState<SwitchThemeMode> {
  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = ref.watch(themeControllerProvider);

    Color colorBuilder() {
      if (themeMode == ThemeMode.dark) {
        return Theme.of(context).colorScheme.secondary.withOpacity(0.5);
      } else {
        return Theme.of(context).colorScheme.primary.withOpacity(0.5);
      }
    }

    Color colorIconBuilder() {
      switch (themeMode) {
        case ThemeMode.dark:
          return Theme.of(context).colorScheme.secondary;
        case ThemeMode.light:
          return Theme.of(context).colorScheme.primary;
        default:
          return AppColors.white;
      }
    }

    Widget coloredRollingIconBuilder(int value, bool foreground) {
      return switch (value) {
        0 => Image.asset(
            AppPngIcons.sun,
            width: 25,
            height: 25,
          ),
        1 => Image.asset(
            AppPngIcons.moon,
            width: 25,
            height: 25,
          ),
        _ => Image.asset(
            AppPngIcons.system,
            width: 25,
            height: 25,
          )
      };
    }

    void changeMode(int value) {
      switch (value) {
        case 0:
          return ref
              .read(themeControllerProvider.notifier)
              .changeTheme(ThemeMode.light);
        case 1:
          return ref
              .read(themeControllerProvider.notifier)
              .changeTheme(ThemeMode.dark);
        case _:
          return ref
              .read(themeControllerProvider.notifier)
              .changeTheme(ThemeMode.system);
      }
    }

    int getIndex(ThemeMode themeMode) {
      return switch (themeMode) {
        ThemeMode.light => 0,
        ThemeMode.dark => 1,
        _ => 2,
      };
    }

    return IconTheme.merge(
      data: const IconThemeData(color: AppColors.white),
      child: AnimatedToggleSwitch<int>.rolling(
        current: getIndex(themeMode),
        values: const [0, 1, 2],
        onChanged: (i) => changeMode(i),
        style: ToggleStyle(
          indicatorColor: colorIconBuilder(),
          borderColor: Colors.transparent,
        ),
        animationDuration: const Duration(milliseconds: 700),
        indicatorIconScale: sqrt2,
        iconBuilder: coloredRollingIconBuilder,
        borderWidth: 3.0,
        styleAnimationType: AnimationType.onHover,
        styleBuilder: (value) => ToggleStyle(
          backgroundColor: colorBuilder(),
          // borderRadius: BorderRadius.circular(value * 10.0),
          // indicatorBorderRadius: BorderRadius.circular(value * 10.0),
        ),
      ),
    );
  }
}
