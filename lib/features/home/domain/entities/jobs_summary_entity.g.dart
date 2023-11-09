// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs_summary_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobsSummaryEntityImpl _$$JobsSummaryEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$JobsSummaryEntityImpl(
      fullTime:
          JobSummaryEntity.fromJson(json['fullTime'] as Map<String, dynamic>),
      partTime:
          JobSummaryEntity.fromJson(json['partTime'] as Map<String, dynamic>),
      remoteJob:
          JobSummaryEntity.fromJson(json['remoteJob'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$JobsSummaryEntityImplToJson(
        _$JobsSummaryEntityImpl instance) =>
    <String, dynamic>{
      'fullTime': instance.fullTime,
      'partTime': instance.partTime,
      'remoteJob': instance.remoteJob,
    };
