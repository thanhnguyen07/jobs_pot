import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/system/system_providers.dart';

class LoginWithGoogleController extends StateNotifier {
  LoginWithGoogleController(this.ref) : super(null);

  final Ref ref;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential).then(
        (userCredential) async {
          final String? idToken = await userCredential.user?.getIdToken();

          if (idToken != null) {
            ref.read(authRepositoryProvider).saveToken(idToken).then(
              (value) async {
                await ref.read(authRepositoryProvider).signInWithGoogle().then(
                  (res) {
                    res.fold(
                      (l) {},
                      (r) {
                        ref
                            .read(authControllerProvider.notifier)
                            .setDataUser(r.results);
                      },
                    );
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
