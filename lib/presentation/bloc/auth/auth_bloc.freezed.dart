// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthenticationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkStatus,
    required TResult Function() signOutRequested,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(String email, String password) signUpRequested,
    required TResult Function(String uuid) authenticateByUuid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkStatus,
    TResult? Function()? signOutRequested,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password)? signUpRequested,
    TResult? Function(String uuid)? authenticateByUuid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkStatus,
    TResult Function()? signOutRequested,
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password)? signUpRequested,
    TResult Function(String uuid)? authenticateByUuid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthenticationStatus value) checkStatus,
    required TResult Function(AuthenticationSignOutRequested value)
        signOutRequested,
    required TResult Function(AuthenticationSignInRequested value)
        signInRequested,
    required TResult Function(AuthenticationSignUpRequested value)
        signUpRequested,
    required TResult Function(AuthenticateByUuid value) authenticateByUuid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthenticationStatus value)? checkStatus,
    TResult? Function(AuthenticationSignOutRequested value)? signOutRequested,
    TResult? Function(AuthenticationSignInRequested value)? signInRequested,
    TResult? Function(AuthenticationSignUpRequested value)? signUpRequested,
    TResult? Function(AuthenticateByUuid value)? authenticateByUuid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthenticationStatus value)? checkStatus,
    TResult Function(AuthenticationSignOutRequested value)? signOutRequested,
    TResult Function(AuthenticationSignInRequested value)? signInRequested,
    TResult Function(AuthenticationSignUpRequested value)? signUpRequested,
    TResult Function(AuthenticateByUuid value)? authenticateByUuid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationEventCopyWith<$Res> {
  factory $AuthenticationEventCopyWith(
          AuthenticationEvent value, $Res Function(AuthenticationEvent) then) =
      _$AuthenticationEventCopyWithImpl<$Res, AuthenticationEvent>;
}

/// @nodoc
class _$AuthenticationEventCopyWithImpl<$Res, $Val extends AuthenticationEvent>
    implements $AuthenticationEventCopyWith<$Res> {
  _$AuthenticationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CheckAuthenticationStatusImplCopyWith<$Res> {
  factory _$$CheckAuthenticationStatusImplCopyWith(
          _$CheckAuthenticationStatusImpl value,
          $Res Function(_$CheckAuthenticationStatusImpl) then) =
      __$$CheckAuthenticationStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckAuthenticationStatusImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res,
        _$CheckAuthenticationStatusImpl>
    implements _$$CheckAuthenticationStatusImplCopyWith<$Res> {
  __$$CheckAuthenticationStatusImplCopyWithImpl(
      _$CheckAuthenticationStatusImpl _value,
      $Res Function(_$CheckAuthenticationStatusImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckAuthenticationStatusImpl implements CheckAuthenticationStatus {
  const _$CheckAuthenticationStatusImpl();

  @override
  String toString() {
    return 'AuthenticationEvent.checkStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckAuthenticationStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkStatus,
    required TResult Function() signOutRequested,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(String email, String password) signUpRequested,
    required TResult Function(String uuid) authenticateByUuid,
  }) {
    return checkStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkStatus,
    TResult? Function()? signOutRequested,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password)? signUpRequested,
    TResult? Function(String uuid)? authenticateByUuid,
  }) {
    return checkStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkStatus,
    TResult Function()? signOutRequested,
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password)? signUpRequested,
    TResult Function(String uuid)? authenticateByUuid,
    required TResult orElse(),
  }) {
    if (checkStatus != null) {
      return checkStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthenticationStatus value) checkStatus,
    required TResult Function(AuthenticationSignOutRequested value)
        signOutRequested,
    required TResult Function(AuthenticationSignInRequested value)
        signInRequested,
    required TResult Function(AuthenticationSignUpRequested value)
        signUpRequested,
    required TResult Function(AuthenticateByUuid value) authenticateByUuid,
  }) {
    return checkStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthenticationStatus value)? checkStatus,
    TResult? Function(AuthenticationSignOutRequested value)? signOutRequested,
    TResult? Function(AuthenticationSignInRequested value)? signInRequested,
    TResult? Function(AuthenticationSignUpRequested value)? signUpRequested,
    TResult? Function(AuthenticateByUuid value)? authenticateByUuid,
  }) {
    return checkStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthenticationStatus value)? checkStatus,
    TResult Function(AuthenticationSignOutRequested value)? signOutRequested,
    TResult Function(AuthenticationSignInRequested value)? signInRequested,
    TResult Function(AuthenticationSignUpRequested value)? signUpRequested,
    TResult Function(AuthenticateByUuid value)? authenticateByUuid,
    required TResult orElse(),
  }) {
    if (checkStatus != null) {
      return checkStatus(this);
    }
    return orElse();
  }
}

abstract class CheckAuthenticationStatus implements AuthenticationEvent {
  const factory CheckAuthenticationStatus() = _$CheckAuthenticationStatusImpl;
}

/// @nodoc
abstract class _$$AuthenticationSignOutRequestedImplCopyWith<$Res> {
  factory _$$AuthenticationSignOutRequestedImplCopyWith(
          _$AuthenticationSignOutRequestedImpl value,
          $Res Function(_$AuthenticationSignOutRequestedImpl) then) =
      __$$AuthenticationSignOutRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthenticationSignOutRequestedImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res,
        _$AuthenticationSignOutRequestedImpl>
    implements _$$AuthenticationSignOutRequestedImplCopyWith<$Res> {
  __$$AuthenticationSignOutRequestedImplCopyWithImpl(
      _$AuthenticationSignOutRequestedImpl _value,
      $Res Function(_$AuthenticationSignOutRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthenticationSignOutRequestedImpl
    implements AuthenticationSignOutRequested {
  const _$AuthenticationSignOutRequestedImpl();

  @override
  String toString() {
    return 'AuthenticationEvent.signOutRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationSignOutRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkStatus,
    required TResult Function() signOutRequested,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(String email, String password) signUpRequested,
    required TResult Function(String uuid) authenticateByUuid,
  }) {
    return signOutRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkStatus,
    TResult? Function()? signOutRequested,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password)? signUpRequested,
    TResult? Function(String uuid)? authenticateByUuid,
  }) {
    return signOutRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkStatus,
    TResult Function()? signOutRequested,
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password)? signUpRequested,
    TResult Function(String uuid)? authenticateByUuid,
    required TResult orElse(),
  }) {
    if (signOutRequested != null) {
      return signOutRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthenticationStatus value) checkStatus,
    required TResult Function(AuthenticationSignOutRequested value)
        signOutRequested,
    required TResult Function(AuthenticationSignInRequested value)
        signInRequested,
    required TResult Function(AuthenticationSignUpRequested value)
        signUpRequested,
    required TResult Function(AuthenticateByUuid value) authenticateByUuid,
  }) {
    return signOutRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthenticationStatus value)? checkStatus,
    TResult? Function(AuthenticationSignOutRequested value)? signOutRequested,
    TResult? Function(AuthenticationSignInRequested value)? signInRequested,
    TResult? Function(AuthenticationSignUpRequested value)? signUpRequested,
    TResult? Function(AuthenticateByUuid value)? authenticateByUuid,
  }) {
    return signOutRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthenticationStatus value)? checkStatus,
    TResult Function(AuthenticationSignOutRequested value)? signOutRequested,
    TResult Function(AuthenticationSignInRequested value)? signInRequested,
    TResult Function(AuthenticationSignUpRequested value)? signUpRequested,
    TResult Function(AuthenticateByUuid value)? authenticateByUuid,
    required TResult orElse(),
  }) {
    if (signOutRequested != null) {
      return signOutRequested(this);
    }
    return orElse();
  }
}

abstract class AuthenticationSignOutRequested implements AuthenticationEvent {
  const factory AuthenticationSignOutRequested() =
      _$AuthenticationSignOutRequestedImpl;
}

/// @nodoc
abstract class _$$AuthenticationSignInRequestedImplCopyWith<$Res> {
  factory _$$AuthenticationSignInRequestedImplCopyWith(
          _$AuthenticationSignInRequestedImpl value,
          $Res Function(_$AuthenticationSignInRequestedImpl) then) =
      __$$AuthenticationSignInRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$AuthenticationSignInRequestedImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res,
        _$AuthenticationSignInRequestedImpl>
    implements _$$AuthenticationSignInRequestedImplCopyWith<$Res> {
  __$$AuthenticationSignInRequestedImplCopyWithImpl(
      _$AuthenticationSignInRequestedImpl _value,
      $Res Function(_$AuthenticationSignInRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$AuthenticationSignInRequestedImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthenticationSignInRequestedImpl
    implements AuthenticationSignInRequested {
  const _$AuthenticationSignInRequestedImpl(
      {required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthenticationEvent.signInRequested(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationSignInRequestedImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationSignInRequestedImplCopyWith<
          _$AuthenticationSignInRequestedImpl>
      get copyWith => __$$AuthenticationSignInRequestedImplCopyWithImpl<
          _$AuthenticationSignInRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkStatus,
    required TResult Function() signOutRequested,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(String email, String password) signUpRequested,
    required TResult Function(String uuid) authenticateByUuid,
  }) {
    return signInRequested(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkStatus,
    TResult? Function()? signOutRequested,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password)? signUpRequested,
    TResult? Function(String uuid)? authenticateByUuid,
  }) {
    return signInRequested?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkStatus,
    TResult Function()? signOutRequested,
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password)? signUpRequested,
    TResult Function(String uuid)? authenticateByUuid,
    required TResult orElse(),
  }) {
    if (signInRequested != null) {
      return signInRequested(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthenticationStatus value) checkStatus,
    required TResult Function(AuthenticationSignOutRequested value)
        signOutRequested,
    required TResult Function(AuthenticationSignInRequested value)
        signInRequested,
    required TResult Function(AuthenticationSignUpRequested value)
        signUpRequested,
    required TResult Function(AuthenticateByUuid value) authenticateByUuid,
  }) {
    return signInRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthenticationStatus value)? checkStatus,
    TResult? Function(AuthenticationSignOutRequested value)? signOutRequested,
    TResult? Function(AuthenticationSignInRequested value)? signInRequested,
    TResult? Function(AuthenticationSignUpRequested value)? signUpRequested,
    TResult? Function(AuthenticateByUuid value)? authenticateByUuid,
  }) {
    return signInRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthenticationStatus value)? checkStatus,
    TResult Function(AuthenticationSignOutRequested value)? signOutRequested,
    TResult Function(AuthenticationSignInRequested value)? signInRequested,
    TResult Function(AuthenticationSignUpRequested value)? signUpRequested,
    TResult Function(AuthenticateByUuid value)? authenticateByUuid,
    required TResult orElse(),
  }) {
    if (signInRequested != null) {
      return signInRequested(this);
    }
    return orElse();
  }
}

abstract class AuthenticationSignInRequested implements AuthenticationEvent {
  const factory AuthenticationSignInRequested(
      {required final String email,
      required final String password}) = _$AuthenticationSignInRequestedImpl;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$AuthenticationSignInRequestedImplCopyWith<
          _$AuthenticationSignInRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticationSignUpRequestedImplCopyWith<$Res> {
  factory _$$AuthenticationSignUpRequestedImplCopyWith(
          _$AuthenticationSignUpRequestedImpl value,
          $Res Function(_$AuthenticationSignUpRequestedImpl) then) =
      __$$AuthenticationSignUpRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$AuthenticationSignUpRequestedImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res,
        _$AuthenticationSignUpRequestedImpl>
    implements _$$AuthenticationSignUpRequestedImplCopyWith<$Res> {
  __$$AuthenticationSignUpRequestedImplCopyWithImpl(
      _$AuthenticationSignUpRequestedImpl _value,
      $Res Function(_$AuthenticationSignUpRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$AuthenticationSignUpRequestedImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthenticationSignUpRequestedImpl
    implements AuthenticationSignUpRequested {
  const _$AuthenticationSignUpRequestedImpl(
      {required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthenticationEvent.signUpRequested(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationSignUpRequestedImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationSignUpRequestedImplCopyWith<
          _$AuthenticationSignUpRequestedImpl>
      get copyWith => __$$AuthenticationSignUpRequestedImplCopyWithImpl<
          _$AuthenticationSignUpRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkStatus,
    required TResult Function() signOutRequested,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(String email, String password) signUpRequested,
    required TResult Function(String uuid) authenticateByUuid,
  }) {
    return signUpRequested(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkStatus,
    TResult? Function()? signOutRequested,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password)? signUpRequested,
    TResult? Function(String uuid)? authenticateByUuid,
  }) {
    return signUpRequested?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkStatus,
    TResult Function()? signOutRequested,
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password)? signUpRequested,
    TResult Function(String uuid)? authenticateByUuid,
    required TResult orElse(),
  }) {
    if (signUpRequested != null) {
      return signUpRequested(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthenticationStatus value) checkStatus,
    required TResult Function(AuthenticationSignOutRequested value)
        signOutRequested,
    required TResult Function(AuthenticationSignInRequested value)
        signInRequested,
    required TResult Function(AuthenticationSignUpRequested value)
        signUpRequested,
    required TResult Function(AuthenticateByUuid value) authenticateByUuid,
  }) {
    return signUpRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthenticationStatus value)? checkStatus,
    TResult? Function(AuthenticationSignOutRequested value)? signOutRequested,
    TResult? Function(AuthenticationSignInRequested value)? signInRequested,
    TResult? Function(AuthenticationSignUpRequested value)? signUpRequested,
    TResult? Function(AuthenticateByUuid value)? authenticateByUuid,
  }) {
    return signUpRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthenticationStatus value)? checkStatus,
    TResult Function(AuthenticationSignOutRequested value)? signOutRequested,
    TResult Function(AuthenticationSignInRequested value)? signInRequested,
    TResult Function(AuthenticationSignUpRequested value)? signUpRequested,
    TResult Function(AuthenticateByUuid value)? authenticateByUuid,
    required TResult orElse(),
  }) {
    if (signUpRequested != null) {
      return signUpRequested(this);
    }
    return orElse();
  }
}

abstract class AuthenticationSignUpRequested implements AuthenticationEvent {
  const factory AuthenticationSignUpRequested(
      {required final String email,
      required final String password}) = _$AuthenticationSignUpRequestedImpl;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$AuthenticationSignUpRequestedImplCopyWith<
          _$AuthenticationSignUpRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticateByUuidImplCopyWith<$Res> {
  factory _$$AuthenticateByUuidImplCopyWith(_$AuthenticateByUuidImpl value,
          $Res Function(_$AuthenticateByUuidImpl) then) =
      __$$AuthenticateByUuidImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid});
}

/// @nodoc
class __$$AuthenticateByUuidImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$AuthenticateByUuidImpl>
    implements _$$AuthenticateByUuidImplCopyWith<$Res> {
  __$$AuthenticateByUuidImplCopyWithImpl(_$AuthenticateByUuidImpl _value,
      $Res Function(_$AuthenticateByUuidImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
  }) {
    return _then(_$AuthenticateByUuidImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthenticateByUuidImpl implements AuthenticateByUuid {
  const _$AuthenticateByUuidImpl({required this.uuid});

  @override
  final String uuid;

  @override
  String toString() {
    return 'AuthenticationEvent.authenticateByUuid(uuid: $uuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticateByUuidImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticateByUuidImplCopyWith<_$AuthenticateByUuidImpl> get copyWith =>
      __$$AuthenticateByUuidImplCopyWithImpl<_$AuthenticateByUuidImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkStatus,
    required TResult Function() signOutRequested,
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(String email, String password) signUpRequested,
    required TResult Function(String uuid) authenticateByUuid,
  }) {
    return authenticateByUuid(uuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkStatus,
    TResult? Function()? signOutRequested,
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password)? signUpRequested,
    TResult? Function(String uuid)? authenticateByUuid,
  }) {
    return authenticateByUuid?.call(uuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkStatus,
    TResult Function()? signOutRequested,
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password)? signUpRequested,
    TResult Function(String uuid)? authenticateByUuid,
    required TResult orElse(),
  }) {
    if (authenticateByUuid != null) {
      return authenticateByUuid(uuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckAuthenticationStatus value) checkStatus,
    required TResult Function(AuthenticationSignOutRequested value)
        signOutRequested,
    required TResult Function(AuthenticationSignInRequested value)
        signInRequested,
    required TResult Function(AuthenticationSignUpRequested value)
        signUpRequested,
    required TResult Function(AuthenticateByUuid value) authenticateByUuid,
  }) {
    return authenticateByUuid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckAuthenticationStatus value)? checkStatus,
    TResult? Function(AuthenticationSignOutRequested value)? signOutRequested,
    TResult? Function(AuthenticationSignInRequested value)? signInRequested,
    TResult? Function(AuthenticationSignUpRequested value)? signUpRequested,
    TResult? Function(AuthenticateByUuid value)? authenticateByUuid,
  }) {
    return authenticateByUuid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckAuthenticationStatus value)? checkStatus,
    TResult Function(AuthenticationSignOutRequested value)? signOutRequested,
    TResult Function(AuthenticationSignInRequested value)? signInRequested,
    TResult Function(AuthenticationSignUpRequested value)? signUpRequested,
    TResult Function(AuthenticateByUuid value)? authenticateByUuid,
    required TResult orElse(),
  }) {
    if (authenticateByUuid != null) {
      return authenticateByUuid(this);
    }
    return orElse();
  }
}

abstract class AuthenticateByUuid implements AuthenticationEvent {
  const factory AuthenticateByUuid({required final String uuid}) =
      _$AuthenticateByUuidImpl;

  String get uuid;
  @JsonKey(ignore: true)
  _$$AuthenticateByUuidImplCopyWith<_$AuthenticateByUuidImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res, AuthenticationState>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res, $Val extends AuthenticationState>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthenticationState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthenticationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AuthenticationState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthenticationState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$AuthenticatedImplCopyWith<$Res> {
  factory _$$AuthenticatedImplCopyWith(
          _$AuthenticatedImpl value, $Res Function(_$AuthenticatedImpl) then) =
      __$$AuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$AuthenticatedImpl>
    implements _$$AuthenticatedImplCopyWith<$Res> {
  __$$AuthenticatedImplCopyWithImpl(
      _$AuthenticatedImpl _value, $Res Function(_$AuthenticatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthenticatedImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AuthenticatedImpl implements _Authenticated {
  const _$AuthenticatedImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AuthenticationState.authenticated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      __$$AuthenticatedImplCopyWithImpl<_$AuthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message) error,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message)? error,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Error value) error,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Error value)? error,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated implements AuthenticationState {
  const factory _Authenticated(final User user) = _$AuthenticatedImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthenticatedImplCopyWith<$Res> {
  factory _$$UnauthenticatedImplCopyWith(_$UnauthenticatedImpl value,
          $Res Function(_$UnauthenticatedImpl) then) =
      __$$UnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$UnauthenticatedImpl>
    implements _$$UnauthenticatedImplCopyWith<$Res> {
  __$$UnauthenticatedImplCopyWithImpl(
      _$UnauthenticatedImpl _value, $Res Function(_$UnauthenticatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnauthenticatedImpl implements _Unauthenticated {
  const _$UnauthenticatedImpl();

  @override
  String toString() {
    return 'AuthenticationState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message) error,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message)? error,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Error value) error,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Error value)? error,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated implements AuthenticationState {
  const factory _Unauthenticated() = _$UnauthenticatedImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthenticationState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AuthenticationState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
