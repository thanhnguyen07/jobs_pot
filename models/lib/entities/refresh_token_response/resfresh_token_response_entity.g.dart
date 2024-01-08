// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resfresh_token_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefreshTokenResponseEntityImpl _$$RefreshTokenResponseEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$RefreshTokenResponseEntityImpl(
      token: json['token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$$RefreshTokenResponseEntityImplToJson(
        _$RefreshTokenResponseEntityImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refresh_token': instance.refreshToken,
      'msg': instance.msg,
    };
