// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'docs_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DocsCubitState {
  String? get uploadedFile => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DocsCubitStateCopyWith<DocsCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocsCubitStateCopyWith<$Res> {
  factory $DocsCubitStateCopyWith(
          DocsCubitState value, $Res Function(DocsCubitState) then) =
      _$DocsCubitStateCopyWithImpl<$Res, DocsCubitState>;
  @useResult
  $Res call({String? uploadedFile, bool isLoading, String? errorMessage});
}

/// @nodoc
class _$DocsCubitStateCopyWithImpl<$Res, $Val extends DocsCubitState>
    implements $DocsCubitStateCopyWith<$Res> {
  _$DocsCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uploadedFile = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      uploadedFile: freezed == uploadedFile
          ? _value.uploadedFile
          : uploadedFile // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocsCubitStateImplCopyWith<$Res>
    implements $DocsCubitStateCopyWith<$Res> {
  factory _$$DocsCubitStateImplCopyWith(_$DocsCubitStateImpl value,
          $Res Function(_$DocsCubitStateImpl) then) =
      __$$DocsCubitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? uploadedFile, bool isLoading, String? errorMessage});
}

/// @nodoc
class __$$DocsCubitStateImplCopyWithImpl<$Res>
    extends _$DocsCubitStateCopyWithImpl<$Res, _$DocsCubitStateImpl>
    implements _$$DocsCubitStateImplCopyWith<$Res> {
  __$$DocsCubitStateImplCopyWithImpl(
      _$DocsCubitStateImpl _value, $Res Function(_$DocsCubitStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uploadedFile = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$DocsCubitStateImpl(
      uploadedFile: freezed == uploadedFile
          ? _value.uploadedFile
          : uploadedFile // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DocsCubitStateImpl implements _DocsCubitState {
  const _$DocsCubitStateImpl(
      {this.uploadedFile, this.isLoading = false, this.errorMessage});

  @override
  final String? uploadedFile;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'DocsCubitState(uploadedFile: $uploadedFile, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocsCubitStateImpl &&
            (identical(other.uploadedFile, uploadedFile) ||
                other.uploadedFile == uploadedFile) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, uploadedFile, isLoading, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DocsCubitStateImplCopyWith<_$DocsCubitStateImpl> get copyWith =>
      __$$DocsCubitStateImplCopyWithImpl<_$DocsCubitStateImpl>(
          this, _$identity);
}

abstract class _DocsCubitState implements DocsCubitState {
  const factory _DocsCubitState(
      {final String? uploadedFile,
      final bool isLoading,
      final String? errorMessage}) = _$DocsCubitStateImpl;

  @override
  String? get uploadedFile;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$DocsCubitStateImplCopyWith<_$DocsCubitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
