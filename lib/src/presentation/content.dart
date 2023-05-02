import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:sleep/src/presentation/colors.dart';
import 'package:sleep/src/presentation/time_block.dart';

/// Displays a list of SampleItems.
class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  late Timer _timer;
  late DateTime _dateTime;

  @override
  void initState() {
    _dateTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
    super.initState();
  }

  String time(int hours, [int minutes = 0]) =>
      DateFormat("HH:mm").format(_dateTime.add(Duration(hours: hours, minutes: minutes)));

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: ThemeColors.white40,
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
              children: [
                Text(
                  time(0),
                  style: const TextStyle(color: ThemeColors.white40, fontSize: 50),
                ),
                const SizedBox(height: 20),
                TimeBlock(time(7, 30), ThemeColors.white80),
                const SizedBox(height: 20),
                TimeBlock(time(6), ThemeColors.white60),
                const SizedBox(height: 20),
                TimeBlock(time(4, 30), ThemeColors.white40),
                const SizedBox(height: 20),
                TimeBlock(time(3), ThemeColors.white20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
