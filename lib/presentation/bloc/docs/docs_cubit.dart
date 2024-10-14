import 'dart:typed_data';

import 'package:ai_assiatant_flutter/core/utils/csv_to_map.dart';
import 'package:ai_assiatant_flutter/domain/entities/qAndA/q_and_a.dart';
import 'package:ai_assiatant_flutter/domain/repositories/docs_repository.dart';
import 'package:ai_assiatant_flutter/injection.dart';
import 'package:ai_assiatant_flutter/presentation/bloc/auth/auth_bloc.dart';
import 'package:ai_assiatant_flutter/presentation/bloc/docs/docs_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_community/langchain_community.dart';
import 'package:langchain_ollama/langchain_ollama.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

@singleton
class DocsCubit extends Cubit<DocsCubitState> {
  final DocsRepository docsRepository;

  DocsCubit(this.docsRepository) : super(const DocsCubitState());
  List<Map<String, dynamic>> csvData = [];
  String fileName = '';
  Future<void> pickAndUploadFile() async {
    try {
      emit(state.copyWith(isLoading: true));

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        dialogTitle: 'Select a CSV file',
        type: FileType.custom,
        allowedExtensions: ['csv'],
        withData: true, // Ensure the file data is included
      );

      if (result != null && result.files.single.bytes != null) {
        final Uint8List fileBytes = result.files.single.bytes!;
        fileName = result.files.single.name;
        csvData = csvToMap(fileBytes);
      }

      if (csvData.isNotEmpty) {
        final userId = getIt<AuthenticationBloc>().user?.id;
        if (userId != null) {
          {
            await docsRepository.uploadDocument(
                fileName: fileName, data: csvData, documentRef: userId);

            emit(state.copyWith(uploadedFile: fileName, isLoading: false));
          }
        } else {
          emit(state.copyWith(
            errorMessage: 'User not authenticated'.tr(),
            isLoading: false,
          ));
        }
      } else {
        emit(state.copyWith(
          errorMessage: 'The file is empty'.tr(),
          isLoading: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        errorMessage: e.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> deleteFile() async {
    try {
      emit(state.copyWith(isLoading: true));

      if (state.uploadedFile != null) {
        await docsRepository.deleteDocument(path: state.uploadedFile!);
        emit(state.copyWith(uploadedFile: null, isLoading: false));
      }
    } catch (e) {
      emit(state.copyWith(
        errorMessage: e.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> fetchDocument() async {
    try {
      emit(state.copyWith(isLoading: true));
      final userId = getIt<AuthenticationBloc>().user?.id;

      final result = await docsRepository.getDocument(
        docReference: userId ?? '',
      );

      result.fold(
        (failure) => emit(state.copyWith(
          errorMessage: failure.toUserFriendlyMessage(),
          isLoading: false,
        )),
        (document) => emit(state.copyWith(
          uploadedFile: document.fileName,
          isLoading: false,
        )),
      );
    } catch (e) {
      emit(state.copyWith(
        errorMessage: e.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> loadToVectorStore() async {
    final embeddings =
        OllamaEmbeddings(model: 'jina/jina-embeddings-v2-small-en');

    final vectorStore = ObjectBoxVectorStore(
      embeddings: embeddings,
      dimensions: 512,
    );
    final res = await vectorStore.addDocuments(
      documents:
          csvData.map((e) => Document(pageContent: e.toString())).toList(),
    );
  }
}
