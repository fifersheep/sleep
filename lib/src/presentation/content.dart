import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sleep/src/presentation/alarm.dart';
import 'package:sleep/src/presentation/colors.dart';
import 'package:sleep/src/presentation/now.dart';

enum Mode { now, hours }

/// Displays a list of SampleItems.
class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  Mode _selectedSegment = Mode.now;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: ThemeColors.white40,
    );
    return SafeArea(
      child: Container(
        color: ThemeColors.primary,
        child: Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
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
                // Integrated the segmented control directly here
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CupertinoSlidingSegmentedControl<Mode>(
                      backgroundColor: ThemeColors.primaryDark,
                      thumbColor: ThemeColors.primaryLight,
                      groupValue: _selectedSegment,
                      onValueChanged: (Mode? value) {
                        if (value != null) {
                          setState(() {
                            _selectedSegment = value;
                          });
                        }
                      },
                      children: {
                        Mode.now: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            AppLocalizations.of(context)!.now,
                            style: const TextStyle(color: CupertinoColors.white),
                          ),
                        ),
                        Mode.hours: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            AppLocalizations.of(context)!.alarm,
                            style: const TextStyle(color: CupertinoColors.white),
                          ),
                        ),
                      }),
                ),
                const SizedBox(height: 16.0),
                _selectedSegment == Mode.now ? const Now() : const Alarm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
