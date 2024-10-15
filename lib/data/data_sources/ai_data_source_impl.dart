import 'package:ai_assiatant_flutter/domain/data_sources/ai_data_source.dart';
import 'package:ai_assiatant_flutter/main.dart';
import 'package:injectable/injectable.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

final memory = ConversationBufferMemory(returnMessages: true);

@dev
@prod
@Injectable(as: AiDataSource)
class AiDataSourceImpl implements AiDataSource {
  final llm = ChatOpenAI(
    apiKey: openAIKey,
    defaultOptions: const ChatOpenAIOptions(
      model: 'gpt-4o-mini',
      responseFormat: ChatOpenAIResponseFormat.jsonObject,
    ),
  );
  @override
  Future<Map<String, dynamic>> getAiResponse(
      PromptTemplate promptTemplate, Map<String, dynamic> query) async {
    final chain = promptTemplate.pipe(llm).pipe(JsonOutputParser());
    final result = await chain.invoke(query);
    return result;
  }

  @override
  Future<Map<String, dynamic>> getAiChatResponse(
      ChatPromptTemplate promptTemplate, Map<String, dynamic> query) async {
    print(promptTemplate
        .inputVariables); // Should print {'outputTemplate', 'context', 'input'}
    final chain = Runnable.fromMap({
          'input': Runnable.passthrough(),
          'history': Runnable.mapInput(
            (_) async {
              final m = await memory.loadMemoryVariables();
              return m['history'];
            },
          ),
        }) |
        promptTemplate |
        llm |
        JsonOutputParser();
    final result = await chain.invoke(query) as Map<String, dynamic>;

    await memory.saveContext(
      inputValues: {'input': query['input']},
      outputValues: {'output': result['text']},
    );
    return result;
  }
}
