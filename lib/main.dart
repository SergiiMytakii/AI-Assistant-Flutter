import 'dart:async';
import 'package:ai_assiatant_flutter/core/constants/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ai_assiatant_flutter/flavors.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:ai_assiatant_flutter/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app.dart';
import 'dart:html' as html;
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart'
    show PlatformDispatcher, kDebugMode, kIsWeb;
import 'firebase_config_dev.dart' as dev_config;
import 'firebase_config_prod.dart' as prod_config;
import 'dart:developer' as developer;

late SharedPreferences prefs;
final logger = Logger();
final isProdMode = F.appFlavor == Flavor.prod;
const openAIKey = String.fromEnvironment('openAIKey');
const supabaseKey = String.fromEnvironment('supabaseKey');
void main() async {
  print('app started');

  developer.log('app started');

  runZonedGuarded(
    () async {
      if (openAIKey.isEmpty || supabaseKey.isEmpty) {
        throw Exception(
            'Environment variables openAIKey and supabaseKey must be provided.');
      }
      WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();
      _activateCrashlitics();
      await _firebaseInit();
      configureDependencies(isProdMode ? Flavor.prod.name : Flavor.dev.name);
      prefs = await SharedPreferences.getInstance();
      FirebaseAnalytics.instance
          .logAppOpen(callOptions: AnalyticsCallOptions(global: true));
      await Supabase.initialize(
          url: 'https://fcyrtxlsonebldebworq.supabase.co',
          anonKey: supabaseKey);

      runApp(EasyLocalization(
          useOnlyLangCode: true,
          supportedLocales: languagesCodes.keys
              .map((languageCode) => Locale(languageCode))
              .toList(),
          path: 'assets/translations',
          fallbackLocale: const Locale('en', 'US'),
          child: const App()));
    },
    (error, stackTrace) {
      if (kDebugMode) {
        print('Error: $error');
        print('StackTrace: $stackTrace');
      }
      logger.e(error, stackTrace: stackTrace);
      if (isProdMode) {
        FirebaseCrashlytics.instance
            .recordError(error, stackTrace, printDetails: true);
      }
    },
  );
}

Future<void> _firebaseInit() async {
  final firebaseConfig =
      isProdMode ? prod_config.firebaseConfig : dev_config.firebaseConfig;
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
    print('Firebase initialized');
  } else {
    await Firebase.initializeApp();
  }
}

void _activateCrashlitics() {
  FlutterError.onError = (errorDetails) {
    logger.e(errorDetails);
    if (isProdMode) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    }
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    logger.e(error, stackTrace: stack);
    if (isProdMode) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    }
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
