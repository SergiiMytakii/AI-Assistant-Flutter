import 'package:http/http.dart' as http;
import 'package:langchain/langchain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//added tableName parameter to match_documents function
class MySupabase extends VectorStore {
  /// Creates a new [Supabase] instance.
  ///
  /// Main configuration options:
  /// - [tableName] (default: `documents`): the Supabase table name.
  /// - `supabaseUrl`: the Supabase URL. You can find it in your project's
  ///   [API settings](https://supabase.com/dashboard/project/_/settings/api).
  ///   E.g. `https://xyzcompany.supabase.co`.
  /// - `supabaseKey`: the Supabase API key. You can find it in your project's
  ///   [API settings](https://supabase.com/dashboard/project/_/settings/api).
  ///
  /// Advance configuration options:
  /// - `headers`: overrides the default Supabase client headers.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  MySupabase({
    this.tableName = 'documents',
    required final String supabaseUrl,
    required final String supabaseKey,
    final Map<String, String> headers = const {},
    final http.Client? client,
    required super.embeddings,
  }) : _client = SupabaseClient(
          supabaseUrl,
          supabaseKey,
          headers: headers,
          httpClient: client,
        );

  /// The Supabase client.
  final SupabaseClient _client;

  /// The Supabase table name.
  final String tableName;

  /// The name of the PostgreSQL function that executes the query.
  final String postgresFunctionName = 'match_documents';

  @override
  Future<List<String>> addVectors({
    required final List<List<double>> vectors,
    required final List<Document> documents,
  }) async {
    assert(vectors.length == documents.length);

    final List<Map<String, dynamic>> records = [];
    for (var i = 0; i < documents.length; i++) {
      final doc = documents[i];
      records.add(
        {
          if (doc.id != null) 'id': doc.id,
          'metadata': doc.metadata,
          'content': doc.pageContent,
          'embedding': vectors[i],
        },
      );
    }

    final ids = await _client.from(tableName).upsert(records).select('id');
    return ids
        .map((final row) => row['id'])
        .map((final id) => id.toString())
        .toList(growable: false);
  }

  @override
  Future<void> delete({required final List<String> ids}) {
    return _client.from(tableName).delete().filter('id', 'in', ids);
  }

  @override
  Future<List<(Document, double)>> similaritySearchByVectorWithScores({
    required final List<double> embedding,
    final VectorStoreSimilaritySearch config =
        const VectorStoreSimilaritySearch(),
  }) async {
    final params = {
      'table_name': tableName,
      'query_embedding': embedding,
      'match_count': config.k,
      'match_threshold': config.scoreThreshold ?? 0.0,
      'filter': config.filter ?? {},
    };

    final List<dynamic> result = await _client.rpc(
      postgresFunctionName,
      params: params,
    );
    return result
        .map((final row) => row as Map<String, dynamic>)
        .map(
          (final row) => (
            Document(
              id: row['id'].toString(),
              pageContent: row['content'] as String,
              metadata: row['metadata'] as Map<String, dynamic>,
            ),
            row['similarity'] as double,
          ),
        )
        .toList(growable: false);
  }
}
