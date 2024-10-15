import 'package:freezed_annotation/freezed_annotation.dart';

part 'docs_state.freezed.dart';

@freezed
class DocsCubitState with _$DocsCubitState {
  const factory DocsCubitState({
    String? uploadedFile,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _DocsCubitState;
}
