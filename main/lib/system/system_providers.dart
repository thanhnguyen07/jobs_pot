import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/system/application/language_controller.dart';
import 'package:jobs_pot/system/domain/infrastructure/system_respository.dart';
import 'application/system_controller.dart';
import 'domain/entities/app_state_entity.dart';

final systemControllerProvider =
    StateNotifierProvider<SystemController, AppStateEntity>(((ref) {
  return SystemController(ref);
}));

final languageControllerProvider =
    StateNotifierProvider<LanguageController, bool>(
  ((ref) => LanguageController()),
);

final systemRepositoryProvider = Provider<SytemRepository>(
  (ref) => SytemRepository(),
);
