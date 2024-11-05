import 'dart:io';

import 'package:ai_assiatant_flutter/core/constants/constants.dart';
import 'package:ai_assiatant_flutter/core/errors/failures.dart';
import 'package:ai_assiatant_flutter/domain/data_sources/firebase_data_source.dart';
import 'package:ai_assiatant_flutter/domain/entities/qAndA/q_and_a.dart';
import 'package:ai_assiatant_flutter/domain/repositories/docs_repository.dart';
import 'package:ai_assiatant_flutter/domain/repositories/translations_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@Injectable(as: TranslationsRepository)
class TranslationsRepositoryImpl implements TranslationsRepository {
  final FirebaseDataSource firebaseDataSource;

  TranslationsRepositoryImpl({required this.firebaseDataSource});

  @override
  Future<Either<Failure, Map<String, String>>> getTranslations(
      {required String locale}) async {
    try {
      final result = await firebaseDataSource.getOneFromFirebaseDB(
        collectionName: FirebaseCollections.assets.name,
        docReference: 'textContent',
      );
      if (result.exists) {
        final data = result.data() as Map<String, dynamic>;

        final stringData = data[locale]
            ?.map((key, value) => MapEntry(key.toString(), value.toString()));

        return Right(Map<String, String>.from(stringData ?? {}));
      } else {
        return const Left(Failure.notFound());
      }
    } catch (e) {
      return Left(Failure.serverError(errorMessage: e.toString()));
    }
  }
}
