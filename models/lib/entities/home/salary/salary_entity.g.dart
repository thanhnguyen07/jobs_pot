// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalaryEntityImpl _$$SalaryEntityImplFromJson(Map<String, dynamic> json) =>
    _$SalaryEntityImpl(
      amountStart: (json['amount_start'] as num?)?.toDouble(),
      amountEnd: (json['amount_end'] as num?)?.toDouble(),
      amountAvg: (json['amount_avg'] as num?)?.toDouble(),
      type: json['type'] as String,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$$SalaryEntityImplToJson(_$SalaryEntityImpl instance) =>
    <String, dynamic>{
      'amount_start': instance.amountStart,
      'amount_end': instance.amountEnd,
      'amount_avg': instance.amountAvg,
      'type': instance.type,
      'currency': instance.currency,
    };
