// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserResponseEntity _$$_UserResponseEntityFromJson(
        Map<String, dynamic> json) =>
    _$_UserResponseEntity(
      results: UserEntity.fromJson(json['results'] as Map<String, dynamic>),
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$$_UserResponseEntityToJson(
        _$_UserResponseEntity instance) =>
    <String, dynamic>{
      'results': instance.results,
      'msg': instance.msg,
    };
