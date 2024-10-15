import 'package:ai_assiatant_flutter/core/errors/failures.dart';
import 'package:ai_assiatant_flutter/domain/data_sources/ai_data_source.dart';
import 'package:ai_assiatant_flutter/domain/data_sources/supabase_data_source.dart';
import 'package:ai_assiatant_flutter/domain/repositories/chat_repository.dart';
import 'package:ai_assiatant_flutter/main.dart';
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
  Future<void> receiveMessage({required String message}) {
    // TODO: implement receiveMessage
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, chat.ChatMessage>> sendMessage(
      {required String message}) async {
    try {
      final documents =
          await supabaseDataSource.supabaseVectorStore.similaritySearch(
        query: message,
        config: const SupabaseSimilaritySearch(k: 4),
      );
      final context = documents.map((e) => e.pageContent).toList();
      logger.d('context: $context');
      final outputTemplate = {
        'text': 'yor message',
        'videoUrls': 'List of videoUrl if available',
        'imageUrls': 'List of imagegUrl if available',
        'isUserMessage': false,
      };
      final query = {
        'outputTemplate': outputTemplate,
        'context': context,
        'input': message,
      };

      final promptTemplate = PromptTemplate.fromTemplate(r'''
  1. You are a very polite customer support assistant. 
  2. Use only the following context to answer the user request at the end.
  3. Answer only on the original of the request language.
  4. If the user's request is related to small talk or expressing gratitude, respond in a friendly manner without attempting to provide an answer.
  5. If the answer is not available in the context, say something like: '"I'm sorry, I couldn't find a specific answer to your question. Could you rephrase it, or is there anything else I can assist you with?' and confused emoji. (on the original of the request language)
  6. Use emojis with the answer.
  7. If in the answer there is a link to a website, put the link in the answer, but do not say 'here is the link'.
  9. If you feel that the user is angry, say that you are sorry to hear that and sad emoji.
  10. return result as valid JSON using the following structure:
          {outputTemplate}
  Context: {context}
  Request: {input}
  Helpful answer:
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
  Future<Either<Failure, chat.ChatMessage>> sendInitialMessage() async {
    try {
      final document = await supabaseDataSource.supabaseInstance
          .from('documents')
          .select('content')
          .limit(1);

      final outputTemplate = {
        'text': 'yor message',
        'isUserMessage': false,
      };
      final query = {
        'outputTemplate': outputTemplate,
        'context': document.first['content'],
      };

      final promptTemplate = PromptTemplate.fromTemplate(r'''
    You are a very polite customer support assistant.
    You need to do 2 steps:
    1. Detect the initial language. You will be provided with the context and you need to detect what language used there.
    2. Friendly greet the user in the detected language including emoji.
    From the new line continue in the same language with something like: 'I am a customer support assistant and I can talk on different languages. How can I help you?' 
      
    Return result as valid JSON using the following structure:
        {outputTemplate}
    Context: {context}
    Helpful answer:
      ''');
      final res = await aiDataSource.getAiResponse(promptTemplate, query);
      final chatMessage = chat.ChatMessage.fromJson(res);
      return Right(chatMessage);
    } on Exception catch (e) {
      logger.e(e);
      return Left(Failure.openAiError(errorMessage: e.toString()));
    }
  }
}
