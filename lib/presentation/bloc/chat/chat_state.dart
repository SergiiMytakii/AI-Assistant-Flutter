import 'package:ai_assiatant_flutter/domain/entities/chat/chat_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default([]) List<ChatMessage> messages,
    String? errorMessage,
    @Default(false) bool isLoading,
  }) = _ChatState;
}
