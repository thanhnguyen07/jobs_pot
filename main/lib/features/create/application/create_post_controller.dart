import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs_pot/common/constant/app_enum.dart';
import 'package:jobs_pot/common/constant/app_keys.dart';
import 'package:jobs_pot/common/widgets/modal_bottom_photo.dart';
import 'package:jobs_pot/features/create/create_provider.dart';
import 'package:jobs_pot/features/home_stack/home_stack_provider.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CreatePostController extends StateNotifier<List<XFile>?> {
  CreatePostController(this.ref) : super(null);
  final Ref ref;

  final _createPostInputForm = FormGroup(
    {
      ValidationKeys.postTitle: FormControl<String>(
        value: '',
        validators: [
          Validators.required,
        ],
        touched: true,
      ),
      ValidationKeys.postDescription: FormControl<String>(
        value: '',
        validators: [
          Validators.required,
        ],
        touched: true,
      ),
    },
  );

  void clearInput() {
    _createPostInputForm.reset();
  }

  FormGroup getCreatePostInputForm() => _createPostInputForm;

  String? getInputPostTitle() {
    return _createPostInputForm.controls[ValidationKeys.postTitle]?.value
        ?.toString();
  }

  String? getInputPostDescription() {
    return _createPostInputForm.controls[ValidationKeys.postDescription]?.value
        ?.toString();
  }

  void updateImageData(List<XFile>? imagesData) {
    imagesData != null ? state = [...imagesData] : state = null;
  }

  void onPost(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();

    final CreateScreenType? createScreenType =
        ref.watch(bottomNavigationController);

    final isValid = _createPostInputForm.valid;

    if (isValid) {
      if (createScreenType == CreateScreenType.post) {
        if (state != null) {
          final List<XFile> newData = [...state!];

          newData.removeAt(state!.length - 1);

          ref
              .read(uploadImageToFirebaseController.notifier)
              .uploadImages(newData);
        }
      }
    } else {
      _createPostInputForm.controls.forEach((key, value) {
        if (value.invalid) {
          value.setErrors({
            ValidationKeys.required: LocaleKeys.authenticationInputRequired
          });
        }
      });
    }
  }

  void addImages(BuildContext context) async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return ModalBottomPhoto(
          takePhoto: () {},
          pickFromGallery: () {
            Navigator.pop(context);
            openGallery();
          },
        );
      },
    );
  }

  Future<void> openGallery() async {
    final ImagePicker picker = ImagePicker();
    try {
      final List<XFile> image = await picker.pickMultiImage();
      if (image.isNotEmpty) {
        if (state != null) {
          final List<XFile> newData = [...state!];

          newData.removeAt(state!.length - 1);

          image.add(image[image.length - 1]);

          newData.addAll(image);

          state = newData;
        } else {
          image.add(image[image.length - 1]);

          state = image;
        }
      }
    } catch (e) {
      Utils.showToastGeneralError();
    }
  }

  Future<void> openCamera() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        // uploadImageToFirebase(image);
      }
    } catch (e) {
      Utils.showToastGeneralError();
    }
  }
}
