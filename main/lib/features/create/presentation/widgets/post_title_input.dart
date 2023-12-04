import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/input_reactive_forms.dart';
import 'package:jobs_pot/features/create/create_provider.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PostTitleInput extends ConsumerStatefulWidget {
  const PostTitleInput({
    super.key,
  });

  @override
  ConsumerState<PostTitleInput> createState() => _PostTitleInputState();
}

class _PostTitleInputState extends ConsumerState<PostTitleInput> {
  FormControl<dynamic>? formControlPostTitle;

  late FormGroup _createPostInputForm;

  @override
  void initState() {
    super.initState();

    _createPostInputForm =
        ref.read(createPostController.notifier).getCreatePostInputForm();

    _createPostInputForm.reset();

    formControlPostTitle =
        _createPostInputForm.control(ValidationKeys.postTitle) as FormControl?;
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);

    return InputReactiveForms(
      hintText: Utils.getLocaleMessage(LocaleKeys.postPostTitleHint),
      obscureText: false,
      formController: formControlPostTitle,
      title: Text(
        Utils.getLocaleMessage(LocaleKeys.postPostTitle),
        style: AppTextStyle.darkPurpleBoldS12,
      ),
      validationMessages: {
        ValidationKeys.required: (error) =>
            Utils.getLocaleMessage(LocaleKeys.authenticationInputRequired),
      },
    );
  }
}
