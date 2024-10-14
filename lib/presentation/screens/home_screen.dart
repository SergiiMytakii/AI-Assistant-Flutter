import 'package:ai_assiatant_flutter/injection.dart';
import 'package:ai_assiatant_flutter/presentation/bloc/docs/docs_cubit.dart';
import 'package:ai_assiatant_flutter/presentation/bloc/docs/docs_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getIt<DocsCubit>().fetchDocument();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: getIt<DocsCubit>().pickAndUploadFile,
              child: const Text('Upload CSV File'),
            ),
            BlocBuilder<DocsCubit, DocsCubitState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const CircularProgressIndicator();
                }

                if (state.errorMessage != null) {
                  return Text('Error: ${state.errorMessage}');
                }

                return state.uploadedFile != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            Text('Uploaded file:'.tr()),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Text(state.uploadedFile!),
                                const SizedBox(width: 16),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () =>
                                      getIt<DocsCubit>().deleteFile(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
