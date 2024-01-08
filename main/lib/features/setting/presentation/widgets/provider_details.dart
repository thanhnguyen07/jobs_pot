import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/avatar_image.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/ProviderInfo/provider_info_entity.dart';
import 'package:jobs_pot/features/authentication/domain/entities/User/user_entity.dart';
import 'package:i18n/i18n.dart';
import 'package:jobs_pot/utils/utils.dart';

class ProviderDetails extends ConsumerStatefulWidget {
  const ProviderDetails({
    Key? key,
    required this.dialogIcon,
    required this.dialogTitle,
    required this.unLinkAction,
    required this.providerKey,
  }) : super(key: null);

  final String dialogIcon;
  final String dialogTitle;
  final void Function() unLinkAction;
  final String providerKey;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProviderDetailsState();
}

class _ProviderDetailsState extends ConsumerState<ProviderDetails> {
  @override
  Widget build(BuildContext context) {
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

    ProviderInfoEntity? providerInfo = getProviderInfo(widget.providerKey);
    final providerData = userData?.providerData;
    return AlertDialog(
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            widget.dialogIcon,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          Text(
            Utils.getLocaleMessage(widget.dialogTitle),
            style: AppTextStyle.bold.s18,
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
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          providerInfo?.displayName != null
              ? RichText(
                  text: TextSpan(
                    text: Utils.getLocaleMessage(
                      LocaleKeys.settingAccountDisplayNameAccount,
                    ),
                    style: AppTextStyle.bold.s14.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                    children: [
                      TextSpan(
                        text: providerInfo?.displayName,
                        style: AppTextStyle.regular.s14,
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
              style: AppTextStyle.bold.s14
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
              children: [
                TextSpan(
                  text: providerInfo?.email ?? "",
                  style: AppTextStyle.regular.s14,
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
              style: AppTextStyle.bold.s14
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
              children: [
                TextSpan(
                  text: providerInfo?.providerId ?? "",
                  style: AppTextStyle.regular.s14,
                )
              ],
            ),
          ),
        ],
      ),
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            providerData != null && providerData.length > 1
                ? ElevatedButton(
                    onPressed: widget.unLinkAction,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.amberColor,
                    ),
                    child: Text(
                      Utils.getLocaleMessage(
                        LocaleKeys.settingAccountUnlinkAccount,
                      ),
                      style: AppTextStyle.bold.s14Red,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
