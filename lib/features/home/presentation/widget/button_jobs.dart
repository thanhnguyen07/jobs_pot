import 'package:flutter/material.dart';
import 'package:jobs_pot/features/home/presentation/widget/button_remote_job.dart';
import 'package:jobs_pot/features/home/presentation/widget/custom_button.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

class ButtonJobs extends StatelessWidget {
  const ButtonJobs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  CustomButton(
                      topButton: true,
                      count: "66.8k",
                      title:
                          Utils.getLocaleMessage(LocaleKeys.homeFullTimeTitle)),
                  CustomButton(
                      topButton: false,
                      count: "38.9k",
                      title:
                          Utils.getLocaleMessage(LocaleKeys.homePartTimeTitle)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
