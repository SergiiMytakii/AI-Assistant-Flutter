import 'package:ai_assiatant_flutter/domain/entities/chat/chat_entity.dart';
import 'package:ai_assiatant_flutter/domain/repositories/chat_repository.dart';
import 'package:ai_assiatant_flutter/presentation/bloc/chat/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class ChatCubit extends Cubit<ChatState> {
  final ChatRepository chatRepository;
  ChatCubit(this.chatRepository) : super(const ChatState());

  void sendMessage(String message) async {
    if (message.isNotEmpty) {
      final newMessage = ChatMessage(
        text: message,
        isUserMessage: true,
      );
      emit(state.copyWith(
        messages: List.from(state.messages)..add(newMessage),
      ));
      emit(state.copyWith(isLoading: true));
      final result = await chatRepository.sendMessage(message: message);
      result.fold(
        (error) {
          emit(state.copyWith(errorMessage: error.toUserFriendlyMessage()));
        },
        (response) {
          receiveMessage(response);
        },
      );
    }
  }

  void receiveMessage(ChatMessage message) {
    emit(state.copyWith(
      messages: List.from(state.messages)
        ..add(message.copyWith(isUserMessage: false)),
      isLoading: false,
    ));
  }

  void sendInitialMessage() async {
    emit(state.copyWith(isLoading: true));
    final result = await chatRepository.sendInitialMessage();
    result.fold(
      (error) {
        emit(state.copyWith(errorMessage: error.toUserFriendlyMessage()));
      },
      (response) {
        receiveMessage(response);
      },
    );
  }
}
