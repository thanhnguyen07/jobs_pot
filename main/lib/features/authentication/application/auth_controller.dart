import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/routes/route_config.gr.dart';
import 'package:jobs_pot/routes/route_providers.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:models/entities/user/user_entity.dart';

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
      Utils.showToastGeneralError();
      return null;
    }
  }

  Future reloadFirebaseUser() async {
    try {
      final User? currenUser = FirebaseAuth.instance.currentUser;
      if (currenUser != null) {
        await currenUser.reload();
      } else {
        Utils.showToastGeneralError();
      }
    } on FirebaseAuthException catch (e) {
      Utils.handlerFirebaseError(e.code);
    }
  }

  Future onLogOut() async {
    await FirebaseAuth.instance.signOut().then(
      (value) {
        Utils.localStorage.remove.dataUser().then(
          (value) {
            ref.read(loginWithGoogleControllerProvider.notifier).disconnect();
            ref.read(loginWithFacebookControllerProvider.notifier).disconnect();
            ref.read(routeControllerProvider)!.replaceAll([const LoginRoute()]);
          },
        );
      },
    );
  }

  Future getUserProfile() async {
    Utils.showLoading();

    String? idUser = state?.id;

    if (idUser != null) {
      await ref.read(authRepositoryProvider).getUserProfile(idUser).then(
        (res) {
          Utils.hideLoading();

          return res.fold(
            (l) {
              Utils.showToastGeneralError();
            },
            (r) {
              setDataUser(r.results);
            },
          );
        },
      );
    } else {
      Utils.hideLoading();
      Utils.showToastGeneralError();
    }
  }
}
