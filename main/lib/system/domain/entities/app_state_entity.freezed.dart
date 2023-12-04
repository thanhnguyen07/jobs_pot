// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppStateEntity {
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateEntityCopyWith<AppStateEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateEntityCopyWith<$Res> {
  factory $AppStateEntityCopyWith(
          AppStateEntity value, $Res Function(AppStateEntity) then) =
      _$AppStateEntityCopyWithImpl<$Res, AppStateEntity>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AppStateEntityCopyWithImpl<$Res, $Val extends AppStateEntity>
    implements $AppStateEntityCopyWith<$Res> {
  _$AppStateEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppStateEntityImplCopyWith<$Res>
    implements $AppStateEntityCopyWith<$Res> {
  factory _$$AppStateEntityImplCopyWith(_$AppStateEntityImpl value,
          $Res Function(_$AppStateEntityImpl) then) =
      __$$AppStateEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AppStateEntityImplCopyWithImpl<$Res>
    extends _$AppStateEntityCopyWithImpl<$Res, _$AppStateEntityImpl>
    implements _$$AppStateEntityImplCopyWith<$Res> {
  __$$AppStateEntityImplCopyWithImpl(
      _$AppStateEntityImpl _value, $Res Function(_$AppStateEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AppStateEntityImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AppStateEntityImpl implements _AppStateEntity {
  const _$AppStateEntityImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AppStateEntity(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateEntityImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateEntityImplCopyWith<_$AppStateEntityImpl> get copyWith =>
      __$$AppStateEntityImplCopyWithImpl<_$AppStateEntityImpl>(
          this, _$identity);
}

abstract class _AppStateEntity implements AppStateEntity {
  const factory _AppStateEntity({required final String message}) =
      _$AppStateEntityImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$AppStateEntityImplCopyWith<_$AppStateEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
