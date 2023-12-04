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

class PostDescriptionInput extends ConsumerStatefulWidget {
  const PostDescriptionInput({
    super.key,
  });

  @override
  ConsumerState<PostDescriptionInput> createState() =>
      _PostDescriptionInputState();
}

class _PostDescriptionInputState extends ConsumerState<PostDescriptionInput> {
  FormControl<dynamic>? formControlPostDescription; //

  late FormGroup _createPostInputForm;

  @override
  void initState() {
    super.initState();

    _createPostInputForm =
        ref.read(createPostController.notifier).getCreatePostInputForm();

    _createPostInputForm.reset();

    formControlPostDescription = _createPostInputForm
        .control(ValidationKeys.postDescription) as FormControl?;
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);

    return InputReactiveForms(
      hintText: Utils.getLocaleMessage(LocaleKeys.postDescriptionHint),
      obscureText: false,
      maxLine: 6,
      formController: formControlPostDescription,
      title: Text(
        Utils.getLocaleMessage(LocaleKeys.postDescriptionTitle),
        style: AppTextStyle.darkPurpleBoldS12,
      ),
      validationMessages: {
        ValidationKeys.required: (error) =>
            Utils.getLocaleMessage(LocaleKeys.authenticationInputRequired),
      },
    );
  }
}
