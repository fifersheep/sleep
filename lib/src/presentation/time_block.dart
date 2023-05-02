import 'package:flutter/widgets.dart';

class TimeBlock extends StatelessWidget {
  const TimeBlock(this.text, this.color, {super.key});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
            width: 0.5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Text(
            text,
            style: TextStyle(color: color, fontSize: 30),
          ),
        ),
      );
}
