import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_entity.dart';
import 'package:jobs_pot/routes/route_config.gr.dart';
import 'package:jobs_pot/system/system_providers.dart';

class EmailVerificationController extends StateNotifier<bool> {
  EmailVerificationController(this.ref) : super(false);
  final Ref ref;
  String? _cureentEmail;

  void setCurrentEmail(String? email) {
    _cureentEmail = email;
  }

  String getCurrentEmail() {
    UserEntity? userData = ref.read(authControllerProvider);
    return _cureentEmail ?? userData?.email ?? "";
  }

  Future<bool> reSendVerifyMail() async {
    String currentEmail = getCurrentEmail();
    ref.read(systemControllerProvider.notifier).showLoading();
    final sendVerificationCodeRes = await ref
        .read(authRepositoryProvider)
        .sendVerificationCode(currentEmail);

    return sendVerificationCodeRes.fold(
      (l) {
        ref.read(systemControllerProvider.notifier).hideLoading();
        return false;
      },
      (r) {
        ref.read(systemControllerProvider.notifier).hideLoading();
        return true;
      },
    );
  }

  void clearErrorCode() {
    if (state) {
      state = false;
    }
  }

  void checkVerifyEmail(BuildContext context, String code) async {
    ref.read(systemControllerProvider.notifier).showLoading();

    bool sendVerifyCodeRes = await verifyCode(code);

    if (sendVerifyCodeRes) {
      UserEntity? userData = ref.read(authControllerProvider);
      clearErrorCode();
      if (userData?.id != null && context.mounted) {
        await getProfile(context, userData!.id);
      }
    }

    ref.read(systemControllerProvider.notifier).hideLoading();
  }

  Future<bool> verifyCode(String code) async {
    ref.read(systemControllerProvider.notifier).showLoading();

    final sendVerifyCodeRes =
        await ref.read(authRepositoryProvider).sendVerifyCode(code);

    ref.read(systemControllerProvider.notifier).hideLoading();

    return sendVerifyCodeRes.fold(
      (l) {
        state = true;
        return false;
      },
      (r) async {
        return true;
      },
    );
  }

  Future getProfile(BuildContext context, String idUser) async {
    await ref.read(authRepositoryProvider).getUserProfile(idUser).then(
      (res) {
        res.fold(
          (l) {},
          (r) {
            setCurrentEmail(null);
            context.router.replaceAll([const HomeStackRoute()]);
          },
        );
      },
    );
  }
}
