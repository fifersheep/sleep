import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:sleep/src/presentation/colors.dart';
import 'package:sleep/src/presentation/time_block.dart';

/// Displays a list of SampleItems.
class Now extends StatefulWidget {
  const Now({super.key});

  @override
  State<Now> createState() => _NowState();
}

class _NowState extends State<Now> {
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
  Widget build(BuildContext context) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              time(0),
              style: const TextStyle(color: ThemeColors.white40, fontSize: 50),
            ),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.nowMessage,
              style: const TextStyle(color: ThemeColors.white60, fontSize: 16),
            ),
            const SizedBox(height: 30),
            TimeBlock("Six", time(9, 15), ThemeColors.white80),
            const SizedBox(height: 20),
            TimeBlock("Five", time(7, 45), ThemeColors.white60),
            const SizedBox(height: 20),
            TimeBlock("Four", time(6, 15), ThemeColors.white40),
            const SizedBox(height: 20),
            TimeBlock("Three", time(4, 45), ThemeColors.white20),
          ],
        ),
      );
}
