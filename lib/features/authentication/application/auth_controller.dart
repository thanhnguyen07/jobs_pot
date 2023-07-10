import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/system/system_providers.dart';

class AuthController extends StateNotifier {
  AuthController(this.ref) : super(null);

  final Ref ref;

  void updateAuthState(bool? value) {
    authStateListenable.value = value;
  }

  User? getCurrentUser() {
    final User? currenUser = FirebaseAuth.instance.currentUser;
    if (currenUser != null) {
      return currenUser;
    } else {
      ref.read(systemControllerProvider.notifier).showToastGeneralError();
      return null;
    }
  }
}
