import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/routes/route_config.gr.dart';
import 'package:jobs_pot/system/system_providers.dart';

class LoginWithGoogleController extends StateNotifier {
  LoginWithGoogleController(this.ref) : super(null);

  final Ref ref;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> disconnect() async {
    _googleSignIn.disconnect();
    await FacebookAuth.instance.logOut();
  }

  Future signInWithGoogle(BuildContext context) async {
    ref.read(systemControllerProvider.notifier).showLoading();
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final String providerId = credential.providerId;
      final String email = googleUser.email;

      bool check = await checkAccount(providerId, email);
      if (check) {
        if (context.mounted) {
          await signIn(credential, context);
        }
      } else {
        ref.read(systemControllerProvider.notifier).handlerFirebaseError(
            FirebaseKeys.accountExistsWithDifferentCredential);
      }
    }
    ref.read(systemControllerProvider.notifier).hideLoading();
  }

  Future<bool> checkAccount(String providerId, String email) async {
    final checkAccountRes =
        await ref.read(authRepositoryProvider).checkAccount(providerId, email);

    return checkAccountRes.fold((l) => false, (r) => true);
  }

  Future signIn(OAuthCredential credential, BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential).then(
        (userCredential) async {
          final String? tokenFirebase = await userCredential.user?.getIdToken();

          if (tokenFirebase != null) {
            await ref
                .read(authRepositoryProvider)
                .signInWithFirebase(tokenFirebase)
                .then(
              (res) {
                res.fold(
                  (l) {
                    ref
                        .read(systemControllerProvider.notifier)
                        .showToastGeneralError();
                  },
                  (r) async {
                    ref
                        .read(authControllerProvider.notifier)
                        .setDataUser(r.results);
                    await ref
                        .read(authRepositoryProvider)
                        .saveDataUser(r.token, r.refreshToken, r.results.id)
                        .then((value) async {
                      context.router.replaceAll([const HomeStackRoute()]);
                    });
                  },
                );
              },
            );
          }
        },
      );
    } on FirebaseAuthException catch (e) {
      ref.read(systemControllerProvider.notifier).handlerFirebaseError(e.code);
    }
  }
}
