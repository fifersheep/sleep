import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sleep/src/presentation/colors.dart';
import 'package:sleep/src/presentation/time_block.dart';

/// Displays a list of SampleItems.
class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: ThemeColors.white50,
    );
    return SafeArea(
      child: Container(
        color: ThemeColors.primary,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Text(
                AppLocalizations.of(context)!.appTitle,
                style: textStyle.copyWith(fontSize: 50),
              ),
            ),
            const SizedBox(height: 30),
            Column(
              children: const [
                TimeBlock("00:00"),
                SizedBox(height: 20),
                TimeBlock("00:30"),
                SizedBox(height: 20),
                TimeBlock("01:00"),
                SizedBox(height: 20),
                TimeBlock("01:30"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
