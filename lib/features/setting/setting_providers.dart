import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/setting/application/setting_controller.dart';

final settingControllerProvider =
    StateNotifierProvider<SettingController, dynamic>(
  (ref) => SettingController(ref),
);
