import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_entity.dart';
import 'package:jobs_pot/features/setting/setting_providers.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AccountController extends StateNotifier<String?> {
  AccountController(this._ref) : super(null);
  final Ref _ref;

  final _passwordForm = FormGroup({
    ValidationKeys.password: FormControl<String>(
      value: '',
      validators: [
        Validators.required,
      ],
      touched: true,
    ),
  });

  FormGroup getPasswordForm() => _passwordForm;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> disconnect() async {
    await _googleSignIn.disconnect();
  }

  void setProvider(String providerId) {
    state = providerId;
  }

  void showLoading() {
    _ref.read(systemControllerProvider.notifier).showLoading();
  }

  void hideLoading() {
    _ref.read(systemControllerProvider.notifier).hideLoading();
  }

  void showToastGeneralError() {
    _ref.read(systemControllerProvider.notifier).showToastGeneralError();
  }

  String getPassword() {
    return _passwordForm.controls[ValidationKeys.password]?.value.toString() ??
        "";
  }

  void passwordVerify(Function affterVerifyFun, BuildContext context) async {
    UserEntity? userData = _ref.read(authControllerProvider);

    final isValid = _passwordForm.valid;

    if (isValid) {
      String password = getPassword();
      String? email = userData?.email;

      try {
        if (email != null) {
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);

          affterVerifyFun();
        }
      } on FirebaseAuthException catch (_) {
        _ref.read(systemControllerProvider.notifier).showToastMessage(
              Utils.getLocaleMessage(
                LocaleKeys.errorPassword2,
              ),
            );
      }
    } else {
      _passwordForm.controls.forEach((key, value) {
        if (value.invalid) {
          value.setErrors({
            ValidationKeys.required: LocaleKeys.authenticationInputRequired
          });
        }
      });
    }
  }

  Future<void> facebookLink() async {
    showLoading();
    await _ref.read(authControllerProvider.notifier).reloadFirebaseUser();

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
        hideLoading();
        _ref.read(systemControllerProvider.notifier).showToastMessage(
            Utils.getLocaleMessage(LocaleKeys.settingAccountLinkAccountError));
      } else {
        await linkAccount(facebookAuthCredential);
        hideLoading();
      }
    } else {
      hideLoading();
    }
    await FacebookAuth.instance.logOut();
  }

  Future<void> googleLink() async {
    showLoading();
    await _ref.read(authControllerProvider.notifier).reloadFirebaseUser();

    UserEntity? userData = _ref.read(authControllerProvider);

    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser != null && userData != null) {
      if (userData.email != googleUser.email) {
        hideLoading();

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
        hideLoading();
      }
    } else {
      hideLoading();
    }
    await disconnect();
  }

  Future<void> unLink(BuildContext detailContext) async {
    showLoading();
    try {
      String? providerId = state;
      if (providerId != null) {
        await FirebaseAuth.instance.currentUser?.unlink(providerId);
        await synUnLinkWithServer(providerId);
        if (detailContext.mounted) {
          Navigator.pop(detailContext);
        }
        state = null;
        hideLoading();
      } else {
        _ref.read(systemControllerProvider.notifier).showToastGeneralError();

        hideLoading();
      }
    } on FirebaseAuthException catch (e) {
      _ref.read(systemControllerProvider.notifier).handlerFirebaseError(e.code);
      hideLoading();
      state = null;
    }
  }

  Future<void> linkAccount(OAuthCredential credential) async {
    showLoading();

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
        showToastGeneralError();
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
      showToastGeneralError();
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
      showToastGeneralError();
    }
  }

  Future<void> verifycode(BuildContext context, String code) async {
    bool verifyCodeRes = await _ref
        .read(emailVerificationControllerProvider.notifier)
        .verifyCode(code);
    if (verifyCodeRes) {
      UserEntity? userData = _ref.read(authControllerProvider);

      String? password =
          _ref.read(addPasswordControllerProvider.notifier).getPassword();

      if (userData != null && password != null) {
        AuthCredential credential = EmailAuthProvider.credential(
            email: userData.email, password: password);
        if (context.mounted) {
          await linkEmail(credential, context);
        }
      } else {
        _ref.read(systemControllerProvider.notifier).showToastGeneralError();
      }
    }
  }

  Future<void> linkEmail(
      AuthCredential credential, BuildContext context) async {
    try {
      await FirebaseAuth.instance.currentUser?.linkWithCredential(credential);
      await _ref.read(authControllerProvider.notifier).reloadFirebaseUser();
      if (context.mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      _ref.read(systemControllerProvider.notifier).handlerFirebaseError(e.code);
    }
  }
}
