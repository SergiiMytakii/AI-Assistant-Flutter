import 'package:ai_assiatant_flutter/main.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

Future logError(Object error, StackTrace? stackTrace) async {
  if (isProdMode) {
    await FirebaseCrashlytics.instance.recordError(error, stackTrace);
  }
}
