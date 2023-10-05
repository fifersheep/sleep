import 'package:flutter/widgets.dart';
import 'package:sleep/src/presentation/colors.dart';

class TimeBlock extends StatelessWidget {
  const TimeBlock(this.cycles, this.time, this.color, {super.key});

  final String cycles;
  final String time;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double textSize = 16;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 0.5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -textSize / 2,
            child: Container(
              color: ThemeColors.primary,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  cycles,
                  style: TextStyle(fontSize: textSize, color: color),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
            child: Text(
              time,
              style: TextStyle(color: color, fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}
