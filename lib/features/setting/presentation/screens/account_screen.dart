import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_images.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/avatar_image.dart';
import 'package:jobs_pot/common/widgets/header.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/provider_info_entity.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_entity.dart';
import 'package:jobs_pot/features/setting/presentation/screens/change_password_screen.dart';
import 'package:jobs_pot/features/setting/presentation/widgets/modal_choose_verify_method.dart';
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
          _google(context, userData),
          _facebook(userData),
          _password(context, userData),
        ],
      ),
    );
  }

  checkLink(String providerId, UserEntity? userData) {
    bool result = false;
    if (userData != null) {
      for (final ProviderInfoEntity elemet in userData.providerData) {
        if (elemet.providerId == providerId) {
          result = true;
        }
      }
    }
    return result;
  }

  Widget _password(BuildContext context, UserEntity? userData) {
    bool linked = checkLink(ProviderKeys.password, userData);

    return ProviderButton(
      linked: linked,
      icon: AppImages.password,
      title: LocaleKeys.authenticationPasswordInputTitle,
      onPress: () async {
        ref
            .read(accountControllerProvider.notifier)
            .setProvider(ProviderKeys.password);
        linked
            ? await _providerDetailsDialog(
                providerKey: ProviderKeys.password,
                dialogTitle: LocaleKeys.authenticationPasswordInputTitle,
                dialogIcon: AppImages.password,
                isPassword: true,
                changePassword: () {
                  context.router.pushNamed(ChangePasswordScreen.path);
                })
            : null;
      },
    );
  }

  Widget _facebook(UserEntity? userData) {
    bool linked = checkLink(ProviderKeys.facebook, userData);

    return ProviderButton(
      linked: linked,
      icon: AppImages.facebookLogo,
      title: LocaleKeys.settingAccountFacebookTitle,
      onPress: () async {
        ref
            .read(accountControllerProvider.notifier)
            .setProvider(ProviderKeys.facebook);
        linked
            ? await _providerDetailsDialog(
                providerKey: ProviderKeys.facebook,
                dialogTitle: LocaleKeys.settingAccountFacebookTitle,
                dialogIcon: AppImages.facebookLogo,
              )
            : ref.read(accountControllerProvider.notifier).facebookLink();
      },
      // unLink: () async {
      //   await ref
      //       .read(accountControllerProvider.notifier)
      //       .unLink(ProviderKeys.facebook);
      // },
    );
  }

  Widget _google(BuildContext context, UserEntity? userData) {
    bool linked = checkLink(ProviderKeys.google, userData);

    return ProviderButton(
      linked: linked,
      icon: AppImages.google3,
      title: LocaleKeys.settingAccountGooogleTitle,
      onPress: () async {
        ref
            .read(accountControllerProvider.notifier)
            .setProvider(ProviderKeys.google);
        linked
            ? await _providerDetailsDialog(
                providerKey: ProviderKeys.google,
                dialogTitle: LocaleKeys.settingAccountGooogleTitle,
                dialogIcon: AppImages.googleLogo,
              )
            : ref.read(accountControllerProvider.notifier).googleLink();
      },

      // unLink: () async {
      //   await ref
      //       .read(accountControllerProvider.notifier)
      //       .unLink(ProviderKeys.google);

      //   if (context.mounted) {
      //     Navigator.pop(context);
      //   }
      // },
    );
  }

  Future<dynamic> _providerDetailsDialog({
    required String providerKey,
    required String dialogTitle,
    required String dialogIcon,
    bool isPassword = false,
    void Function()? changePassword,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return ProviderDetails(
          dialogIcon: dialogIcon,
          dialogTitle: dialogTitle,
          isPassword: isPassword,
          providerKey: providerKey,
          changePassword: changePassword,
          unLinkAction: () async {
            await showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return const ModalChooseVerifyMethod();
              },
            );
          },
        );
      },
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
