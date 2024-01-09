import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_number_entity.freezed.dart';
part 'phone_number_entity.g.dart';

@freezed
class PhoneNumberEntity with _$PhoneNumberEntity {
  const factory PhoneNumberEntity({
    String? phoneNumber,
    String? dialCode,
    String? isoCode,
  }) = _PhoneNumberEntity;

  factory PhoneNumberEntity.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberEntityFromJson(json);
}
