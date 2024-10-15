import 'package:ai_assiatant_flutter/domain/data_sources/supabase_data_source.dart';
import 'package:ai_assiatant_flutter/main.dart';
import 'package:injectable/injectable.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:langchain_supabase/langchain_supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sp;

@dev
@prod
@Injectable(as: SupabaseDataSource)
class SupabaseDataSourceImpl implements SupabaseDataSource {
  @override
  Supabase get supabaseVectorStore {
    final embeddings = OpenAIEmbeddings(apiKey: openAIKey);

    return Supabase(
        tableName: 'documents',
        embeddings: embeddings,
        supabaseUrl: 'https://fcyrtxlsonebldebworq.supabase.co',
        supabaseKey: supabaseKey);
  }

  @override
  sp.SupabaseClient get supabaseInstance {
    return sp.Supabase.instance.client;
  }
}
