import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/application/auth_controller.dart';
import 'package:jobs_pot/features/authentication/application/remember_logIn_controller.dart';
import 'package:jobs_pot/features/authentication/application/sign_up_controller.dart';
import 'package:jobs_pot/features/authentication/application/splash_controller.dart';
import 'package:jobs_pot/features/authentication/infrastructure/auth_respository.dart';
import 'application/login_controller.dart';

final authStateListenable = ValueNotifier<bool?>(null);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(),
);

final authControllerProvider = Provider<AuthController>(
  (ref) => AuthController(),
);

final splashControllerProvider = StateNotifierProvider<SplashController, bool>(
  (ref) => SplashController(),
);

final loginControllerProvider = StateNotifierProvider<LoginController, dynamic>(
  (ref) => LoginController(ref),
);

final signUpControllerProvider =
    StateNotifierProvider<SignUpController, dynamic>(
  (ref) => SignUpController(ref),
);

final rememberLoginController = StateNotifierProvider<RememberLoginController, bool>(
  (ref) => RememberLoginController(),
);
