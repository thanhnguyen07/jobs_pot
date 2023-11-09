// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provider_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProviderInfoEntity _$ProviderInfoEntityFromJson(Map<String, dynamic> json) {
  return _ProviderInfoEntity.fromJson(json);
}

/// @nodoc
mixin _$ProviderInfoEntity {
  String? get uid => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get photoURL => throw _privateConstructorUsedError;
  String get providerId => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProviderInfoEntityCopyWith<ProviderInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProviderInfoEntityCopyWith<$Res> {
  factory $ProviderInfoEntityCopyWith(
          ProviderInfoEntity value, $Res Function(ProviderInfoEntity) then) =
      _$ProviderInfoEntityCopyWithImpl<$Res, ProviderInfoEntity>;
  @useResult
  $Res call(
      {String? uid,
      String? displayName,
      String email,
      String? photoURL,
      String providerId,
      String? phoneNumber});
}

/// @nodoc
class _$ProviderInfoEntityCopyWithImpl<$Res, $Val extends ProviderInfoEntity>
    implements $ProviderInfoEntityCopyWith<$Res> {
  _$ProviderInfoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? displayName = freezed,
    Object? email = null,
    Object? photoURL = freezed,
    Object? providerId = null,
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProviderInfoEntityImplCopyWith<$Res>
    implements $ProviderInfoEntityCopyWith<$Res> {
  factory _$$ProviderInfoEntityImplCopyWith(_$ProviderInfoEntityImpl value,
          $Res Function(_$ProviderInfoEntityImpl) then) =
      __$$ProviderInfoEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      String? displayName,
      String email,
      String? photoURL,
      String providerId,
      String? phoneNumber});
}

/// @nodoc
class __$$ProviderInfoEntityImplCopyWithImpl<$Res>
    extends _$ProviderInfoEntityCopyWithImpl<$Res, _$ProviderInfoEntityImpl>
    implements _$$ProviderInfoEntityImplCopyWith<$Res> {
  __$$ProviderInfoEntityImplCopyWithImpl(_$ProviderInfoEntityImpl _value,
      $Res Function(_$ProviderInfoEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? displayName = freezed,
    Object? email = null,
    Object? photoURL = freezed,
    Object? providerId = null,
    Object? phoneNumber = freezed,
  }) {
    return _then(_$ProviderInfoEntityImpl(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProviderInfoEntityImpl implements _ProviderInfoEntity {
  const _$ProviderInfoEntityImpl(
      {this.uid,
      this.displayName,
      required this.email,
      this.photoURL,
      required this.providerId,
      this.phoneNumber});

  factory _$ProviderInfoEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProviderInfoEntityImplFromJson(json);

  @override
  final String? uid;
  @override
  final String? displayName;
  @override
  final String email;
  @override
  final String? photoURL;
  @override
  final String providerId;
  @override
  final String? phoneNumber;

  @override
  String toString() {
    return 'ProviderInfoEntity(uid: $uid, displayName: $displayName, email: $email, photoURL: $photoURL, providerId: $providerId, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProviderInfoEntityImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.photoURL, photoURL) ||
                other.photoURL == photoURL) &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, displayName, email, photoURL, providerId, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProviderInfoEntityImplCopyWith<_$ProviderInfoEntityImpl> get copyWith =>
      __$$ProviderInfoEntityImplCopyWithImpl<_$ProviderInfoEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProviderInfoEntityImplToJson(
      this,
    );
  }
}

abstract class _ProviderInfoEntity implements ProviderInfoEntity {
  const factory _ProviderInfoEntity(
      {final String? uid,
      final String? displayName,
      required final String email,
      final String? photoURL,
      required final String providerId,
      final String? phoneNumber}) = _$ProviderInfoEntityImpl;

  factory _ProviderInfoEntity.fromJson(Map<String, dynamic> json) =
      _$ProviderInfoEntityImpl.fromJson;

  @override
  String? get uid;
  @override
  String? get displayName;
  @override
  String get email;
  @override
  String? get photoURL;
  @override
  String get providerId;
  @override
  String? get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$ProviderInfoEntityImplCopyWith<_$ProviderInfoEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
