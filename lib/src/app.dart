import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sleep/src/presentation/colors.dart';

import 'presentation/content.dart';

class SleepApp extends StatelessWidget {
  const SleepApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: ThemeColors.primary),
    );
    return MaterialApp(
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ru'),
      ],
      theme: ThemeData(
        primarySwatch: ThemeColors.purple,
        fontFamily: 'Montserrat',
      ),
      home: const Scaffold(body: Content()),
    );
  }
}
