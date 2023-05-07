import 'package:flutter/widgets.dart';
import 'package:sleep/src/presentation/colors.dart';

class TimeBlock extends StatelessWidget {
  const TimeBlock(this.cycles, this.time, this.color, {super.key});

  final String cycles;
  final String time;
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
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: -55,
              child: Text(
                cycles,
                style: const TextStyle(
                  fontSize: 80,
                  color: ThemeColors.white5,
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
