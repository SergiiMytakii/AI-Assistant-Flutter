import 'package:ai_assiatant_flutter/presentation/bloc/my_multibloc_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ai_assiatant_flutter/core/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ai_assiatant_flutter/theme.dart';

import 'flavors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _flavorBanner(
        child: MyMultiblocProvider(
          child: MaterialApp.router(
            routerConfig: router,
            title: F.title,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.system,
            locale: context.locale,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
          ),
        ),
        show: kDebugMode,
      ),
    );
  }

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show
          ? Banner(
              location: BannerLocation.topStart,
              message: F.name,
              color: Colors.green.withOpacity(0.6),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0,
                  letterSpacing: 1.0),
              // textDirection: TextDirection.LTR ,
              child: child,
            )
          : Container(
              child: child,
            );
}
