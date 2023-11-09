// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserResponseEntityImpl _$$UserResponseEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$UserResponseEntityImpl(
      results: UserEntity.fromJson(json['results'] as Map<String, dynamic>),
      token: json['token'] as String,
      refreshToken: json['refresh_token'] as String,
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$$UserResponseEntityImplToJson(
        _$UserResponseEntityImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
      'token': instance.token,
      'refresh_token': instance.refreshToken,
      'msg': instance.msg,
    };
