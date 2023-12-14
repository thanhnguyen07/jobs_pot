// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_list_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecentListResponseEntityImpl _$$RecentListResponseEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$RecentListResponseEntityImpl(
      results: (json['results'] as List<dynamic>)
          .map((e) => RecentListEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$$RecentListResponseEntityImplToJson(
        _$RecentListResponseEntityImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
      'msg': instance.msg,
    };
