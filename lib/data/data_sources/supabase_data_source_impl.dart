import 'package:ai_assiatant_flutter/data/data_sources/my_supabase.dart';
import 'package:ai_assiatant_flutter/domain/data_sources/supabase_data_source.dart';
import 'package:ai_assiatant_flutter/injection.dart';
import 'package:ai_assiatant_flutter/main.dart';
import 'package:ai_assiatant_flutter/presentation/bloc/auth/auth_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@dev
@prod
@Injectable(as: SupabaseDataSource)
class SupabaseDataSourceImpl implements SupabaseDataSource {
  @override
  MySupabase get supabaseVectorStore {
    final embeddings = OpenAIEmbeddings(apiKey: openAIKey);
    final uuid = getIt<AuthenticationBloc>().user?.id;
    if (uuid != null) {
      return MySupabase(
          tableName: 'documents_$uuid',
          embeddings: embeddings,
          supabaseUrl: 'https://fcyrtxlsonebldebworq.supabase.co',
          supabaseKey: supabaseKey);
    } else {
      throw Exception('User not authenticated');
    }
  }

  @override
  SupabaseClient get supabaseInstance {
    return Supabase.instance.client;
  }
}
