import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_icons.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
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

    final isValid = _createPostInputForm.valid;

    if (isValid) {
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
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 220,
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Take a new photo or select one from the gallery',
                style: AppTextStyle.blackBoldS16,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.babyBlueColor, // foreground
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.camera,
                            width: 40,
                            height: 40,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Take Picture",
                            style: AppTextStyle.darkPurpleBoldS14,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        openGallery();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.babyBlueColor, // foreground
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.picture,
                            width: 40,
                            height: 40,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Pick from Gallery",
                            style: AppTextStyle.darkPurpleBoldS14,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
      ref.read(systemControllerProvider.notifier).showToastGeneralError();
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
      ref.read(systemControllerProvider.notifier).showToastGeneralError();
    }
  }
}
