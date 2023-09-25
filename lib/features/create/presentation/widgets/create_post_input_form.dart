import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/create/create_provider.dart';
import 'package:jobs_pot/features/create/presentation/widgets/post_description_input.dart';
import 'package:jobs_pot/features/create/presentation/widgets/post_title_input.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CraetePostInputForm extends ConsumerStatefulWidget {
  const CraetePostInputForm({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CraetePostInputFormState();
}

class _CraetePostInputFormState extends ConsumerState<CraetePostInputForm> {
  late FormGroup _createPostInputForm;

  @override
  void initState() {
    super.initState();

    _createPostInputForm =
        ref.read(createPostController.notifier).getCreatePostInputForm();

    _createPostInputForm.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostTitleInput(),
          PostDescriptionInput(),
        ],
      ),
    );
  }
}
