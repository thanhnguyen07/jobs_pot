import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'application/system_controller.dart';
import 'domain/entities/app_state_entity.dart';

final systemControllerProvider =
    StateNotifierProvider<SystemController, AppStateEntity>(((ref) {
  return SystemController(ref);
}));
