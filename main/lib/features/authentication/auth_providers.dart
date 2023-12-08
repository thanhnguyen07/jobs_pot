import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/application/auth_controller.dart';
import 'package:jobs_pot/features/authentication/application/email_verification_controller.dart';
import 'package:jobs_pot/features/authentication/application/forgot_password_controller.dart';
import 'package:jobs_pot/features/authentication/application/login_with_email_controller.dart';
import 'package:jobs_pot/features/authentication/application/login_with_facebook.dart';
import 'package:jobs_pot/features/authentication/application/login_with_google_controller.dart';
import 'package:jobs_pot/features/authentication/application/onboarding_controller.dart';
import 'package:jobs_pot/features/authentication/application/remember_logIn_controller.dart';
import 'package:jobs_pot/features/authentication/application/sign_up_with_email_controller.dart';
import 'package:jobs_pot/features/authentication/application/splash_controller.dart';
import 'package:jobs_pot/features/authentication/domain/entities/User/user_entity.dart';
import 'package:jobs_pot/features/authentication/infrastructure/auth_respository.dart';

final authStateListenable = ValueNotifier<bool?>(null);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(),
);

final authControllerProvider =
    StateNotifierProvider<AuthController, UserEntity?>(
  (ref) => AuthController(ref),
);

final splashControllerProvider = StateNotifierProvider<SplashController, bool>(
  (ref) => SplashController(ref),
);

final onboardingController =
    AutoDisposeStateNotifierProvider<OnboardingController, dynamic>(
  (ref) => OnboardingController(ref),
);

final loginWithEmailControllerProvider =
    StateNotifierProvider<LoginWithEmailController, dynamic>(
  (ref) => LoginWithEmailController(ref),
);

final loginWithGoogleControllerProvider =
    StateNotifierProvider<LoginWithGoogleController, dynamic>(
  (ref) => LoginWithGoogleController(ref),
);
final loginWithFacebookControllerProvider =
    StateNotifierProvider<LoginWithFacebookController, dynamic>(
  (ref) => LoginWithFacebookController(ref),
);

final signUpWithEmailProvider =
    StateNotifierProvider<SignWithEmailController, dynamic>(
  (ref) => SignWithEmailController(ref),
);

final emailVerificationControllerProvider =
    StateNotifierProvider<EmailVerificationController, bool>(
  (ref) => EmailVerificationController(ref),
);

final rememberLoginController =
    StateNotifierProvider<RememberLoginController, bool>(
  (ref) => RememberLoginController(ref),
);

final forgotPasswordControllerProvider =
    StateNotifierProvider<ForgotPasswordController, int>(
  (ref) => ForgotPasswordController(ref),
);
