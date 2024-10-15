// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'q_and_a.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QandAdocumentImpl _$$QandAdocumentImplFromJson(Map<String, dynamic> json) =>
    _$QandAdocumentImpl(
      doc: (json['doc'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      fileName: json['fileName'] as String,
    );

Map<String, dynamic> _$$QandAdocumentImplToJson(_$QandAdocumentImpl instance) =>
    <String, dynamic>{
      'doc': instance.doc,
      'fileName': instance.fileName,
    };

_$QandAImpl _$$QandAImplFromJson(Map<String, dynamic> json) => _$QandAImpl(
      question: json['question'] as String,
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$$QandAImplToJson(_$QandAImpl instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
    };
