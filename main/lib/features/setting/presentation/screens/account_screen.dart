import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_enum.dart';
import 'package:jobs_pot/common/app_images.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/avatar_image.dart';
import 'package:jobs_pot/common/widgets/header.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/User/user_entity.dart';
import 'package:jobs_pot/features/profile/presentation/screens/edit_profile.dart';
import 'package:jobs_pot/features/setting/presentation/screens/change_password_screen.dart';
import 'package:jobs_pot/features/setting/presentation/widgets/modal_choose_verify_method.dart';
import 'package:jobs_pot/features/setting/presentation/widgets/modal_confirm.dart';
import 'package:jobs_pot/features/setting/presentation/widgets/modal_verification_code.dart';
import 'package:jobs_pot/features/setting/presentation/widgets/modal_verificaton_password.dart';
import 'package:jobs_pot/features/setting/presentation/widgets/provider_button.dart';
import 'package:jobs_pot/features/setting/presentation/widgets/provider_details.dart';
import 'package:jobs_pot/features/setting/setting_providers.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

@RoutePage()
class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({Key? key}) : super(key: null);

  static const String path = '/AccountScreen';

  @override
  ConsumerState<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
  @override
  void initState() {
    ref.read(authControllerProvider.notifier).getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void onBack() {
      context.router.back();
    }

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Header(
              onBack: onBack,
              titleKey: LocaleKeys.settingAccountTitle,
            ),
            _body(context),
          ],
        ),
      ),
    );
  }

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(
          Icons.check,
          color: Colors.white,
        );
      }
      return const Icon(
        Icons.close,
      );
    },
  );

  Container _body(BuildContext context) {
    UserEntity? userData = ref.watch(authControllerProvider);

    bool linkedPassword = ref
        .read(accountControllerProvider.notifier)
        .checkLink(ProviderKeys.password);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _userInfo(userData, context),
          const SizedBox(height: 10),
          _linkAccountTitle(),
          const SizedBox(height: 10),
          _googleButton(),
          _facebookButton(),
          _accountManagementTitle(),
          const SizedBox(height: 10),
          linkedPassword ? _changePasswordButton(context) : const SizedBox(),
          const SizedBox(height: 10),
          _deleteAccount(context)
        ],
      ),
    );
  }

  Text _accountManagementTitle() {
    return Text(
      Utils.getLocaleMessage(LocaleKeys.settingAccountLinkAccountManagement),
      style: AppTextStyle.darkPurpleBoldS18,
    );
  }

  Text _linkAccountTitle() {
    return Text(
      Utils.getLocaleMessage(LocaleKeys.settingAccountLinkAccount),
      style: AppTextStyle.darkPurpleBoldS18,
    );
  }

  Container _deleteAccount(BuildContext context) {
    Future<void> confirmUnLink() {
      return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return ModalConfirm(
            type: LocaleKeys.settingAccountDeleteAccount,
            yesPress: () async {
              Navigator.pop(context);
              await ref
                  .read(accountControllerProvider.notifier)
                  .deleteAccount();
            },
            noPress: () {
              Navigator.pop(context);
            },
          );
        },
      );
    }

    void verifyCode(pin) async {
      bool verifycodeRes =
          await ref.read(accountControllerProvider.notifier).verifycode(pin);

      if (verifycodeRes && context.mounted) {
        Navigator.pop(context);
        confirmUnLink();
      }
    }

    void verifyPassword(BuildContext context) async {
      bool passwordVerifyRes =
          await ref.read(accountControllerProvider.notifier).passwordVerify();
      if (passwordVerifyRes && context.mounted) {
        Navigator.pop(context);
        confirmUnLink();
      }
    }

    void verificationCodeMethodPress() async {
      bool sendVerificationCodeRes = await ref
          .read(accountControllerProvider.notifier)
          .sendVerificationCode();

      if (sendVerificationCodeRes && context.mounted) {
        await showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: SizedBox(
                width: double.maxFinite,
                child: Text(
                  Utils.getLocaleMessage(
                      LocaleKeys.settingAccountChangeVerificationCode),
                  style: AppTextStyle.darkPurpleBoldS30,
                  textAlign: TextAlign.center,
                ),
              ),
              content: ModalVerificationCode(
                onCompleted: verifyCode,
              ),
            );
          },
        );
      }
    }

    void passwordMethodPress() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              Utils.getLocaleMessage(LocaleKeys.settingAccountPasswordVerify),
              style: AppTextStyle.darkPurpleBoldS26,
            ),
            content: ModalVerificationPassword(
              verifyPassword: () {
                verifyPassword(context);
              },
            ),
          );
        },
      );
    }

    void deleteAction() async {
      await showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext chooseVerifyMethoContext) {
          bool linkedPassword = ref
              .read(accountControllerProvider.notifier)
              .checkLink(ProviderKeys.password);
          return ModalChooseVerifyMethod(
            type: LocaleKeys.settingAccountDeleteAccount,
            verificationCodeMethodPress: () {
              Navigator.pop(chooseVerifyMethoContext);
              verificationCodeMethodPress();
            },
            linkedPassword: linkedPassword,
            passwordMethodPress: () {
              Navigator.pop(chooseVerifyMethoContext);
              passwordMethodPress();
            },
          );
        },
      );
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        onPressed: deleteAction,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
        ),
        child: Text(
          Utils.getLocaleMessage(
            LocaleKeys.settingAccountDeleteAccount,
          ),
          style: AppTextStyle.whiteBoldS14,
        ),
      ),
    );
  }

  Container _changePasswordButton(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        onPressed: () {
          context.router.pushNamed(ChangePasswordScreen.path);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.egglantColor,
        ),
        child: Text(
          Utils.getLocaleMessage(
            LocaleKeys.settingAccountChangePassword,
          ),
          style: AppTextStyle.whiteBoldS14,
        ),
      ),
    );
  }

  Widget _facebookButton() {
    bool linked = ref
        .read(accountControllerProvider.notifier)
        .checkLink(ProviderKeys.facebook);

    linkFun() {
      ref.read(accountControllerProvider.notifier).facebookLink();
    }

    unLinkFun() async {
      ref
          .read(accountControllerProvider.notifier)
          .setProvider(ProviderType.facebook);

      await _providerDetailsDialog(
        providerKey: ProviderKeys.facebook,
        dialogTitle: LocaleKeys.settingAccountFacebookTitle,
        dialogIcon: AppImages.facebookLogo,
      );
    }

    return ProviderButton(
      linked: linked,
      icon: AppImages.facebookLogo,
      title: LocaleKeys.settingAccountFacebookTitle,
      linkFun: linkFun,
      unLinkFun: unLinkFun,
    );
  }

  Widget _googleButton() {
    bool linked = ref
        .read(accountControllerProvider.notifier)
        .checkLink(ProviderKeys.google);

    linkFun() {
      ref.read(accountControllerProvider.notifier).googleLink();
    }

    unLinkFun() async {
      ref
          .read(accountControllerProvider.notifier)
          .setProvider(ProviderType.google);

      await _providerDetailsDialog(
        providerKey: ProviderKeys.google,
        dialogTitle: LocaleKeys.settingAccountGooogleTitle,
        dialogIcon: AppImages.googleLogo,
      );
    }

    return ProviderButton(
      linked: linked,
      icon: AppImages.google3,
      title: LocaleKeys.settingAccountGooogleTitle,
      linkFun: linkFun,
      unLinkFun: unLinkFun,
    );
  }

  Future<dynamic> _providerDetailsDialog({
    required String providerKey,
    required String dialogTitle,
    required String dialogIcon,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext detailsContext) {
        // UnLink flow
        // Password verify method => Dialog password verify => Verify password => Dialog confirm unlink
        // Verifiction code method => Send verification code => Verifiction code verify => Verify code => Dialog confirm unlink
        Future<void> confirmUnLink() {
          return showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return ModalConfirm(
                type: LocaleKeys.settingAccountUnlinkAccount,
                yesPress: () async {
                  Navigator.pop(context);
                  bool unLinkRes = await ref
                      .read(accountControllerProvider.notifier)
                      .unLink();
                  if (unLinkRes && detailsContext.mounted) {
                    Navigator.pop(detailsContext);
                  }
                },
                noPress: () {
                  Navigator.pop(context);
                },
              );
            },
          );
        }

        void verifyCode(pin) async {
          bool verifycodeRes = await ref
              .read(accountControllerProvider.notifier)
              .verifycode(pin);

          if (verifycodeRes && context.mounted) {
            Navigator.pop(context);
            confirmUnLink();
          }
        }

        void verifyPassword(BuildContext context) async {
          bool passwordVerifyRes = await ref
              .read(accountControllerProvider.notifier)
              .passwordVerify();
          if (passwordVerifyRes && context.mounted) {
            Navigator.pop(context);
            confirmUnLink();
          }
        }

        void verificationCodeMethodPress() async {
          bool sendVerificationCodeRes = await ref
              .read(accountControllerProvider.notifier)
              .sendVerificationCode();

          if (sendVerificationCodeRes && context.mounted) {
            await showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      Utils.getLocaleMessage(
                          LocaleKeys.settingAccountChangeVerificationCode),
                      style: AppTextStyle.darkPurpleBoldS30,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  content: ModalVerificationCode(
                    onCompleted: verifyCode,
                  ),
                );
              },
            );
          }
        }

        void passwordMethodPress() {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  Utils.getLocaleMessage(
                      LocaleKeys.settingAccountPasswordVerify),
                  style: AppTextStyle.darkPurpleBoldS26,
                ),
                content: ModalVerificationPassword(
                  verifyPassword: () {
                    verifyPassword(context);
                  },
                ),
              );
            },
          );
        }

        void unLinkFun() async {
          await showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext chooseVerifyMethoContext) {
              bool linkedPassword = ref
                  .read(accountControllerProvider.notifier)
                  .checkLink(ProviderKeys.password);
              return ModalChooseVerifyMethod(
                type: LocaleKeys.settingAccountUnlinkAccount,
                verificationCodeMethodPress: () {
                  Navigator.pop(chooseVerifyMethoContext);
                  verificationCodeMethodPress();
                },
                linkedPassword: linkedPassword,
                passwordMethodPress: () {
                  Navigator.pop(chooseVerifyMethoContext);
                  passwordMethodPress();
                },
              );
            },
          );
        }

        return ProviderDetails(
          dialogIcon: dialogIcon,
          dialogTitle: dialogTitle,
          providerKey: providerKey,
          unLinkAction: unLinkFun,
        );
      },
    );
  }

  Row _userInfo(UserEntity? userData, BuildContext context) {
    return Row(
      children: [
        AvatarImage(
          avatarLink: userData!.photoUrl,
          size: 70,
          edit: false,
          onTab: () {
            context.router.pushNamed(EditProfileScreen.path);
          },
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userData.userName,
              style: AppTextStyle.darkPurpleBoldS18,
            ),
            Text(
              userData.email,
              style: AppTextStyle.textColor1RegularS14,
            ),
          ],
        )
      ],
    );
  }
}
