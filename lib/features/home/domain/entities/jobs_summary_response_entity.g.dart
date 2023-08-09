// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs_summary_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JobsSummaryResponseEntity _$$_JobsSummaryResponseEntityFromJson(
        Map<String, dynamic> json) =>
    _$_JobsSummaryResponseEntity(
      results:
          JobsSummaryEntity.fromJson(json['results'] as Map<String, dynamic>),
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$$_JobsSummaryResponseEntityToJson(
        _$_JobsSummaryResponseEntity instance) =>
    <String, dynamic>{
      'results': instance.results,
      'msg': instance.msg,
    };
