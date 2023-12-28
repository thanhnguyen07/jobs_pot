import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_pot/common/constant/app_icons.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/User/user_entity.dart';
import 'package:jobs_pot/features/profile/profile_provider.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';

class DateOfBirthBox extends ConsumerStatefulWidget {
  const DateOfBirthBox({Key? key}) : super(key: null);

  @override
  ConsumerState<DateOfBirthBox> createState() => _DateOfBirthBoxState();
}

class _DateOfBirthBoxState extends ConsumerState<DateOfBirthBox> {
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    UserEntity? userData = ref.read(authControllerProvider);
    if (userData?.dateOfBirth != null) {
      selectedDate = DateTime.parse(userData!.dateOfBirth!);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);
    bool editProfileState = ref.watch(profileControllerProvider);
    UserEntity? userData = ref.watch(authControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(context),
        _dateOfBirthBox(context, editProfileState, userData),
      ],
    );
  }

  GestureDetector _dateOfBirthBox(
      BuildContext context, bool editProfileState, UserEntity? userData) {
    void datePicker(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        helpText:
            Utils.getLocaleMessage(LocaleKeys.profileDateOfBirthDialogTitle),
      );
      if (picked != null && picked != selectedDate) {
        ref
            .read(profileControllerProvider.notifier)
            .setDateOfBirth(picked.toString());
        setState(() {
          selectedDate = picked;
        });
      }
    }

    String getDateOfBirth() {
      if (!editProfileState) {
        return Utils.converDateOfBirth(selectedDate.toString());
      } else if (userData?.dateOfBirth == null) {
        return "";
      } else {
        return Utils.converDateOfBirth(userData!.dateOfBirth!);
      }
    }

    return GestureDetector(
      onTap: () {
        editProfileState ? null : datePicker(context);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: Theme.of(context).colorScheme.background,
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getDateOfBirth(),
                style: AppTextStyle.regular.s14,
              ),
              SvgPicture.asset(
                AppSvgIcons.calendar,
                width: 30,
                height: 30,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onBackground,
                  BlendMode.srcIn,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _title(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        Utils.getLocaleMessage(LocaleKeys.profileDateOfBirthTitle),
        style: AppTextStyle.bold.s14
            .copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
