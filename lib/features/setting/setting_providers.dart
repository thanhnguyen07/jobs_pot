import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/setting/application/account_controller.dart';
import 'package:jobs_pot/features/setting/application/add_password_controller.dart';
import 'package:jobs_pot/features/setting/application/change_password_controller.dart';
import 'package:jobs_pot/features/setting/application/setting_controller.dart';
import 'package:jobs_pot/features/setting/infrastructure/setting_respository.dart';

final settingRepositoryProvider = Provider<SettingRepository>(
  (ref) => SettingRepository(),
);

final settingControllerProvider =
    StateNotifierProvider<SettingController, dynamic>(
  (ref) => SettingController(ref),
);

final accountControllerProvider =
    StateNotifierProvider<AccountController, String?>(
  (ref) => AccountController(ref),
);

final changePasswordControllerProvider =
    StateNotifierProvider<ChangePasswordController, dynamic>(
  (ref) => ChangePasswordController(ref),
);

final addPasswordControllerProvider =
    StateNotifierProvider<AddPasswordController, dynamic>(
  (ref) => AddPasswordController(ref),
);
