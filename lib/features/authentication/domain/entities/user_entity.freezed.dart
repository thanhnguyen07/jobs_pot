// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return _UserEntity.fromJson(json);
}

/// @nodoc
mixin _$UserEntity {
  @JsonKey(name: "user_name")
  String get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  @JsonKey(name: "email_verified")
  bool get emailVerified => throw _privateConstructorUsedError;
  @JsonKey(name: "provider_data")
  List<ProviderInfoEntity> get providerData =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "fcm_token")
  String? get fcmToken => throw _privateConstructorUsedError;
  @JsonKey(name: "photo_url")
  String? get photoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "background_url")
  String? get backgroundUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "date_of_birth")
  String? get dateOfBirth => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
          UserEntity value, $Res Function(UserEntity) then) =
      _$UserEntityCopyWithImpl<$Res, UserEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: "user_name") String userName,
      String email,
      String uid,
      @JsonKey(name: "email_verified") bool emailVerified,
      @JsonKey(name: "provider_data") List<ProviderInfoEntity> providerData,
      @JsonKey(name: "fcm_token") String? fcmToken,
      @JsonKey(name: "photo_url") String? photoUrl,
      @JsonKey(name: "background_url") String? backgroundUrl,
      @JsonKey(name: "date_of_birth") String? dateOfBirth,
      String? gender,
      @JsonKey(name: "phone_number") String? phoneNumber,
      String? location,
      @JsonKey(name: "_id") String id});
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res, $Val extends UserEntity>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? email = null,
    Object? uid = null,
    Object? emailVerified = null,
    Object? providerData = null,
    Object? fcmToken = freezed,
    Object? photoUrl = freezed,
    Object? backgroundUrl = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? phoneNumber = freezed,
    Object? location = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      providerData: null == providerData
          ? _value.providerData
          : providerData // ignore: cast_nullable_to_non_nullable
              as List<ProviderInfoEntity>,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundUrl: freezed == backgroundUrl
          ? _value.backgroundUrl
          : backgroundUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserEntityImplCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$UserEntityImplCopyWith(
          _$UserEntityImpl value, $Res Function(_$UserEntityImpl) then) =
      __$$UserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "user_name") String userName,
      String email,
      String uid,
      @JsonKey(name: "email_verified") bool emailVerified,
      @JsonKey(name: "provider_data") List<ProviderInfoEntity> providerData,
      @JsonKey(name: "fcm_token") String? fcmToken,
      @JsonKey(name: "photo_url") String? photoUrl,
      @JsonKey(name: "background_url") String? backgroundUrl,
      @JsonKey(name: "date_of_birth") String? dateOfBirth,
      String? gender,
      @JsonKey(name: "phone_number") String? phoneNumber,
      String? location,
      @JsonKey(name: "_id") String id});
}

/// @nodoc
class __$$UserEntityImplCopyWithImpl<$Res>
    extends _$UserEntityCopyWithImpl<$Res, _$UserEntityImpl>
    implements _$$UserEntityImplCopyWith<$Res> {
  __$$UserEntityImplCopyWithImpl(
      _$UserEntityImpl _value, $Res Function(_$UserEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? email = null,
    Object? uid = null,
    Object? emailVerified = null,
    Object? providerData = null,
    Object? fcmToken = freezed,
    Object? photoUrl = freezed,
    Object? backgroundUrl = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? phoneNumber = freezed,
    Object? location = freezed,
    Object? id = null,
  }) {
    return _then(_$UserEntityImpl(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      providerData: null == providerData
          ? _value._providerData
          : providerData // ignore: cast_nullable_to_non_nullable
              as List<ProviderInfoEntity>,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundUrl: freezed == backgroundUrl
          ? _value.backgroundUrl
          : backgroundUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserEntityImpl implements _UserEntity {
  const _$UserEntityImpl(
      {@JsonKey(name: "user_name") required this.userName,
      required this.email,
      required this.uid,
      @JsonKey(name: "email_verified") required this.emailVerified,
      @JsonKey(name: "provider_data")
      required final List<ProviderInfoEntity> providerData,
      @JsonKey(name: "fcm_token") this.fcmToken,
      @JsonKey(name: "photo_url") this.photoUrl,
      @JsonKey(name: "background_url") this.backgroundUrl,
      @JsonKey(name: "date_of_birth") this.dateOfBirth,
      this.gender,
      @JsonKey(name: "phone_number") this.phoneNumber,
      this.location,
      @JsonKey(name: "_id") required this.id})
      : _providerData = providerData;

  factory _$UserEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserEntityImplFromJson(json);

  @override
  @JsonKey(name: "user_name")
  final String userName;
  @override
  final String email;
  @override
  final String uid;
  @override
  @JsonKey(name: "email_verified")
  final bool emailVerified;
  final List<ProviderInfoEntity> _providerData;
  @override
  @JsonKey(name: "provider_data")
  List<ProviderInfoEntity> get providerData {
    if (_providerData is EqualUnmodifiableListView) return _providerData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_providerData);
  }

  @override
  @JsonKey(name: "fcm_token")
  final String? fcmToken;
  @override
  @JsonKey(name: "photo_url")
  final String? photoUrl;
  @override
  @JsonKey(name: "background_url")
  final String? backgroundUrl;
  @override
  @JsonKey(name: "date_of_birth")
  final String? dateOfBirth;
  @override
  final String? gender;
  @override
  @JsonKey(name: "phone_number")
  final String? phoneNumber;
  @override
  final String? location;
  @override
  @JsonKey(name: "_id")
  final String id;

  @override
  String toString() {
    return 'UserEntity(userName: $userName, email: $email, uid: $uid, emailVerified: $emailVerified, providerData: $providerData, fcmToken: $fcmToken, photoUrl: $photoUrl, backgroundUrl: $backgroundUrl, dateOfBirth: $dateOfBirth, gender: $gender, phoneNumber: $phoneNumber, location: $location, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEntityImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            const DeepCollectionEquality()
                .equals(other._providerData, _providerData) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.backgroundUrl, backgroundUrl) ||
                other.backgroundUrl == backgroundUrl) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userName,
      email,
      uid,
      emailVerified,
      const DeepCollectionEquality().hash(_providerData),
      fcmToken,
      photoUrl,
      backgroundUrl,
      dateOfBirth,
      gender,
      phoneNumber,
      location,
      id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      __$$UserEntityImplCopyWithImpl<_$UserEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserEntityImplToJson(
      this,
    );
  }
}

abstract class _UserEntity implements UserEntity {
  const factory _UserEntity(
      {@JsonKey(name: "user_name") required final String userName,
      required final String email,
      required final String uid,
      @JsonKey(name: "email_verified") required final bool emailVerified,
      @JsonKey(name: "provider_data")
      required final List<ProviderInfoEntity> providerData,
      @JsonKey(name: "fcm_token") final String? fcmToken,
      @JsonKey(name: "photo_url") final String? photoUrl,
      @JsonKey(name: "background_url") final String? backgroundUrl,
      @JsonKey(name: "date_of_birth") final String? dateOfBirth,
      final String? gender,
      @JsonKey(name: "phone_number") final String? phoneNumber,
      final String? location,
      @JsonKey(name: "_id") required final String id}) = _$UserEntityImpl;

  factory _UserEntity.fromJson(Map<String, dynamic> json) =
      _$UserEntityImpl.fromJson;

  @override
  @JsonKey(name: "user_name")
  String get userName;
  @override
  String get email;
  @override
  String get uid;
  @override
  @JsonKey(name: "email_verified")
  bool get emailVerified;
  @override
  @JsonKey(name: "provider_data")
  List<ProviderInfoEntity> get providerData;
  @override
  @JsonKey(name: "fcm_token")
  String? get fcmToken;
  @override
  @JsonKey(name: "photo_url")
  String? get photoUrl;
  @override
  @JsonKey(name: "background_url")
  String? get backgroundUrl;
  @override
  @JsonKey(name: "date_of_birth")
  String? get dateOfBirth;
  @override
  String? get gender;
  @override
  @JsonKey(name: "phone_number")
  String? get phoneNumber;
  @override
  String? get location;
  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
