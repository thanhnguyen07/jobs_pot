// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salary_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SalaryEntity _$SalaryEntityFromJson(Map<String, dynamic> json) {
  return _SalaryEntity.fromJson(json);
}

/// @nodoc
mixin _$SalaryEntity {
  @JsonKey(name: "amount_start")
  double? get amountStart => throw _privateConstructorUsedError;
  @JsonKey(name: "amount_end")
  double? get amountEnd => throw _privateConstructorUsedError;
  @JsonKey(name: "amount_avg")
  double? get amountAvg => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalaryEntityCopyWith<SalaryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryEntityCopyWith<$Res> {
  factory $SalaryEntityCopyWith(
          SalaryEntity value, $Res Function(SalaryEntity) then) =
      _$SalaryEntityCopyWithImpl<$Res, SalaryEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: "amount_start") double? amountStart,
      @JsonKey(name: "amount_end") double? amountEnd,
      @JsonKey(name: "amount_avg") double? amountAvg,
      String type,
      String currency});
}

/// @nodoc
class _$SalaryEntityCopyWithImpl<$Res, $Val extends SalaryEntity>
    implements $SalaryEntityCopyWith<$Res> {
  _$SalaryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amountStart = freezed,
    Object? amountEnd = freezed,
    Object? amountAvg = freezed,
    Object? type = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      amountStart: freezed == amountStart
          ? _value.amountStart
          : amountStart // ignore: cast_nullable_to_non_nullable
              as double?,
      amountEnd: freezed == amountEnd
          ? _value.amountEnd
          : amountEnd // ignore: cast_nullable_to_non_nullable
              as double?,
      amountAvg: freezed == amountAvg
          ? _value.amountAvg
          : amountAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalaryEntityImplCopyWith<$Res>
    implements $SalaryEntityCopyWith<$Res> {
  factory _$$SalaryEntityImplCopyWith(
          _$SalaryEntityImpl value, $Res Function(_$SalaryEntityImpl) then) =
      __$$SalaryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "amount_start") double? amountStart,
      @JsonKey(name: "amount_end") double? amountEnd,
      @JsonKey(name: "amount_avg") double? amountAvg,
      String type,
      String currency});
}

/// @nodoc
class __$$SalaryEntityImplCopyWithImpl<$Res>
    extends _$SalaryEntityCopyWithImpl<$Res, _$SalaryEntityImpl>
    implements _$$SalaryEntityImplCopyWith<$Res> {
  __$$SalaryEntityImplCopyWithImpl(
      _$SalaryEntityImpl _value, $Res Function(_$SalaryEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amountStart = freezed,
    Object? amountEnd = freezed,
    Object? amountAvg = freezed,
    Object? type = null,
    Object? currency = null,
  }) {
    return _then(_$SalaryEntityImpl(
      amountStart: freezed == amountStart
          ? _value.amountStart
          : amountStart // ignore: cast_nullable_to_non_nullable
              as double?,
      amountEnd: freezed == amountEnd
          ? _value.amountEnd
          : amountEnd // ignore: cast_nullable_to_non_nullable
              as double?,
      amountAvg: freezed == amountAvg
          ? _value.amountAvg
          : amountAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalaryEntityImpl implements _SalaryEntity {
  const _$SalaryEntityImpl(
      {@JsonKey(name: "amount_start") this.amountStart,
      @JsonKey(name: "amount_end") this.amountEnd,
      @JsonKey(name: "amount_avg") this.amountAvg,
      required this.type,
      required this.currency});

  factory _$SalaryEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalaryEntityImplFromJson(json);

  @override
  @JsonKey(name: "amount_start")
  final double? amountStart;
  @override
  @JsonKey(name: "amount_end")
  final double? amountEnd;
  @override
  @JsonKey(name: "amount_avg")
  final double? amountAvg;
  @override
  final String type;
  @override
  final String currency;

  @override
  String toString() {
    return 'SalaryEntity(amountStart: $amountStart, amountEnd: $amountEnd, amountAvg: $amountAvg, type: $type, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalaryEntityImpl &&
            (identical(other.amountStart, amountStart) ||
                other.amountStart == amountStart) &&
            (identical(other.amountEnd, amountEnd) ||
                other.amountEnd == amountEnd) &&
            (identical(other.amountAvg, amountAvg) ||
                other.amountAvg == amountAvg) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, amountStart, amountEnd, amountAvg, type, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalaryEntityImplCopyWith<_$SalaryEntityImpl> get copyWith =>
      __$$SalaryEntityImplCopyWithImpl<_$SalaryEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalaryEntityImplToJson(
      this,
    );
  }
}

abstract class _SalaryEntity implements SalaryEntity {
  const factory _SalaryEntity(
      {@JsonKey(name: "amount_start") final double? amountStart,
      @JsonKey(name: "amount_end") final double? amountEnd,
      @JsonKey(name: "amount_avg") final double? amountAvg,
      required final String type,
      required final String currency}) = _$SalaryEntityImpl;

  factory _SalaryEntity.fromJson(Map<String, dynamic> json) =
      _$SalaryEntityImpl.fromJson;

  @override
  @JsonKey(name: "amount_start")
  double? get amountStart;
  @override
  @JsonKey(name: "amount_end")
  double? get amountEnd;
  @override
  @JsonKey(name: "amount_avg")
  double? get amountAvg;
  @override
  String get type;
  @override
  String get currency;
  @override
  @JsonKey(ignore: true)
  _$$SalaryEntityImplCopyWith<_$SalaryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
