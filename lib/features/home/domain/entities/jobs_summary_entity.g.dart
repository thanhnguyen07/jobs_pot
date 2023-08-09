// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs_summary_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JobsSummaryEntity _$$_JobsSummaryEntityFromJson(Map<String, dynamic> json) =>
    _$_JobsSummaryEntity(
      fullTime:
          JobSummaryEntity.fromJson(json['fullTime'] as Map<String, dynamic>),
      partTime:
          JobSummaryEntity.fromJson(json['partTime'] as Map<String, dynamic>),
      remoteJob:
          JobSummaryEntity.fromJson(json['remoteJob'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_JobsSummaryEntityToJson(
        _$_JobsSummaryEntity instance) =>
    <String, dynamic>{
      'fullTime': instance.fullTime,
      'partTime': instance.partTime,
      'remoteJob': instance.remoteJob,
    };
