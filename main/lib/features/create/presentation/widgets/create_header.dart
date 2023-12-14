import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/constant/app_icons.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/features/create/create_provider.dart';
import 'package:jobs_pot/features/home_stack/home_stack_provider.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

class CreateHeader extends ConsumerStatefulWidget {
  const CreateHeader({
    super.key,
  });

  @override
  ConsumerState<CreateHeader> createState() => _CreateHeaderState();
}

class _CreateHeaderState extends ConsumerState<CreateHeader> {
  @override
  Widget build(BuildContext context) {
    final List<String>? uploadsData =
        ref.watch(uploadImageToFirebaseController);
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              ref
                  .read(bottomNavigationController.notifier)
                  .actionButtonCreate(context);
            },
            child: SvgPicture.asset(AppSvgIcons.back),
          ),
          TextButton(
            onPressed: () {
              if (uploadsData != null) {
              } else {
                ref.read(createPostController.notifier).onPost(context);
              }
            },
            style: TextButton.styleFrom(
              foregroundColor:
                  uploadsData != null ? Colors.white : null, // foreground
            ),
            child: Text(
              Utils.getLocaleMessage(LocaleKeys.postButtonPost),
              style: AppTextStyle.textColor6BoldS14,
            ),
          )
        ],
      ),
    );
  }
}
