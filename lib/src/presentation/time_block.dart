import 'package:flutter/widgets.dart';
import 'package:sleep/src/presentation/colors.dart';

class TimeBlock extends StatelessWidget {
  const TimeBlock(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ThemeColors.white50,
            width: 0.5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            text,
            style: const TextStyle(color: ThemeColors.white50, fontSize: 30),
          ),
        ),
      );
}
