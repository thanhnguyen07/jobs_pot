// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_code_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerificationCodeEntity _$VerificationCodeEntityFromJson(
    Map<String, dynamic> json) {
  return _VerificationCodeEntity.fromJson(json);
}

/// @nodoc
mixin _$VerificationCodeEntity {
  String get msg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerificationCodeEntityCopyWith<VerificationCodeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationCodeEntityCopyWith<$Res> {
  factory $VerificationCodeEntityCopyWith(VerificationCodeEntity value,
          $Res Function(VerificationCodeEntity) then) =
      _$VerificationCodeEntityCopyWithImpl<$Res, VerificationCodeEntity>;
  @useResult
  $Res call({String msg});
}

/// @nodoc
class _$VerificationCodeEntityCopyWithImpl<$Res,
        $Val extends VerificationCodeEntity>
    implements $VerificationCodeEntityCopyWith<$Res> {
  _$VerificationCodeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_value.copyWith(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerificationCodeEntityImplCopyWith<$Res>
    implements $VerificationCodeEntityCopyWith<$Res> {
  factory _$$VerificationCodeEntityImplCopyWith(
          _$VerificationCodeEntityImpl value,
          $Res Function(_$VerificationCodeEntityImpl) then) =
      __$$VerificationCodeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String msg});
}

/// @nodoc
class __$$VerificationCodeEntityImplCopyWithImpl<$Res>
    extends _$VerificationCodeEntityCopyWithImpl<$Res,
        _$VerificationCodeEntityImpl>
    implements _$$VerificationCodeEntityImplCopyWith<$Res> {
  __$$VerificationCodeEntityImplCopyWithImpl(
      _$VerificationCodeEntityImpl _value,
      $Res Function(_$VerificationCodeEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$VerificationCodeEntityImpl(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerificationCodeEntityImpl implements _VerificationCodeEntity {
  const _$VerificationCodeEntityImpl({required this.msg});

  factory _$VerificationCodeEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerificationCodeEntityImplFromJson(json);

  @override
  final String msg;

  @override
  String toString() {
    return 'VerificationCodeEntity(msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationCodeEntityImpl &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationCodeEntityImplCopyWith<_$VerificationCodeEntityImpl>
      get copyWith => __$$VerificationCodeEntityImplCopyWithImpl<
          _$VerificationCodeEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationCodeEntityImplToJson(
      this,
    );
  }
}

abstract class _VerificationCodeEntity implements VerificationCodeEntity {
  const factory _VerificationCodeEntity({required final String msg}) =
      _$VerificationCodeEntityImpl;

  factory _VerificationCodeEntity.fromJson(Map<String, dynamic> json) =
      _$VerificationCodeEntityImpl.fromJson;

  @override
  String get msg;
  @override
  @JsonKey(ignore: true)
  _$$VerificationCodeEntityImplCopyWith<_$VerificationCodeEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
