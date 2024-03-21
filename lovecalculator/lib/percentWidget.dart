import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentWidget extends StatefulWidget {
  const PercentWidget({super.key, required this.percent});
  final double percent;

  @override
  State<PercentWidget> createState() => _PercentWidgetState();
}

class _PercentWidgetState extends State<PercentWidget> {
  late final percent2 = widget.percent * 100;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularPercentIndicator(
        radius: 100,
        lineWidth: 10,
        percent: widget.percent,
        animation: true,
        animationDuration: 1000,
        center: Text(
          percent2.toInt().toString() + '%',
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
