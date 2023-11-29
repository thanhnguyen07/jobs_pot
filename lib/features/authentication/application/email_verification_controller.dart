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
  String _cureentEmail = '';

  void setCurrentEmail(String email) {
    _cureentEmail = email;
  }

  String getCurrentEmail() {
    return _cureentEmail;
  }

  Future<bool> reSendVerifyMail() async {
    ref.read(systemControllerProvider.notifier).showLoading();
    final sendVerificationCodeRes = await ref
        .read(authRepositoryProvider)
        .sendVerificationCode(_cureentEmail);

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

    final sendVerifyCodeRes =
        await ref.read(authRepositoryProvider).sendVerifyCode(code);

    sendVerifyCodeRes.fold(
      (l) {
        state = true;
      },
      (r) async {
        UserEntity? userData = ref.read(authControllerProvider);
        clearErrorCode();
        ref.read(systemControllerProvider.notifier).showToastMessage(r.msg);
        if (userData?.id != null) {
          await getProfile(context, userData!.id);
        }
      },
    );

    ref.read(systemControllerProvider.notifier).hideLoading();
  }

  Future getProfile(BuildContext context, String idUser) async {
    await ref.read(authRepositoryProvider).getUserProfile(idUser).then(
      (res) {
        res.fold(
          (l) {},
          (r) {
            context.router.replaceAll([const HomeStackRoute()]);
          },
        );
      },
    );
  }
}
