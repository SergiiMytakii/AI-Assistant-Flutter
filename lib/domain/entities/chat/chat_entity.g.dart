// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      text: json['text'] as String,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      videoUrls: (json['videoUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isUserMessage: json['isUserMessage'] as bool,
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'imageUrls': instance.imageUrls,
      'videoUrls': instance.videoUrls,
      'isUserMessage': instance.isUserMessage,
    };
