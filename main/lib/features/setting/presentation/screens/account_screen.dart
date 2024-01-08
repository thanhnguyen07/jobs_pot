import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_enum.dart';
import 'package:jobs_pot/common/constant/app_icons.dart';
import 'package:jobs_pot/common/constant/app_keys.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/avatar_image.dart';
import 'package:jobs_pot/common/widgets/header.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/User/user_entity.dart';
import 'package:jobs_pot/features/home_stack/presentation/screens/bottom_navigation_screen.dart';
import 'package:jobs_pot/features/profile/presentation/screens/profile_screen.dart';
import 'package:jobs_pot/features/setting/presentation/screens/change_password_screen.dart';
import 'package:jobs_pot/features/setting/presentation/widgets/modal_choose_verify_method.dart';
import 'package:jobs_pot/features/setting/presentation/widgets/modal_confirm.dart';
import 'package:jobs_pot/features/setting/presentation/widgets/modal_verification_code.dart';
import 'package:jobs_pot/features/setting/presentation/widgets/modal_verificaton_password.dart';
import 'package:jobs_pot/features/setting/presentation/widgets/provider_button.dart';
import 'package:jobs_pot/features/setting/presentation/widgets/provider_details.dart';
import 'package:jobs_pot/features/setting/setting_providers.dart';
import 'package:i18n/i18n.dart';
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

    UserEntity? userData = ref.watch(authControllerProvider);

    bool linkedPassword = ref
        .read(accountControllerProvider.notifier)
        .checkLink(ProviderKeys.password);

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              onBack: onBack,
              titleKey: LocaleKeys.settingAccountTitle,
            ),
            _overViewTitle(),
            _userInfo(userData, context),
            _linkAccountTitle(),
            _googleButton(),
            _facebookButton(),
            _accountManagementTitle(),
            linkedPassword ? _changePasswordButton(context) : const SizedBox(),
            _deleteAccount(context),
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
          color: AppColors.white,
        );
      }
      return const Icon(
        Icons.close,
      );
    },
  );

  Container _accountManagementTitle() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        Utils.getLocaleMessage(LocaleKeys.settingAccountLinkAccountManagement),
        style: AppTextStyle.bold.s16.copyWith(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }

  Container _linkAccountTitle() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        Utils.getLocaleMessage(LocaleKeys.settingAccountLinkAccount),
        style: AppTextStyle.bold.s16.copyWith(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }

  Container _overViewTitle() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        Utils.getLocaleMessage(LocaleKeys.accountOverviewTitle),
        style: AppTextStyle.bold.s16.copyWith(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
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
                  style: AppTextStyle.bold.s30,
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
              style: AppTextStyle.bold.s26,
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
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Theme.of(context).colorScheme.onSecondary,
            width: 2,
          ),
          vertical: BorderSide(
            color: Theme.of(context).colorScheme.onSecondary,
            width: 2,
          ),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        onPressed: deleteAction,
        style: TextButton.styleFrom(
          fixedSize: const Size(double.maxFinite, 50),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    width: 30,
                    height: 30,
                    AppPngIcons.delete,
                  ),
                  const SizedBox(width: 15),
                  Text(
                    Utils.getLocaleMessage(
                      LocaleKeys.settingAccountDeleteAccount,
                    ),
                    style: AppTextStyle.bold.s14Red,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: SvgPicture.asset(
                  AppSvgIcons.remove,
                  width: 20,
                  height: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _changePasswordButton(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: TextButton(
        onPressed: () {
          context.router.pushNamed(ChangePasswordScreen.path);
        },
        style: TextButton.styleFrom(
          fixedSize: const Size(double.maxFinite, 50),
          padding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    width: 30,
                    height: 30,
                    AppPngIcons.password,
                  ),
                  const SizedBox(width: 15),
                  Text(
                    Utils.getLocaleMessage(
                      LocaleKeys.settingAccountChangePassword,
                    ),
                    style: AppTextStyle.bold.s14,
                  ),
                ],
              ),
              // Container(
              //   margin: const EdgeInsets.only(right: 10),
              //   child: Image.asset(
              //     width: 30,
              //     height: 30,
              //     AppPngIcons.resetPassword,
              //   ),
              // )
            ],
          ),
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
        dialogIcon: AppPngIcons.facebookLogo,
      );
    }

    return ProviderButton(
      linked: linked,
      icon: AppPngIcons.facebookLogo,
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
        dialogIcon: AppPngIcons.googleLogo,
      );
    }

    return ProviderButton(
      topButton: true,
      linked: linked,
      icon: AppPngIcons.google3,
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
                      style: AppTextStyle.bold.s30,
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
                  style: AppTextStyle.bold.s26,
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

  Widget _userInfo(UserEntity? userData, BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Theme.of(context).colorScheme.onPrimary,
            width: 1,
          ),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        onPressed: () {
          context.router.navigateNamed(HomeStackScreen.path).then((value) {
            context.router.navigateNamed(ProfileScreen.path);
          });
        },
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            children: [
              AvatarImage(
                avatarLink: userData?.photoUrl,
                size: 70,
                edit: false,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userData?.userName ?? "",
                    style: AppTextStyle.boldItalic.s16.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  Text(
                    userData?.email ?? "",
                    style: AppTextStyle.lightItalic.s14.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
