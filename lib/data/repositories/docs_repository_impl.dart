import 'dart:io';

import 'package:ai_assiatant_flutter/core/constants/constants.dart';
import 'package:ai_assiatant_flutter/core/errors/failures.dart';
import 'package:ai_assiatant_flutter/domain/data_sources/firebase_data_source.dart';
import 'package:ai_assiatant_flutter/domain/entities/qAndA/q_and_a.dart';
import 'package:ai_assiatant_flutter/domain/repositories/docs_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@Injectable(as: DocsRepository)
class DocsRepositoryImpl implements DocsRepository {
  final FirebaseDataSource firebaseDataSource;

  DocsRepositoryImpl({required this.firebaseDataSource});

  @override
  Future<void> uploadDocument(
      {required String fileName,
      required List<Map<String, dynamic>> data,
      required String documentRef}) async {
    final map = {
      'q&a': {
        'fileName': fileName,
        'doc': data,
      },
    };

    await firebaseDataSource.postToFirebaseDB(
        collectionName: FirebaseCollections.users.name,
        data: map,
        docReference: documentRef);
  }

  @override
  Future<void> deleteDocument({required String path}) async {
    final file = File(path);
    await firebaseDataSource.deleteFromFirebaseDB(
        collectionName: 'documents', id: file.uri.pathSegments.last);
  }

  @override
  Future<Either<Failure, QandAdocument>> getDocument(
      {Map<String, dynamic>? fields, required String docReference}) async {
    try {
      final result = await firebaseDataSource.getOneFromFirebaseDB(
          collectionName: FirebaseCollections.users.name,
          docReference: docReference);
      if (result.exists) {
        final user = result.data() as Map<String, dynamic>;
        final documentData =
            QandAdocument.fromJson(user['q&a'] as Map<String, dynamic>);
        return Right(documentData);
      } else {
        return const Left(Failure.notFound());
      }
    } catch (e) {
      return Left(Failure.serverError(errorMessage: e.toString()));
    }
  }
}
