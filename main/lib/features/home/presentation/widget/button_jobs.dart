import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/constant/app_icons.dart';
import 'package:jobs_pot/features/home/domain/entities/JobsSummary/jobs_summary_entity.dart';
import 'package:jobs_pot/features/home/home_porvider.dart';
import 'package:jobs_pot/features/home/presentation/widget/button_remote_job.dart';
import 'package:jobs_pot/features/home/presentation/widget/custom_button.dart';
import 'package:jobs_pot/features/home/presentation/widget/custom_title.dart';
import 'package:i18n/i18n.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';

class FindYouJob extends ConsumerStatefulWidget {
  const FindYouJob({
    super.key,
  });

  @override
  ConsumerState<FindYouJob> createState() => _FindYouJobState();
}

class _FindYouJobState extends ConsumerState<FindYouJob> {
  @override
  Widget build(BuildContext context) {
    JobsSummaryEntity? jobsSummaryData = ref.watch(jobsSummaryController);
    ref.watch(languageControllerProvider);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTitle(
            titleKey: LocaleKeys.homeFindJobTitle,
          ),
          SizedBox(
            height: 180,
            child: Row(
              children: [
                const ButtonRemoteJob(),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(left: 12),
                    child: Column(
                      children: [
                        CustomButton1(
                          icon: AppSvgIcons.building,
                          topButton: true,
                          count:
                              Utils.getNumberOfJob(jobsSummaryData?.fullTime),
                          title: Utils.getLocaleMessage(
                              LocaleKeys.homeFullTimeTitle),
                        ),
                        CustomButton1(
                          icon: AppSvgIcons.businessTime,
                          topButton: false,
                          count:
                              Utils.getNumberOfJob(jobsSummaryData?.partTime),
                          title: Utils.getLocaleMessage(
                              LocaleKeys.homePartTimeTitle),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
