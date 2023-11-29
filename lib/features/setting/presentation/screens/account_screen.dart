import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_icons.dart';
import 'package:jobs_pot/common/app_images.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/avatar_image.dart';
import 'package:jobs_pot/common/widgets/cutom_button.dart';
import 'package:jobs_pot/common/widgets/header.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/provider_info_entity.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_entity.dart';
import 'package:jobs_pot/features/setting/presentation/screens/change_password_screen.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Header(
              onBack: () {
                context.router.back();
              },
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

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _userInfo(userData),
          const SizedBox(height: 10),
          Text(
            Utils.getLocaleMessage(LocaleKeys.settingAccountLinkAccount),
            style: AppTextStyle.darkPurpleBoldS18,
          ),
          const SizedBox(height: 10),
          _providerButton(
            icon: AppImages.google3,
            isPassword: false,
            title: LocaleKeys.settingAccountGooogleTitle,
            providerKey: ProviderKeys.google,
            link: () {
              ref.read(accountControllerProvider.notifier).googleLink();
            },
            unLink: () async {
              await ref
                  .read(accountControllerProvider.notifier)
                  .unLink(ProviderKeys.google);

              if (context.mounted) {
                Navigator.pop(context);
              }
            },
          ),
          _providerButton(
            icon: AppImages.facebookLogo,
            isPassword: false,
            title: LocaleKeys.settingAccountFacebookTitle,
            providerKey: ProviderKeys.facebook,
            link: () {
              ref.read(accountControllerProvider.notifier).facebookLink();
            },
            unLink: () async {
              await ref
                  .read(accountControllerProvider.notifier)
                  .unLink(ProviderKeys.facebook);

              if (context.mounted) {
                Navigator.pop(context);
              }
            },
          ),
          _providerButton(
            icon: AppImages.password,
            isPassword: true,
            title: LocaleKeys.authenticationPasswordInputTitle,
            providerKey: ProviderKeys.password,
            link: () {},
            unLink: () async {
              await ref
                  .read(accountControllerProvider.notifier)
                  .unLink(ProviderKeys.facebook);

              if (context.mounted) {
                Navigator.pop(context);
              }
            },
            changePassword: () {
              context.router.pushNamed(ChangePasswordScreen.path);
            },
          ),
        ],
      ),
    );
  }

  TextButton _providerButton({
    required String icon,
    required String title,
    required String providerKey,
    required void Function() link,
    required void Function() unLink,
    required bool isPassword,
    void Function()? changePassword,
  }) {
    UserEntity? userData = ref.read(authControllerProvider);

    checkLink(String providerId) {
      bool result = false;
      for (final ProviderInfoEntity elemet in userData!.providerData) {
        if (elemet.providerId == providerId) {
          result = true;
        }
      }
      return result;
    }

    onPressed() async {
      checkLink(providerKey)
          ? await _linkDialog(
              providerKey: providerKey,
              dialogTitle: title,
              dialogIcon: icon,
              unLink: unLink,
              isPassword: isPassword,
              changePassword: changePassword,
            )
          : link();
    }

    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: SizedBox(
        width: 250,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              icon,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 80,
              child: Text(
                Utils.getLocaleMessage(
                  title,
                ),
                style: AppTextStyle.text4BoldS16,
              ),
            ),
            Switch(
              activeColor: Colors.green,
              activeTrackColor: Colors.greenAccent,
              trackOutlineColor: checkLink(providerKey)
                  ? MaterialStateProperty.all(Colors.green)
                  : null,
              thumbIcon: thumbIcon,
              value: checkLink(providerKey),
              onChanged: (_) {
                onPressed();
              },
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _linkDialog({
    required String providerKey,
    required String dialogTitle,
    required String dialogIcon,
    required void Function() unLink,
    required bool isPassword,
    void Function()? changePassword,
  }) {
    UserEntity? userData = ref.read(authControllerProvider);

    ProviderInfoEntity? getProviderInfo(String providerId) {
      ProviderInfoEntity? result;
      for (final ProviderInfoEntity elemet in userData!.providerData) {
        if (elemet.providerId == providerId) {
          result = elemet;
        }
      }
      return result;
    }

    return showDialog(
      context: context,
      builder: (context) {
        ProviderInfoEntity? providerInfo = getProviderInfo(providerKey);

        final providerData = userData?.providerData;

        return AlertDialog(
          icon: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                dialogIcon,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              Text(
                Utils.getLocaleMessage(dialogTitle),
                style: AppTextStyle.darkPurpleBoldS18,
              ),
              providerInfo?.photoURL != null
                  ? AvatarImage(
                      avatarLink: providerInfo?.photoURL,
                      size: 50,
                      edit: false,
                    )
                  : const SizedBox(width: 50),
            ],
          ),
          content: SizedBox(
            height: 60,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                providerInfo?.displayName != null
                    ? RichText(
                        text: TextSpan(
                          text: Utils.getLocaleMessage(
                            LocaleKeys.settingAccountDisplayNameAccount,
                          ),
                          style: AppTextStyle.egglantBoldS14,
                          children: [
                            TextSpan(
                              text: providerInfo?.displayName,
                              style: AppTextStyle.darkPurpleRegularS14,
                            )
                          ],
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(height: 2),
                RichText(
                  text: TextSpan(
                    text: Utils.getLocaleMessage(
                      LocaleKeys.settingAccountDisplayEmailAccount,
                    ),
                    style: AppTextStyle.egglantBoldS14,
                    children: [
                      TextSpan(
                        text: providerInfo?.email ?? "",
                        style: AppTextStyle.darkPurpleRegularS14,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                RichText(
                  text: TextSpan(
                    text: Utils.getLocaleMessage(
                      LocaleKeys.settingAccountProviderIdAccount,
                    ),
                    style: AppTextStyle.egglantBoldS14,
                    children: [
                      TextSpan(
                        text: providerInfo?.providerId ?? "",
                        style: AppTextStyle.darkPurpleRegularS14,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                isPassword
                    ? ElevatedButton(
                        onPressed: changePassword,
                        child: Text(
                          Utils.getLocaleMessage(
                            LocaleKeys.settingAccountChangePassword,
                          ),
                          style: AppTextStyle.darkPurpleBoldS14,
                        ),
                      )
                    : const SizedBox(),
                providerData != null && providerData.length > 1
                    ? ElevatedButton(
                        onPressed: () async {
                          await showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return _modalConfirmUnLink(context, unLink);
                            },
                          );
                        },
                        child: Text(
                          Utils.getLocaleMessage(
                            LocaleKeys.settingAccountUnlinkAccount,
                          ),
                          style: AppTextStyle.redBoldS14,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ],
        );
      },
    );
  }

  SizedBox _modalConfirmUnLink(BuildContext context, void Function() unLink) {
    return SizedBox(
      height: 250,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              Utils.getLocaleMessage(LocaleKeys.settingAccountConfirmUnLink),
              style: AppTextStyle.darkPurpleBoldS18,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              child: CustomButton(
                title: Text(
                  Utils.getLocaleMessage(
                    LocaleKeys.yesButtonTitle,
                  ),
                  style: AppTextStyle.whiteBoldS14,
                ),
                backgroundColor: Colors.redAccent,
                onPressed: () {
                  unLink();
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 20),
              child: CustomButton(
                title: Text(
                  Utils.getLocaleMessage(
                    LocaleKeys.cancelButtonTitle,
                  ),
                  style: AppTextStyle.whiteBoldS14,
                ),
                backgroundColor: AppColors.lavenderColor,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _userInfo(UserEntity? userData) {
    return Row(
      children: [
        AvatarImage(
          avatarLink: userData!.photoUrl,
          size: 70,
          edit: false,
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
