// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_number_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhoneNumberEntityImpl _$$PhoneNumberEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$PhoneNumberEntityImpl(
      phoneNumber: json['phoneNumber'] as String?,
      dialCode: json['dialCode'] as String?,
      isoCode: json['isoCode'] as String?,
    );

Map<String, dynamic> _$$PhoneNumberEntityImplToJson(
        _$PhoneNumberEntityImpl instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'dialCode': instance.dialCode,
      'isoCode': instance.isoCode,
    };
