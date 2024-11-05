import 'package:ai_assiatant_flutter/presentation/bloc/my_multibloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:ai_assiatant_flutter/core/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ai_assiatant_flutter/theme.dart';

import 'flavors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MyMultiblocProvider(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        title: F.title,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
      ),
    );
  }
}
