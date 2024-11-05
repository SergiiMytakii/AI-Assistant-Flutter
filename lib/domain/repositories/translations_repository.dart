import 'package:ai_assiatant_flutter/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class TranslationsRepository {
  Future<Either<Failure, Map<String, String>>> getTranslations(
      {required String locale});
}
