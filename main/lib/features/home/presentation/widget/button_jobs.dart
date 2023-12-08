import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/home/domain/entities/JobsSummary/jobs_summary_entity.dart';
import 'package:jobs_pot/features/home/home_porvider.dart';
import 'package:jobs_pot/features/home/presentation/widget/button_remote_job.dart';
import 'package:jobs_pot/features/home/presentation/widget/custom_button.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';

class ButtonJobs extends ConsumerStatefulWidget {
  const ButtonJobs({
    super.key,
  });

  @override
  ConsumerState<ButtonJobs> createState() => _ButtonJobsState();
}

class _ButtonJobsState extends ConsumerState<ButtonJobs> {
  @override
  Widget build(BuildContext context) {
    JobsSummaryEntity? jobsSummaryData = ref.watch(jobsSummaryController);
    ref.watch(languageControllerProvider);

    return SizedBox(
      height: 150,
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
                    topButton: true,
                    count: Utils.getNumberOfJob(jobsSummaryData?.fullTime),
                    title: Utils.getLocaleMessage(LocaleKeys.homeFullTimeTitle),
                  ),
                  CustomButton1(
                    topButton: false,
                    count: Utils.getNumberOfJob(jobsSummaryData?.partTime),
                    title: Utils.getLocaleMessage(LocaleKeys.homePartTimeTitle),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
