import 'dart:ui';

import 'package:ai_assiatant_flutter/core/constants/constants.dart';
import 'package:ai_assiatant_flutter/injection.dart';
import 'package:ai_assiatant_flutter/presentation/bloc/auth/auth_bloc.dart';
import 'package:ai_assiatant_flutter/presentation/bloc/docs/docs_cubit.dart';
import 'package:ai_assiatant_flutter/presentation/bloc/docs/docs_state.dart';
import 'package:ai_assiatant_flutter/presentation/screens/widget/alert_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:html' as html;

final qrKey = GlobalKey();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final url = '$domainUrl/${getIt<AuthenticationBloc>().user?.id}';
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
                            Row(
                              children: [
                                Text('Uploaded file:'.tr()),
                                const SizedBox(width: 16),
                                Text(state.uploadedFile!),
                                const SizedBox(width: 16),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () =>
                                      getIt<DocsCubit>().deleteFile(),
                                ),
                              ],
                            ),
                            RepaintBoundary(
                              key: qrKey,
                              child: QrImageView(
                                backgroundColor: Colors.white,
                                data: url,
                                version: QrVersions.auto,
                                size: 200.0,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () => _downloadImage(),
                              child: Text('Download QR Code'.tr()),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Text('Your chatbot URL:'.tr()),
                                const SizedBox(width: 16),
                                Text(url),
                                const SizedBox(width: 16),
                                IconButton(
                                  icon: const Icon(Icons.copy),
                                  onPressed: () {
                                    html.window.navigator.clipboard
                                        ?.writeText(url);
                                    showAlertDialog(
                                        context, 'Copied to clipboard'.tr());
                                  },
                                ),
                              ],
                            )
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

  _downloadImage() async {
    try {
      final qrValidationResult = QrValidator.validate(
        data: url,
        version: QrVersions.auto,
        errorCorrectionLevel: QrErrorCorrectLevel.L,
      );

      if (qrValidationResult.status == QrValidationStatus.valid) {
        final boundary =
            qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
        final image = await boundary.toImage();
        final byteData = await image.toByteData(format: ImageByteFormat.png);
        final pngBytes = byteData!.buffer.asUint8List();

        // Save the image to the device
        if (kIsWeb) {
          final blob = html.Blob([pngBytes]);
          final url = html.Url.createObjectUrlFromBlob(blob);
          html.AnchorElement(href: url)
            ..setAttribute("download", "qr_code.png")
            ..click();
          html.Url.revokeObjectUrl(url);
        } else {
          final result = await ImageGallerySaver.saveImage(pngBytes,
              quality: 100, name: "qr_code");

          if (result['isSuccess']) {
            if (mounted) {
              showAlertDialog(context, 'QR Code saved'.tr());
            }
          }
        }
      } else {
        showAlertDialog(context, 'Failed to save QR Code'.tr());
      }
    } catch (e) {
      if (mounted) {
        showAlertDialog(context, '${'Error:'.tr()} $e');
      }
    }
  }
}
