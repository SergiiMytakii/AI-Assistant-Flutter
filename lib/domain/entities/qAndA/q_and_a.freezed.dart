// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'q_and_a.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QandAdocument _$QandAdocumentFromJson(Map<String, dynamic> json) {
  return _QandAdocument.fromJson(json);
}

/// @nodoc
mixin _$QandAdocument {
  List<Map<String, dynamic>> get doc => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QandAdocumentCopyWith<QandAdocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QandAdocumentCopyWith<$Res> {
  factory $QandAdocumentCopyWith(
          QandAdocument value, $Res Function(QandAdocument) then) =
      _$QandAdocumentCopyWithImpl<$Res, QandAdocument>;
  @useResult
  $Res call({List<Map<String, dynamic>> doc, String fileName});
}

/// @nodoc
class _$QandAdocumentCopyWithImpl<$Res, $Val extends QandAdocument>
    implements $QandAdocumentCopyWith<$Res> {
  _$QandAdocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doc = null,
    Object? fileName = null,
  }) {
    return _then(_value.copyWith(
      doc: null == doc
          ? _value.doc
          : doc // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QandAdocumentImplCopyWith<$Res>
    implements $QandAdocumentCopyWith<$Res> {
  factory _$$QandAdocumentImplCopyWith(
          _$QandAdocumentImpl value, $Res Function(_$QandAdocumentImpl) then) =
      __$$QandAdocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Map<String, dynamic>> doc, String fileName});
}

/// @nodoc
class __$$QandAdocumentImplCopyWithImpl<$Res>
    extends _$QandAdocumentCopyWithImpl<$Res, _$QandAdocumentImpl>
    implements _$$QandAdocumentImplCopyWith<$Res> {
  __$$QandAdocumentImplCopyWithImpl(
      _$QandAdocumentImpl _value, $Res Function(_$QandAdocumentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doc = null,
    Object? fileName = null,
  }) {
    return _then(_$QandAdocumentImpl(
      doc: null == doc
          ? _value._doc
          : doc // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QandAdocumentImpl implements _QandAdocument {
  const _$QandAdocumentImpl(
      {required final List<Map<String, dynamic>> doc, required this.fileName})
      : _doc = doc;

  factory _$QandAdocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$QandAdocumentImplFromJson(json);

  final List<Map<String, dynamic>> _doc;
  @override
  List<Map<String, dynamic>> get doc {
    if (_doc is EqualUnmodifiableListView) return _doc;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doc);
  }

  @override
  final String fileName;

  @override
  String toString() {
    return 'QandAdocument(doc: $doc, fileName: $fileName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QandAdocumentImpl &&
            const DeepCollectionEquality().equals(other._doc, _doc) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_doc), fileName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QandAdocumentImplCopyWith<_$QandAdocumentImpl> get copyWith =>
      __$$QandAdocumentImplCopyWithImpl<_$QandAdocumentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QandAdocumentImplToJson(
      this,
    );
  }
}

abstract class _QandAdocument implements QandAdocument {
  const factory _QandAdocument(
      {required final List<Map<String, dynamic>> doc,
      required final String fileName}) = _$QandAdocumentImpl;

  factory _QandAdocument.fromJson(Map<String, dynamic> json) =
      _$QandAdocumentImpl.fromJson;

  @override
  List<Map<String, dynamic>> get doc;
  @override
  String get fileName;
  @override
  @JsonKey(ignore: true)
  _$$QandAdocumentImplCopyWith<_$QandAdocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QandA _$QandAFromJson(Map<String, dynamic> json) {
  return _QandA.fromJson(json);
}

/// @nodoc
mixin _$QandA {
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QandACopyWith<QandA> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QandACopyWith<$Res> {
  factory $QandACopyWith(QandA value, $Res Function(QandA) then) =
      _$QandACopyWithImpl<$Res, QandA>;
  @useResult
  $Res call({String question, String answer});
}

/// @nodoc
class _$QandACopyWithImpl<$Res, $Val extends QandA>
    implements $QandACopyWith<$Res> {
  _$QandACopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QandAImplCopyWith<$Res> implements $QandACopyWith<$Res> {
  factory _$$QandAImplCopyWith(
          _$QandAImpl value, $Res Function(_$QandAImpl) then) =
      __$$QandAImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String question, String answer});
}

/// @nodoc
class __$$QandAImplCopyWithImpl<$Res>
    extends _$QandACopyWithImpl<$Res, _$QandAImpl>
    implements _$$QandAImplCopyWith<$Res> {
  __$$QandAImplCopyWithImpl(
      _$QandAImpl _value, $Res Function(_$QandAImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_$QandAImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QandAImpl implements _QandA {
  const _$QandAImpl({required this.question, required this.answer});

  factory _$QandAImpl.fromJson(Map<String, dynamic> json) =>
      _$$QandAImplFromJson(json);

  @override
  final String question;
  @override
  final String answer;

  @override
  String toString() {
    return 'QandA(question: $question, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QandAImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, question, answer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QandAImplCopyWith<_$QandAImpl> get copyWith =>
      __$$QandAImplCopyWithImpl<_$QandAImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QandAImplToJson(
      this,
    );
  }
}

abstract class _QandA implements QandA {
  const factory _QandA(
      {required final String question,
      required final String answer}) = _$QandAImpl;

  factory _QandA.fromJson(Map<String, dynamic> json) = _$QandAImpl.fromJson;

  @override
  String get question;
  @override
  String get answer;
  @override
  @JsonKey(ignore: true)
  _$$QandAImplCopyWith<_$QandAImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
