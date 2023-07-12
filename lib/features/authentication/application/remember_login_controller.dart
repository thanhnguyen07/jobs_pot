import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';

class RememberLoginController extends StateNotifier<bool> {
  RememberLoginController(this.ref) : super(true);

  final Ref ref;

  void changeStatus() {
    state = !state;
    if (state) {
      ref.read(authRepositoryProvider).saveRememberStatus();
    } else {
      ref.read(authRepositoryProvider).removeRememberStatus();
    }
  }
}
