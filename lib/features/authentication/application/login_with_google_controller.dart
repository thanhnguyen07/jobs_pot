import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';

class LoginWithGoogleController extends StateNotifier {
  LoginWithGoogleController(this.ref) : super(null);

  final Ref ref;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void loginWithGoogle() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        // print('User is currently signed out!');
      } else {
        // print('User is signed in!');
      }
    });
    // await FirebaseAuth.instance.signOut();
  }

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final String? idToken = await userCredential.user?.getIdToken();

    final String? uid = userCredential.user?.uid;

    if (idToken != null && uid != null) {
      final signInWithGoogleRes =
          await ref.read(authRepositoryProvider).signInWithGoogle(idToken, uid);
      signInWithGoogleRes.fold((l) {
        // print(l);
      }, (r) {
        // print(r);
      });
    }
  }
}
