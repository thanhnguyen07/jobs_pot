import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_icons.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/features/home/domain/entities/JobsSummary/jobs_summary_entity.dart';
import 'package:jobs_pot/features/home/home_porvider.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
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
    ref.watch(languageControllerProvider);

    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.white,
                  padding: const EdgeInsets.all(13),
                  child: SvgPicture.asset(
                    AppSvgIcons.houseSignal,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  Utils.getNumberOfJob(jobsSummaryData?.remoteJob),
                  style: AppTextStyle.blackBoldS16,
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
