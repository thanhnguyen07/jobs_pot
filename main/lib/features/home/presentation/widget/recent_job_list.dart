import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_icons.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/avatar_image.dart';
import 'package:jobs_pot/features/home/home_porvider.dart';
import 'package:jobs_pot/features/home/presentation/widget/custom_title.dart';
import 'package:i18n/i18n.dart';
import 'package:models/entities/export.dart';

class RecentRemoteJob extends ConsumerStatefulWidget {
  const RecentRemoteJob({
    super.key,
  });

  @override
  ConsumerState<RecentRemoteJob> createState() => _RecentRemoteJobState();
}

class _RecentRemoteJobState extends ConsumerState<RecentRemoteJob> {
  @override
  Widget build(BuildContext context) {
    final List<RecentListEntity>? recentListData =
        ref.watch(recentListController);

    String getAmountSalary(SalaryEntity data) {
      double? amountStart = data.amountStart;
      double? amountEnd = data.amountEnd;
      double? amountAvg = data.amountAvg;
      if (amountStart == null || amountEnd == null) {
        if (amountAvg != null) {
          return "${data.currency}${(amountAvg / 1000).toString()}K";
        }
        return '${data.currency}~K';
      } else {
        return "${data.currency}${(amountStart / 1000).toString()}K - ${(amountEnd / 1000).toString()}K";
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTitle(titleKey: LocaleKeys.homeRecentFinJobTitle),
          recentListData != null
              ? SizedBox(
                  height: recentListData.length * 170,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    physics: const ClampingScrollPhysics(),
                    itemCount: recentListData.length,
                    itemBuilder: (context, index) {
                      return FilledButton(
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.8),
                          elevation: 3,
                          padding: const EdgeInsets.all(0),
                        ),
                        onPressed: () {},
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 15,
                            bottom: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 40,
                                    child: Row(
                                      children: [
                                        AvatarImage(
                                          avatarLink: recentListData[index]
                                              .companyAvatar,
                                          size: 40,
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              recentListData[index].jobName,
                                              style: AppTextStyle.bold.s14
                                                  .copyWith(
                                                color: AppColors.white,
                                              ),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                text: recentListData[index]
                                                    .companyName,
                                                style: AppTextStyle.regular.s12,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: ' ׄ· ',
                                                    style: AppTextStyle
                                                        .regular.s12,
                                                  ),
                                                  TextSpan(
                                                    text: recentListData[index]
                                                        .companyAddress,
                                                    style: AppTextStyle
                                                        .regular.s12,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: SvgPicture.asset(
                                      AppSvgIcons.save,
                                      colorFilter: const ColorFilter.mode(
                                        AppColors.white,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: RichText(
                                  text: TextSpan(
                                    text: getAmountSalary(
                                        recentListData[index].salary),
                                    style: AppTextStyle.bold.s14,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            "/${recentListData[index].salary.type}",
                                        style: AppTextStyle.regular.s12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 35,
                                margin: const EdgeInsets.only(top: 10),
                                width: double.infinity,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.all(0),
                                  itemCount: recentListData[index].tags.length,
                                  itemBuilder: (childContext, childIndex) {
                                    return Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      margin: const EdgeInsets.only(right: 10),
                                      child: Text(
                                        recentListData[index].tags[childIndex],
                                        style:
                                            AppTextStyle.regular.s12.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
