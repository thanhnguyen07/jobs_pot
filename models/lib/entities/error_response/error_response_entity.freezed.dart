// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ErrorResponseEntity _$ErrorResponseEntityFromJson(Map<String, dynamic> json) {
  return _ErrorResponseEntity.fromJson(json);
}

/// @nodoc
mixin _$ErrorResponseEntity {
  String get msg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorResponseEntityCopyWith<ErrorResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorResponseEntityCopyWith<$Res> {
  factory $ErrorResponseEntityCopyWith(
          ErrorResponseEntity value, $Res Function(ErrorResponseEntity) then) =
      _$ErrorResponseEntityCopyWithImpl<$Res, ErrorResponseEntity>;
  @useResult
  $Res call({String msg});
}

/// @nodoc
class _$ErrorResponseEntityCopyWithImpl<$Res, $Val extends ErrorResponseEntity>
    implements $ErrorResponseEntityCopyWith<$Res> {
  _$ErrorResponseEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$ErrorResponseEntityImplCopyWith<$Res>
    implements $ErrorResponseEntityCopyWith<$Res> {
  factory _$$ErrorResponseEntityImplCopyWith(_$ErrorResponseEntityImpl value,
          $Res Function(_$ErrorResponseEntityImpl) then) =
      __$$ErrorResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String msg});
}

/// @nodoc
class __$$ErrorResponseEntityImplCopyWithImpl<$Res>
    extends _$ErrorResponseEntityCopyWithImpl<$Res, _$ErrorResponseEntityImpl>
    implements _$$ErrorResponseEntityImplCopyWith<$Res> {
  __$$ErrorResponseEntityImplCopyWithImpl(_$ErrorResponseEntityImpl _value,
      $Res Function(_$ErrorResponseEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$ErrorResponseEntityImpl(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorResponseEntityImpl implements _ErrorResponseEntity {
  const _$ErrorResponseEntityImpl({required this.msg});

  factory _$ErrorResponseEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorResponseEntityImplFromJson(json);

  @override
  final String msg;

  @override
  String toString() {
    return 'ErrorResponseEntity(msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorResponseEntityImpl &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorResponseEntityImplCopyWith<_$ErrorResponseEntityImpl> get copyWith =>
      __$$ErrorResponseEntityImplCopyWithImpl<_$ErrorResponseEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorResponseEntityImplToJson(
      this,
    );
  }
}

abstract class _ErrorResponseEntity implements ErrorResponseEntity {
  const factory _ErrorResponseEntity({required final String msg}) =
      _$ErrorResponseEntityImpl;

  factory _ErrorResponseEntity.fromJson(Map<String, dynamic> json) =
      _$ErrorResponseEntityImpl.fromJson;

  @override
  String get msg;
  @override
  @JsonKey(ignore: true)
  _$$ErrorResponseEntityImplCopyWith<_$ErrorResponseEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
