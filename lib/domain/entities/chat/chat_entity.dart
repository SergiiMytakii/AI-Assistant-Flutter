import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_entity.freezed.dart';
part 'chat_entity.g.dart';

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String text,
    List<String>? imageUrls,
    List<String>? videoUrls,
    required bool isUserMessage,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}
