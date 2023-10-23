// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserEntity _$$_UserEntityFromJson(Map<String, dynamic> json) =>
    _$_UserEntity(
      id: json['id'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      type: json['type'] as String,
      uid: json['uid'] as String,
      isVerifiedEmail: json['isVerifiedEmail'] as bool,
      isVerifiedFacebook: json['isVerifiedFacebook'] as bool,
      isVerifiedGoogle: json['isVerifiedGoogle'] as bool,
      avatarLink: json['avatarLink'] as String?,
      location: json['location'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: json['gender'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$$_UserEntityToJson(_$_UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'type': instance.type,
      'uid': instance.uid,
      'isVerifiedEmail': instance.isVerifiedEmail,
      'isVerifiedFacebook': instance.isVerifiedFacebook,
      'isVerifiedGoogle': instance.isVerifiedGoogle,
      'avatarLink': instance.avatarLink,
      'location': instance.location,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'phoneNumber': instance.phoneNumber,
    };
