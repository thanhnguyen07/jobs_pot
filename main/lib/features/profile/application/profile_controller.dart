import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jobs_pot/common/constant/app_enum.dart';
import 'package:jobs_pot/common/constant/app_keys.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:models/entities/export.dart';
import 'package:jobs_pot/features/profile/profile_provider.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:mime/mime.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProfileController extends StateNotifier<bool> {
  ProfileController(this.ref) : super(false);

  final Ref ref;

  String? _dateOfBirth;
  String? _gender;
  PhoneNumber? _phoneNumberData;

  String? getDateOfBirth() => _dateOfBirth;
  void setDateOfBirth(String? value) => _dateOfBirth = value;

  String? getGender() => _gender;
  void setGender(String? value) => _gender = value;

  Map? getPhoneNumber() {
    return {
      "isoCode": _phoneNumberData?.isoCode,
      "phoneNumber": _phoneNumberData?.phoneNumber,
    };
  }

  void setPhoneNumber(PhoneNumber? data) => _phoneNumberData = data;

  final _profileInputForm = FormGroup(
    {
      ValidationKeys.fullName: FormControl<String>(
        value: '',
        validators: [
          Validators.minLength(3),
        ],
        touched: true,
      ),
      ValidationKeys.location: FormControl<String>(
        value: '',
        touched: true,
      ),
    },
  );

  void clearInput() {
    _profileInputForm.reset();
  }

  Future<void> onSave() async {
    FocusManager.instance.primaryFocus?.unfocus();
    Utils.showLoading();

    UserEntity? userData = ref.read(authControllerProvider);
    if (userData != null) {
      String idUser = userData.id;
      String? userName = getInputName();
      String? location = getInputLocation();
      String? dateOfBirth = getDateOfBirth();
      String? gender = getGender();
      Map? phoneNumber = getPhoneNumber();

      final updateAvatarResult =
          await ref.read(profileResponsitoryProvider).updateInformations(
                userId: idUser,
                userName: userName,
                location: location,
                dateOfBirth: dateOfBirth,
                gender: gender,
                phoneNumber: phoneNumber,
              );

      updateAvatarResult.fold((l) {
        Utils.showToastMessage(l.error);
        Utils.hideLoading();
      }, (r) {
        ref.read(authControllerProvider.notifier).setDataUser(r.results);
        Utils.hideLoading();
        Utils.showToastMessage(r.msg);
      });
    } else {
      Utils.hideLoading();
      showToastGeneralError();
    }
  }

  void showToastGeneralError() {
    Utils.showToastGeneralError();
  }

  FormGroup getProfileInputForm() => _profileInputForm;

  String? getInputName() {
    return _profileInputForm.controls[ValidationKeys.fullName]?.value
        ?.toString();
  }

  String? getInputEmail() {
    return _profileInputForm.controls[ValidationKeys.email]?.value?.toString();
  }

  String? getInputLocation() {
    return _profileInputForm.controls[ValidationKeys.location]?.value
        ?.toString();
  }

  Future<void> updateImage(UploadImageType type) async {
    await ref.read(authControllerProvider.notifier).getUserProfile();

    Utils.showLoading();

    final ImagePicker picker = ImagePicker();
    try {
      final XFile? imageXFile =
          await picker.pickImage(source: ImageSource.gallery);
      if (imageXFile != null) {
        UserEntity? userData = ref.read(authControllerProvider);

        String typeName =
            type == UploadImageType.avatar ? "avatar" : "background";

        String fileExtension = imageXFile.name.split(".").last;

        String fileName = "$typeName.$fileExtension";

        String? originalFileMimeTye = lookupMimeType(imageXFile.path);

        if (originalFileMimeTye != null && userData != null) {
          List<String> originalFileMimeTyeList = originalFileMimeTye.split('/');

          Utils.showLoading();

          await uploadAvatarLinkOnServer(
            filePath: imageXFile.path,
            fileName: fileName,
            contentType: MediaType(
                originalFileMimeTyeList.first, originalFileMimeTyeList.last),
            id: userData.id,
          );

          Utils.hideLoading();
        } else {
          showToastGeneralError();
        }
      }
      Utils.hideLoading();
    } catch (e) {
      Utils.hideLoading();
      showToastGeneralError();
    }
  }

  Future<void> uploadAvatarLinkOnServer({
    required String filePath,
    required String fileName,
    required MediaType contentType,
    required String id,
  }) async {
    UserEntity? userData = ref.read(authControllerProvider);
    String? userId = userData?.id;
    if (userId != null) {
      final updateAvatarResult =
          await ref.read(profileResponsitoryProvider).updateImage(
                filePath: filePath,
                fileName: fileName,
                contentType: contentType,
                id: id,
              );
      updateAvatarResult.fold((l) {
        showToastGeneralError();
      }, (r) {
        ref.read(authControllerProvider.notifier).setDataUser(r.results);

        Utils.showToastMessage(r.msg);
      });
    } else {
      showToastGeneralError();
    }
  }
}
