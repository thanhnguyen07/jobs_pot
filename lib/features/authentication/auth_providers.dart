import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/application/auth_controller.dart';
import 'package:jobs_pot/features/authentication/application/splash_controller.dart';

final authStateListenable = ValueNotifier<bool?>(null);

final autheControllerProvider = Provider<AuthController>(
  (ref) => AuthController(ref),
);

final splashControllerProvider = StateNotifierProvider<SplashController, bool>(
  (ref) => SplashController(),
);
