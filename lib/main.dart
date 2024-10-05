import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_template/flavors.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'app.dart';
import 'dart:html' as html;
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart'
    show PlatformDispatcher, kDebugMode, kIsWeb;
import 'firebase_config_dev.dart' as dev_config;
import 'firebase_config_prod.dart' as prod_config;

FutureOr<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      _activateCrashlitics();

      final firebaseConfig = F.appFlavor == Flavor.prod
          ? prod_config.firebaseConfig
          : dev_config.firebaseConfig;
      if (kIsWeb) {
        //only for web
        preventSystemContextMenu();
        setUrlStrategy(PathUrlStrategy());
        await Firebase.initializeApp(
          options: FirebaseOptions(
            apiKey: firebaseConfig['apiKey'] as String,
            authDomain: firebaseConfig['authDomain'],
            projectId: firebaseConfig['projectId'] as String,
            storageBucket: firebaseConfig['storageBucket'],
            messagingSenderId: firebaseConfig['messagingSenderId'] as String,
            appId: firebaseConfig['appId'] as String,
            measurementId: firebaseConfig['measurementId'],
          ),
        );
      } else {
        await Firebase.initializeApp();
      }
      runApp(const App());
    },
    (error, stackTrace) {
      if (kDebugMode) {
        print('Error: $error');
        print('StackTrace: $stackTrace');
      }
      FirebaseCrashlytics.instance
          .recordError(error, stackTrace, printDetails: true);
    },
  );
}

void _activateCrashlitics() {
  final logger = Logger();
  FlutterError.onError = (errorDetails) {
    logger.e(errorDetails);
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    logger.e(error);
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}

void preventSystemContextMenu() {
  final script = html.ScriptElement()
    ..type = 'text/javascript'
    ..innerHtml = '''
      document.addEventListener('contextmenu', function(event) {
        event.preventDefault();
      });
    ''';
  html.document.head!.append(script);
}
