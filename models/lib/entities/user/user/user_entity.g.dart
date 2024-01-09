// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      userName: json['user_name'] as String,
      email: json['email'] as String,
      uid: json['uid'] as String,
      emailVerified: json['email_verified'] as bool,
      providerData: (json['provider_data'] as List<dynamic>)
          .map((e) => ProviderInfoEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      fcmToken: json['fcm_token'] as String?,
      photoUrl: json['photo_url'] as String?,
      backgroundUrl: json['background_url'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      gender: json['gender'] as String?,
      phoneNumber: json['phone_number'] == null
          ? null
          : PhoneNumberEntity.fromJson(
              json['phone_number'] as Map<String, dynamic>),
      location: json['location'] as String?,
      id: json['_id'] as String,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'email': instance.email,
      'uid': instance.uid,
      'email_verified': instance.emailVerified,
      'provider_data': instance.providerData,
      'fcm_token': instance.fcmToken,
      'photo_url': instance.photoUrl,
      'background_url': instance.backgroundUrl,
      'date_of_birth': instance.dateOfBirth,
      'gender': instance.gender,
      'phone_number': instance.phoneNumber,
      'location': instance.location,
      '_id': instance.id,
    };
