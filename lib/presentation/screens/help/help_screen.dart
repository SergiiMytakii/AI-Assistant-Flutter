import 'package:ai_assiatant_flutter/injection.dart';
import 'package:ai_assiatant_flutter/presentation/bloc/translations/cubit/translations_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then(
      (value) => getIt<TranslationsCubit>()
          .getTranslations(context.locale.languageCode),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & FAQ'.tr()),
      ),
      body: BlocBuilder<TranslationsCubit, TranslationsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.errorMessage != null) {
            return Center(
              child: Text(
                state.errorMessage!,
                textAlign: TextAlign.center,
              ),
            );
          } else if (state.translations.isNotEmpty) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thank you for using AI assistant!'.tr(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'This is a very simple but powerful tool that can help enhance your client experience!'
                          .tr(),
                    ),
                    const SizedBox(height: 20),
                    _buildExpansionTile('How does it work?'.tr(),
                        state.translations['how_does_it_work'] ?? ''),
                    _buildExpansionTile(
                        'Where AI Assistant Could Be Used?'.tr(),
                        state.translations['where_to_use'] ?? ''),
                    _buildExpansionTile('Key Features'.tr(),
                        state.translations['key_features'] ?? ''),
                    _buildExpansionTile('How to improve the accuracy?'.tr(),
                        state.translations['improve_accuracy_guide'] ?? ''),
                    _buildExpansionTile('Terms and Policies'.tr(),
                        state.translations['terms_and_conditions'] ?? ''),
                    _buildExpansionTile('Versioning'.tr(),
                        state.translations['versioning'] ?? ''),
                    _buildExpansionTile(
                        'Pricing'.tr(), state.translations['pricing'] ?? ''),
                    _buildExpansionTile(
                        'Feedback'.tr(), state.translations['feedback'] ?? ''),
                    const SizedBox(height: 20),
                    Text(
                      '*AI assistant now in Beta!'.tr(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'The AI assistant is now in beta phase, which means it\'s undergoing testing and refinement to improve its functionality and performance.'
                          .tr(),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildExpansionTile(String title, String content) {
    return ExpansionTile(
      title: Text(title),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: html.Html(
            data: content,
            onLinkTap: (url, attributes, element) =>
                launchUrl(Uri.dataFromString(url ?? '')),
            onAnchorTap: (url, attributes, element) =>
                launchUrl(Uri.dataFromString(url ?? '')),
          ),
        ),
      ],
    );
  }
}
