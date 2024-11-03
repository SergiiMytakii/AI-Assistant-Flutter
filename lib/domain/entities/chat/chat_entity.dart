import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_entity.freezed.dart';
part 'chat_entity.g.dart';

@freezed
class ChatMessage with _$ChatMessage {
  @JsonSerializable(explicitToJson: true)
  const factory ChatMessage({
    required String text,
    List<Resource>? images,
    List<Resource>? videos,
    required bool isUserMessage,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}

@freezed
class Resource with _$Resource {
  const factory Resource({
    required String url,
    String? caption,
  }) = _Resource;

  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);
}
