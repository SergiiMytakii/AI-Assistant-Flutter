import 'package:ai_assiatant_flutter/core/errors/failures.dart';
import 'package:ai_assiatant_flutter/domain/entities/qAndA/q_and_a.dart';
import 'package:dartz/dartz.dart';

abstract class DocsRepository {
  Future<void> uploadDocument(
      {required String fileName,
      required List<Map<String, dynamic>> data,
      required String documentRef});
  Future<void> deleteDocument({required String path});
  Future<Either<Failure, QandAdocument>> getDocument(
      {Map<String, dynamic>? fields, required String docReference});
}
