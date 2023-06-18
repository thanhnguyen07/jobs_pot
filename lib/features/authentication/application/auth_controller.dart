import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';

class AuthController extends StateNotifier {
  AuthController() : super(null) {
    // _init();
  }

  void updateAuthState(bool? value) {
    authStateListenable.value = value;
  }
}
