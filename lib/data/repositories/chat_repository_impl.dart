import 'dart:convert';

import 'package:ai_assiatant_flutter/core/constants/constants.dart';
import 'package:ai_assiatant_flutter/core/errors/failures.dart';
import 'package:ai_assiatant_flutter/domain/data_sources/ai_data_source.dart';
import 'package:ai_assiatant_flutter/domain/data_sources/supabase_data_source.dart';
import 'package:ai_assiatant_flutter/domain/repositories/chat_repository.dart';
import 'package:ai_assiatant_flutter/injection.dart';
import 'package:ai_assiatant_flutter/main.dart';
import 'package:ai_assiatant_flutter/presentation/bloc/auth/auth_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:langchain/langchain.dart';
import 'package:ai_assiatant_flutter/domain/entities/chat/chat_entity.dart'
    as chat;
import 'package:langchain_supabase/langchain_supabase.dart';

@dev
@prod
@Injectable(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final AiDataSource aiDataSource;
  final SupabaseDataSource supabaseDataSource;

  ChatRepositoryImpl(this.supabaseDataSource, {required this.aiDataSource});

  @override
  Future<Either<Failure, List<String>>> getSuggestions() async {
    try {
      final uuid = getIt<AuthenticationBloc>().user?.id;
      if (uuid == null) {
        return const Left(
            Failure.authenticationError(errorMessage: 'User not found'));
      }
      final document = await supabaseDataSource.supabaseInstance
          .from('documents_$uuid')
          .select('content')
          .order('id', ascending: true)
          .limit(50);
      final suggestions = document
          .map((doc) => jsonDecode(doc['content'])['question'].toString())
          .toList();

      return Right(suggestions);
    } on Exception catch (e) {
      logger.e(e);
      return Left(Failure.notFound(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, chat.ChatMessage>> sendMessage(
      {required String message}) async {
    try {
      final documents =
          await supabaseDataSource.supabaseVectorStore.similaritySearch(
        query: message,
        config: const SupabaseSimilaritySearch(k: 2),
      );
      final context = documents.map((e) => e.pageContent).toList();
      final outputTemplate = {
        'text': 'your message',
        'images': [
          {'url': 'url if available', 'caption': 'caption if available'}
        ],
        'videos': [
          {'url': 'url if available', 'caption': 'caption if available'}
        ],
        'isUserMessage': false,
      };
      final query = {
        'outputTemplate': outputTemplate,
        'context': context,
        'input': message,
      };

      final promptTemplate = PromptTemplate.fromTemplate(r'''
          1. You are a polite customer support assistant.
          2. Use the context provided to answer the user's request at the end.
          3. Detect the language of the user's request. **Always** respond in the user's language, not the context's language. Do this even if the context is in a different language.
          4. If the context is in a different language than the user's request, translate the relevant information from the context into the user's language before responding. Ensure your entire response is in the user's language, not the context's language.
            - Example: If the context is in Ukrainian and the user asks in English, translate the relevant context information into English, and then respond fully in English.
          5. If the user's request is small talk or expressing gratitude, respond in a friendly and conversational tone, without needing to use the context.
            - Example: If the user says, "Thank you so much!" respond with something like, "You're welcome! 😊"
          6. If you can't find an answer in the context, politely inform the user in their language, like this: "I'm sorry, I couldn't find a specific answer to your question. Could you rephrase it, or is there anything else I can assist you with? 😕"
          7. Add appropriate emojis to keep the tone friendly.
          8. If the user sounds angry or upset, express sympathy and use a sad emoji.
          9. Compare the user's language with the context's language. if they are different, translate the relevant information from the context into the user's language before responding. Ensure your entire response is in the user's language, not the context's language.
          10. Links for images or videos should go to images or videos fields, not to the main message text. Do not miss them. 
          11. Return result as valid JSON using the following structure: {outputTemplate}
          Context: {context}
          User's Request: {input}
                ''');

      final res = await aiDataSource.getAiResponse(promptTemplate, query);

      //can't make it work now.  try later
      //    final chatPromptTemplate = ChatPromptTemplate.fromPromptMessages([
      //       SystemChatMessagePromptTemplate.fromTemplate(r'''
      // 1. You are a very polite customer support assistant.
      // 2. Use only the following context to answer the user request at the end.
      // 3. Answer only on the original of the request language.
      // 4. If the user's request is related to small talk or expressing gratitude, respond in a friendly manner without attempting to provide an answer.
      // 5. If the answer is not available in the context, say something like: '"I'm sorry, I couldn't find a specific answer to your question. Could you rephrase it, or is there anything else I can assist you with?' and confused emoji. (on the original of the request language)
      // 6. Use emojis with the answer.
      // 7. If in the answer there is a link to a website, put the link in the answer, but do not say 'here is the link'.
      // 9. If you feel that the user is angry, say that you are sorry to hear that and sad emoji.
      // 10. return result as valid JSON using the following structure:
      //         {outputTemplate}
      // Context: {context}
      // Request: {input}
      // Helpful answer:
      //       '''),
      //       const MessagesPlaceholder(variableName: 'history'),
      //       HumanChatMessagePromptTemplate.fromTemplate('{input}'),
      //     ]);
      // final res =
      //     await aiDataSource.getAiChatResponse(chatPromptTemplate, query);

      final chatMessage = chat.ChatMessage.fromJson(res);
      return Right(chatMessage);
    } on Exception catch (e) {
      logger.e(e);
      return Left(Failure.openAiError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, chat.ChatMessage>> sendInitialMessage(
      String initialLanguage) async {
    try {
      final outputTemplate = {
        'text': 'your response',
        'isUserMessage': false,
      };
      final query = {
        'outputTemplate': outputTemplate,
        'initialLanguage': languagesCodes[initialLanguage],
      };

      final promptTemplate = PromptTemplate.fromTemplate(r'''
    You are a very polite customer support assistant.
    Friendly greet the user in {initialLanguage} language including emoji.
    From the new line continue in the same language with something like: 'I am a customer support assistant and I can talk on different languages. How can I help you?' 
      
    Return result as valid JSON using the following structure:
        {outputTemplate}
      ''');
      final res = await aiDataSource.getAiResponse(promptTemplate, query);
      final chatMessage = chat.ChatMessage.fromJson(res);
      return Right(chatMessage);
    } on Exception catch (e) {
      logger.e(e);
      return Left(Failure.openAiError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getInitialLanguage() async {
    try {
      final uuid = getIt<AuthenticationBloc>().user?.id;
      if (uuid == null) {
        return const Left(
            Failure.authenticationError(errorMessage: 'User not found'));
      }
      final document = await supabaseDataSource.supabaseInstance
          .from('documents_$uuid')
          .select('content')
          .limit(1);

      final query = {
        'sample_of_the_text': document.first['content'],
      };

      final promptTemplate = PromptTemplate.fromTemplate(r'''
  You will be provided with the sample of the text.
  Your task is to detect the language of the text.
  Return result as language code. (e.g. en, ru, uk, etc.)
  Sample of the text: {sample_of_the_text}
    ''');
      final res = await aiDataSource.getStringAiResponse(promptTemplate, query);
      return Right(res);
    } on Exception catch (e) {
      logger.e(e);
      return Left(Failure.openAiError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> translateSuggestions(
      String language) async {
    try {
      final uuid = getIt<AuthenticationBloc>().user?.id;
      if (uuid == null) {
        return const Left(
            Failure.authenticationError(errorMessage: 'User not found'));
      }
      final document = await supabaseDataSource.supabaseInstance
          .from('documents_$uuid')
          .select('content')
          .order('id', ascending: true)
          .limit(25);
      final suggestions = document
          .map((doc) => jsonDecode(doc['content'])['question'].toString())
          .toList();
      final outputTemplate = {
        'suggestions': ['translated suggestion 1', 'translated suggestion 2'],
      };
      final query = {
        'outputTemplate': outputTemplate,
        'suggestions': suggestions,
        'language': language,
      };

      final promptTemplate = PromptTemplate.fromTemplate(r'''
    You will be provided with a list of suggestions.
    Your task is to translate all the suggestions into {language} language.
    Return result as valid JSON using the following structure: {outputTemplate}.
    Suggestions: {suggestions}.
      ''');
      final res = await aiDataSource.getAiResponse(promptTemplate, query);

      return Right(List<String>.from(res['suggestions']));
    } on Exception catch (e) {
      logger.e(e);
      return Left(Failure.notFound(errorMessage: e.toString()));
    }
  }
}
