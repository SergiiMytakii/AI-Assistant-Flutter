import 'package:ai_assiatant_flutter/domain/repositories/translations_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'translations_state.dart';
part 'translations_cubit.freezed.dart';

@singleton
class TranslationsCubit extends Cubit<TranslationsState> {
  TranslationsCubit(this.translationsRepository)
      : super(const TranslationsState());
  final TranslationsRepository translationsRepository;
  Map<String, String> translations = {};

  void getTranslations(String locale) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response =
          await translationsRepository.getTranslations(locale: locale);
      response.fold(
          (failure) => emit(state.copyWith(
              errorMessage: failure.toUserFriendlyMessage(),
              isLoading: false)), (data) {
        translations = data;
        emit(state.copyWith(translations: translations, isLoading: false));
      });
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }
}
