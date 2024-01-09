// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProviderInfoEntityImpl _$$ProviderInfoEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ProviderInfoEntityImpl(
      uid: json['uid'] as String?,
      displayName: json['displayName'] as String?,
      email: json['email'] as String,
      photoURL: json['photoURL'] as String?,
      providerId: json['providerId'] as String,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$$ProviderInfoEntityImplToJson(
        _$ProviderInfoEntityImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'displayName': instance.displayName,
      'email': instance.email,
      'photoURL': instance.photoURL,
      'providerId': instance.providerId,
      'phoneNumber': instance.phoneNumber,
    };
