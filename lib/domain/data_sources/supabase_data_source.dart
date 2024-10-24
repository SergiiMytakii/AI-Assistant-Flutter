import 'package:ai_assiatant_flutter/data/data_sources/my_supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseDataSource {
  MySupabase get supabaseVectorStore;
  SupabaseClient get supabaseInstance;
}
