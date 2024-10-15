import 'package:langchain_supabase/langchain_supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sp;

abstract class SupabaseDataSource {
  Supabase get supabaseVectorStore;
  sp.SupabaseClient get supabaseInstance;
}
