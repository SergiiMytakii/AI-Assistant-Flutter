import 'package:ai_assiatant_flutter/domain/entities/chat/chat_entity.dart';
import 'package:ai_assiatant_flutter/domain/repositories/chat_repository.dart';
import 'package:ai_assiatant_flutter/main.dart';
import 'package:ai_assiatant_flutter/presentation/bloc/chat/chat_state.dart';
import 'package:ai_assiatant_flutter/presentation/screens/chat/widget/video_card.dart';
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

  void sendInitialMessage({required String initialLanguage}) async {
    emit(state.copyWith(isLoading: true));
    final result = await chatRepository.sendInitialMessage(initialLanguage);
    result.fold(
      (error) {
        emit(state.copyWith(
            errorMessage: error.toUserFriendlyMessage(), isLoading: false));
      },
      (response) {
        receiveMessage(response);
      },
    );
  }

  void getSuggestions() async {
    emit(state.copyWith(isLoading: true));
    final result = await chatRepository.getSuggestions();
    result.fold(
      (error) {
        emit(state.copyWith(errorMessage: error.toUserFriendlyMessage()));
      },
      (response) {
        emit(state.copyWith(suggestions: response));
      },
    );
  }

  void translateSuggestions(String language) async {
    emit(state.copyWith(isLoading: true));
    final result = await chatRepository.translateSuggestions(language);
    result.fold(
      (error) {
        emit(state.copyWith(
            errorMessage: error.toUserFriendlyMessage(), isLoading: false));
      },
      (response) {
        emit(state.copyWith(suggestions: response, isLoading: false));
      },
    );
  }

  void getInitialLanguage() async {
    final locale = prefs.getString('language');
    if (locale != null) {
      emit(state.copyWith(language: locale));
      sendInitialMessage(initialLanguage: locale);
      translateSuggestions(locale);
    } else {
      final result = await chatRepository.getInitialLanguage();
      result.fold(
        (error) {
          emit(state.copyWith(errorMessage: error.toUserFriendlyMessage()));
        },
        (response) {
          emit(state.copyWith(language: response));
          sendInitialMessage(initialLanguage: response);
          getSuggestions();
        },
      );
    }
  }

  void changeLanguage(String languageCode) async {
    emit(state.copyWith(language: languageCode));
    translateSuggestions(languageCode);
    sendInitialMessage(initialLanguage: languageCode);
  }
}
