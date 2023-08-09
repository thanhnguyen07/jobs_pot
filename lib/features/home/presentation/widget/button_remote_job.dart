import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_images.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/features/home/domain/entities/jobs_summary_entity.dart';
import 'package:jobs_pot/features/home/home_porvider.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

class ButtonRemoteJob extends ConsumerStatefulWidget {
  const ButtonRemoteJob({
    super.key,
  });

  @override
  ConsumerState<ButtonRemoteJob> createState() => _ButtonRemoteJobState();
}

class _ButtonRemoteJobState extends ConsumerState<ButtonRemoteJob> {
  @override
  Widget build(BuildContext context) {
    JobsSummaryEntity? jobsSummaryData = ref.watch(jobsSummaryController);

    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.babyBlueColor,
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: TextButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.findJob,
                width: 35,
                height: 35,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  Utils.getNumberOfJob(jobsSummaryData?.remoteJob),
                  style: AppTextStyle.textColor3MediumS16,
                ),
              ),
              Text(
                Utils.getLocaleMessage(LocaleKeys.homeRemoteJobTitle),
                style: AppTextStyle.darkPurpleRegularS14,
              )
            ],
          ),
        ),
      ),
    );
  }
}
