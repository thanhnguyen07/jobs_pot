import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_entity.dart';
import 'package:jobs_pot/routes/route_config.gr.dart';
import 'package:jobs_pot/routes/route_providers.dart';
import 'package:jobs_pot/system/system_providers.dart';

class AuthController extends StateNotifier<UserEntity?> {
  AuthController(this.ref) : super(null);

  final Ref ref;

  void setDataUser(UserEntity dataUser) {
    state = dataUser;
  }

  void updateAuthState(bool? value) {
    authStateListenable.value = value;
  }

  String getUserName() {
    return state?.userName ?? '';
  }

  User? getCurrentFirebaseUser() {
    final User? currenUser = FirebaseAuth.instance.currentUser;
    if (currenUser != null) {
      return currenUser;
    } else {
      ref.read(systemControllerProvider.notifier).showToastGeneralError();
      return null;
    }
  }

  Future reloadFirebaseUser() async {
    try {
      final User? currenUser = FirebaseAuth.instance.currentUser;
      if (currenUser != null) {
        await currenUser.reload();
      } else {
        ref.read(systemControllerProvider.notifier).showToastGeneralError();
      }
    } on FirebaseAuthException catch (e) {
      ref.read(systemControllerProvider.notifier).handlerFirebaseError(e.code);
    }
  }

  Future<bool> refreshToken() async {
    String? refreshToken =
        await ref.read(authRepositoryProvider).getRefreshToken();
    if (refreshToken != null) {
      final refreshTokenRes =
          await ref.read(authRepositoryProvider).refreshToken(refreshToken);

      return refreshTokenRes.fold((l) {
        return false;
      }, (r) async {
        await ref
            .read(authRepositoryProvider)
            .saveDataUser(r.token, r.refreshToken);
        return true;
      });
    } else {
      return false;
    }
  }

  Future onLogOut() async {
    await FirebaseAuth.instance.signOut().then(
      (value) {
        ref.read(authRepositoryProvider).removeDataUser().then(
          (value) {
            ref.read(loginWithGoogleControllerProvider.notifier).disconnect();
            ref.read(routeControllerProvider)!.replaceAll([const LoginRoute()]);
          },
        );
      },
    );
  }
}
