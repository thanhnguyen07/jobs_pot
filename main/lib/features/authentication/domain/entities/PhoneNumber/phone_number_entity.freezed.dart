// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_number_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PhoneNumberEntity _$PhoneNumberEntityFromJson(Map<String, dynamic> json) {
  return _PhoneNumberEntity.fromJson(json);
}

/// @nodoc
mixin _$PhoneNumberEntity {
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get dialCode => throw _privateConstructorUsedError;
  String? get isoCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneNumberEntityCopyWith<PhoneNumberEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneNumberEntityCopyWith<$Res> {
  factory $PhoneNumberEntityCopyWith(
          PhoneNumberEntity value, $Res Function(PhoneNumberEntity) then) =
      _$PhoneNumberEntityCopyWithImpl<$Res, PhoneNumberEntity>;
  @useResult
  $Res call({String? phoneNumber, String? dialCode, String? isoCode});
}

/// @nodoc
class _$PhoneNumberEntityCopyWithImpl<$Res, $Val extends PhoneNumberEntity>
    implements $PhoneNumberEntityCopyWith<$Res> {
  _$PhoneNumberEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? dialCode = freezed,
    Object? isoCode = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dialCode: freezed == dialCode
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isoCode: freezed == isoCode
          ? _value.isoCode
          : isoCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhoneNumberEntityImplCopyWith<$Res>
    implements $PhoneNumberEntityCopyWith<$Res> {
  factory _$$PhoneNumberEntityImplCopyWith(_$PhoneNumberEntityImpl value,
          $Res Function(_$PhoneNumberEntityImpl) then) =
      __$$PhoneNumberEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? phoneNumber, String? dialCode, String? isoCode});
}

/// @nodoc
class __$$PhoneNumberEntityImplCopyWithImpl<$Res>
    extends _$PhoneNumberEntityCopyWithImpl<$Res, _$PhoneNumberEntityImpl>
    implements _$$PhoneNumberEntityImplCopyWith<$Res> {
  __$$PhoneNumberEntityImplCopyWithImpl(_$PhoneNumberEntityImpl _value,
      $Res Function(_$PhoneNumberEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? dialCode = freezed,
    Object? isoCode = freezed,
  }) {
    return _then(_$PhoneNumberEntityImpl(
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dialCode: freezed == dialCode
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isoCode: freezed == isoCode
          ? _value.isoCode
          : isoCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhoneNumberEntityImpl implements _PhoneNumberEntity {
  const _$PhoneNumberEntityImpl(
      {this.phoneNumber, this.dialCode, this.isoCode});

  factory _$PhoneNumberEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhoneNumberEntityImplFromJson(json);

  @override
  final String? phoneNumber;
  @override
  final String? dialCode;
  @override
  final String? isoCode;

  @override
  String toString() {
    return 'PhoneNumberEntity(phoneNumber: $phoneNumber, dialCode: $dialCode, isoCode: $isoCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneNumberEntityImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.dialCode, dialCode) ||
                other.dialCode == dialCode) &&
            (identical(other.isoCode, isoCode) || other.isoCode == isoCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, dialCode, isoCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneNumberEntityImplCopyWith<_$PhoneNumberEntityImpl> get copyWith =>
      __$$PhoneNumberEntityImplCopyWithImpl<_$PhoneNumberEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhoneNumberEntityImplToJson(
      this,
    );
  }
}

abstract class _PhoneNumberEntity implements PhoneNumberEntity {
  const factory _PhoneNumberEntity(
      {final String? phoneNumber,
      final String? dialCode,
      final String? isoCode}) = _$PhoneNumberEntityImpl;

  factory _PhoneNumberEntity.fromJson(Map<String, dynamic> json) =
      _$PhoneNumberEntityImpl.fromJson;

  @override
  String? get phoneNumber;
  @override
  String? get dialCode;
  @override
  String? get isoCode;
  @override
  @JsonKey(ignore: true)
  _$$PhoneNumberEntityImplCopyWith<_$PhoneNumberEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
