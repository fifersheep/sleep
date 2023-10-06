import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sleep/src/presentation/colors.dart';
import 'package:sleep/src/presentation/time_block.dart';

class Alarm extends StatefulWidget {
  const Alarm({super.key});

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    _selectedTime = TimeOfDay.now();
    super.initState();
  }

  String hoursBeforeSelectedTime(int hours, [int minutes = 0]) {
    int totalMinutes = _selectedTime.hour * 60 + _selectedTime.minute - (hours * 60 + minutes);

    while (totalMinutes < 0) {
      totalMinutes += 24 * 60;
    }

    int newHour = totalMinutes ~/ 60 % 24;
    int newMinutes = totalMinutes % 60;

    return MaterialLocalizations.of(context).formatTimeOfDay(
      TimeOfDay(hour: newHour, minute: newMinutes),
      alwaysUse24HourFormat: true,
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _selectTime(context),
              child: Text(
                hoursBeforeSelectedTime(0),
                style: const TextStyle(color: ThemeColors.white40, fontSize: 50),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.alarmMessage,
              style: const TextStyle(color: ThemeColors.white60, fontSize: 16),
            ),
            const SizedBox(height: 30),
            TimeBlock("Six", hoursBeforeSelectedTime(9, 15), ThemeColors.white80),
            const SizedBox(height: 20),
            TimeBlock("Five", hoursBeforeSelectedTime(7, 45), ThemeColors.white60),
            const SizedBox(height: 20),
            TimeBlock("Four", hoursBeforeSelectedTime(6, 15), ThemeColors.white40),
            const SizedBox(height: 20),
            TimeBlock("Three", hoursBeforeSelectedTime(4, 45), ThemeColors.white20),
          ],
        ),
      );
}
