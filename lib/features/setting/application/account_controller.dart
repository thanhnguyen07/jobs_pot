import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_entity.dart';
import 'package:jobs_pot/features/setting/setting_providers.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';

class AccountController extends StateNotifier {
  AccountController(this._ref) : super(null);
  final Ref _ref;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> disconnect() async {
    await _googleSignIn.disconnect();
  }

  Future<void> facebookLink() async {
    _ref.read(systemControllerProvider.notifier).showLoading();

    UserEntity? userData = _ref.read(authControllerProvider);

    final LoginResult result = await FacebookAuth.instance.login();

    final AccessToken? accessToken = result.accessToken;

    if (accessToken != null && userData != null) {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(accessToken.token);

      final providerData = await FacebookAuth.i.getUserData(
        fields: "email",
      );
      final providerEmail = providerData['email'];
      if (userData.email != providerEmail) {
        _ref.read(systemControllerProvider.notifier).hideLoading();
        _ref.read(systemControllerProvider.notifier).showToastMessage(
            Utils.getLocaleMessage(LocaleKeys.settingAccountLinkAccountError));
      } else {
        await linkAccount(facebookAuthCredential);
        _ref.read(systemControllerProvider.notifier).hideLoading();
      }
    } else {
      _ref.read(systemControllerProvider.notifier).hideLoading();
    }
    await FacebookAuth.instance.logOut();
  }

  Future<void> googleLink() async {
    _ref.read(systemControllerProvider.notifier).showLoading();
    UserEntity? userData = _ref.read(authControllerProvider);

    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser != null && userData != null) {
      if (userData.email != googleUser.email) {
        _ref.read(systemControllerProvider.notifier).hideLoading();

        _ref.read(systemControllerProvider.notifier).showToastMessage(
            Utils.getLocaleMessage(LocaleKeys.settingAccountLinkAccountError));
      } else {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await linkAccount(credential);
        _ref.read(systemControllerProvider.notifier).hideLoading();
      }
    } else {
      _ref.read(systemControllerProvider.notifier).hideLoading();
    }
    await disconnect();
  }

  Future<void> unLink(String providerId) async {
    _ref.read(systemControllerProvider.notifier).showLoading();
    try {
      await FirebaseAuth.instance.currentUser?.unlink(providerId);
      await synUnLinkWithServer(providerId);
      _ref.read(systemControllerProvider.notifier).hideLoading();
    } on FirebaseAuthException catch (e) {
      _ref.read(systemControllerProvider.notifier).handlerFirebaseError(e.code);
    }
  }

  Future<void> linkAccount(OAuthCredential credential) async {
    _ref.read(systemControllerProvider.notifier).showLoading();

    try {
      UserCredential? userCredential = await FirebaseAuth.instance.currentUser
          ?.linkWithCredential(credential);

      User? userdata = userCredential?.user;

      if (userCredential != null && userdata != null) {
        final String providerLink = credential.signInMethod;

        List<UserInfo> providersData = userdata.providerData;

        for (UserInfo element in providersData) {
          if (element.providerId == providerLink) {
            await synLinkWithServer(element);
          }
        }
      } else {
        _ref.read(systemControllerProvider.notifier).showToastGeneralError();
      }
    } on FirebaseAuthException catch (e) {
      _ref.read(systemControllerProvider.notifier).handlerFirebaseError(e.code);
    }
  }

  Future<void> synLinkWithServer(UserInfo providerData) async {
    UserEntity? userData = _ref.read(authControllerProvider);
    if (userData != null) {
      final synLinkWithServerRes = await _ref
          .read(settingRepositoryProvider)
          .accountLink(providerData, userData.id);

      synLinkWithServerRes.fold((l) {}, (r) {
        _ref.read(authControllerProvider.notifier).setDataUser(r.results);
      });
    } else {
      _ref.read(systemControllerProvider.notifier).showToastGeneralError();
    }
  }

  Future<void> synUnLinkWithServer(String providerId) async {
    UserEntity? userData = _ref.read(authControllerProvider);
    if (userData != null) {
      final synLinkWithServerRes = await _ref
          .read(settingRepositoryProvider)
          .accountUnLink(providerId, userData.id);

      synLinkWithServerRes.fold((l) {}, (r) {
        _ref.read(authControllerProvider.notifier).setDataUser(r.results);
        _ref.read(systemControllerProvider.notifier).showToastMessage(r.msg);
      });
    } else {
      _ref.read(systemControllerProvider.notifier).showToastGeneralError();
    }
  }
}
