// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecentListEntityImpl _$$RecentListEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$RecentListEntityImpl(
      id: json['_id'] as String,
      jobName: json['job_name'] as String,
      companyName: json['company_name'] as String,
      companyAddress: json['company_address'] as String,
      companyAvatar: json['company_avatar'] as String,
      salary: SalaryEntity.fromJson(json['salary'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$RecentListEntityImplToJson(
        _$RecentListEntityImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'job_name': instance.jobName,
      'company_name': instance.companyName,
      'company_address': instance.companyAddress,
      'company_avatar': instance.companyAvatar,
      'salary': instance.salary,
      'tags': instance.tags,
    };
