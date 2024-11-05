part of 'translations_cubit.dart';

@freezed
class TranslationsState with _$TranslationsState {
  const factory TranslationsState({
    @Default({}) Map<String, String> translations,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _Initial;
}
