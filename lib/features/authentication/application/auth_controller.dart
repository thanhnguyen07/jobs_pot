import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';

class AuthController extends StateNotifier {
  AuthController(this._ref) : super(null) {
    // _init();
  }
  final Ref _ref;

  void updateAuthState(bool? value) {
    authStateListenable.value = value;
  }
}
