import 'package:flutter/widgets.dart';
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
    return WidgetsApp(
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
      color: ThemeColors.primary,
      builder: (context, child) => const Content(),
    );
  }
}
