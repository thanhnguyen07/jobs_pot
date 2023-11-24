import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/routes/route_config.gr.dart';
import 'package:jobs_pot/system/system_providers.dart';

class LoginWithFacebookController extends StateNotifier {
  LoginWithFacebookController(this.ref) : super(null);

  final Ref ref;

  Future signInWithFacebook(BuildContext context) async {
    ref.read(systemControllerProvider.notifier).showLoading();
    await FacebookAuth.instance.login().then((value) async {
      final AccessToken? accessToken = value.accessToken;

      if (accessToken != null) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(accessToken.token);
        if (context.mounted) {
          await signIn(facebookAuthCredential, context);
        }
      }
    });
    ref.read(systemControllerProvider.notifier).hideLoading();
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
                  (l) {},
                  (r) {
                    ref
                        .read(authControllerProvider.notifier)
                        .setDataUser(r.results);
                    ref
                        .read(authRepositoryProvider)
                        .saveDataUser(r.token, r.refreshToken, r.results.id)
                        .then((value) {
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
